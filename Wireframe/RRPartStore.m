//
//  RRPartStore.m
//  Wireframe
//
//  Created by leeloo on 23/01/2013.
//  Copyright (c) 2013 cocoa-ocelot. All rights reserved.
//

#import "RRPartStore.h"
#import "RRPartType.h"
#import "RRImageStore.h"

@implementation RRPartStore

+ (RRPartStore *)sharedStore
{
    static RRPartStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    
    return sharedStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

- (id)init
{
    self = [super init];
    
    if (self) {
        // Read in PartCD.xcdatamodeld
        model = [NSManagedObjectModel mergedModelFromBundles:nil];
        
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        
        // Where does the SQLite file go?
        NSString *path = [self itemArchivePath];
        NSURL *storeURL = [NSURL fileURLWithPath:path];
        
        // If no existing SQLite file load the imported data sqlite file
        if (![[NSFileManager defaultManager] fileExistsAtPath:[storeURL path]]) {
            NSURL *preloadURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"RRImportCoreData" ofType:@"sqlite"]];
            NSError* err = nil;
            
            if (![[NSFileManager defaultManager] copyItemAtURL:preloadURL toURL:storeURL error:&err]) {
                NSLog(@"Oops, could copy preloaded data");
            }
        }
        
        NSError *error = nil;
        
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                               configuration:nil
                                         URL:storeURL
                                     options:nil
                                       error:&error]) {
            [NSException raise: @"Open failed"
                        format:@"Reason: %@", [error localizedDescription]];
        }
        
        // Create the managed object context
        context = [[NSManagedObjectContext alloc] init];
        [context setPersistentStoreCoordinator:psc];
        
        // The managed object context can manage undo, but we don't need it
        [context setUndoManager:nil];
        
        [self loadAllItems];
    }
    
    return self;
}

- (NSString *)itemArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                       NSUserDomainMask,
                                                                       YES);
    
    // Get one and only document directory from that list
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:@"store.data"];
}

- (BOOL)saveChanges
{
    NSError *error = nil;
    BOOL successful = [context save: &error];
    if (!successful) {
        NSLog(@"Error saving: %@", [error localizedDescription]);
    }
    return successful;
}

// loadAllRRPartTypes
// loadAllRRMaintenanceEvents
// loadAllRRParts
// loadAllRRParts:ForRRPartType
// loadAllRRMaintenanceEvents:ForRRPart
- (void)loadAllItems
{
    if (!allItems) {
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *e = [[model entitiesByName] objectForKey:@"RRPartType"];
        [request setEntity:e];
        
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"productID"
                                                             ascending:YES];

        [request setSortDescriptors:[NSArray arrayWithObject:sd]];
        
        NSError *error;
        NSArray *result = [context executeFetchRequest:request error:&error];
        if (!result) {
            [NSException raise:@"Fetch failed"
                        format:@"Reason: %@", [error localizedDescription]];
        }
        
        allItems = [[NSMutableArray alloc] initWithArray:result];
    }
}


// CreateRRPartType
// CreateRRPart
// CreateRRMaintenanceEvent
- (RRPartType *)createItem
{
    NSLog(@"Adding RRPartType");
    RRPartType *p = [NSEntityDescription insertNewObjectForEntityForName:@"RRPartType"
                                                  inManagedObjectContext:context];
    [allItems addObject:p];
    
    return p;
}

- (void)removeItem:(RRPartType *)p
{
    NSString *key = [p imageKey];
    
    [[RRImageStore sharedStore] deleteImageForKey:key];
    [context deleteObject:p];
    [allItems removeObjectIdenticalTo:p];
    
}

- (NSArray *)allItems
{
    return allItems;
}

- (RRPartType *)partForProductID:(NSString *)productID
{
    NSPredicate *p = [NSPredicate predicateWithFormat:@"productID == %@", productID];
    NSArray *part = [allItems filteredArrayUsingPredicate:p];
    
    if ([part count] > 0) {
        return [part objectAtIndex:0];
    } else
    {
        return nil;
    }
}

@end
