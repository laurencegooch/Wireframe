//
//  RRPartStore.h
//  Wireframe
//
//  Created by leeloo on 23/01/2013.
//  Copyright (c) 2013 cocoa-ocelot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RRPartType;

@interface RRPartStore : NSObject
{
    NSMutableArray *allItems;
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}

- (void)loadAllItems;

@end
