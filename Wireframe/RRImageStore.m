//
//  RRRImageStore.m
//  Wireframe
//
//  Created by leeloo on 23/10/2012.
//  Copyright (c) 2012 cocoa-ocelot. All rights reserved.
//

#import "RRImageStore.h"


@implementation RRImageStore

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

+ (RRImageStore *)sharedStore
{
    static RRImageStore *sharedStore = nil;
    if (!sharedStore) {
        // Create the singleton
        sharedStore = [[super allocWithZone:NULL] init];
    }
    return sharedStore;
}

- (NSString *)imagePathForKey:(NSString *)key
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                       NSUserDomainMask,
                                                                       YES);
        NSString *documentDirectory = documentDirectories[0];
    return [documentDirectory stringByAppendingPathComponent:key];
}


- (id)init
{
    self = [super init];
    if (self) {
        dictionary = [[NSMutableDictionary alloc] init];
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(clearCache:)
                   name:UIApplicationDidReceiveMemoryWarningNotification
                 object:nil];
    }
    return self;
}

- (void)setImage:(UIImage *)i forKey:(NSString *)s
{
    [dictionary setObject:i forKey:s];
    
    // Create full path for image
    NSString *imagePath = [self imagePathForKey:s];
    
    // Turn image into JPEG data,
    NSData *d = UIImageJPEGRepresentation(i, 0.5);
    
    // Write it to full path
    [d writeToFile:imagePath atomically:YES];
}

- (UIImage *)imageForKey:(NSString *)s
{
    // If possible, get it from the dictionary
    UIImage *result = dictionary[s];
    
    if (!result) {
        // Create UIImage object from file
        result = [UIImage imageWithContentsOfFile:[self imagePathForKey:s]];
        
        // if we found an image on the file system, place it into the cache
        if (result) {
            [dictionary setObject:result forKey:s];
        } else {
            NSLog(@"Error: unable to find %@", [self imagePathForKey:s]);
        }
    }
    return result;
}

- (void)deleteImageForKey:(NSString *)s
{
    if (!s) {
        return;
    }
    [dictionary removeObjectForKey:s];
    
    NSString *path = [self imagePathForKey:s];
    [[NSFileManager defaultManager] removeItemAtPath:path
                                               error:NULL];
    
    
    
}

- (void)clearCache:(NSNotification *)note
{
    NSLog(@"flushing %d images out of the cache", [dictionary count]);
    [dictionary removeAllObjects];
}

@end
