//
//  RRPart.h
//  Wireframe
//
//  Created by leeloo on 23/01/2013.
//  Copyright (c) 2013 cocoa-ocelot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RRMaintenanceEvent, RRPartType;

@interface RRPart : NSManagedObject

@property (nonatomic, retain) NSString * serialNumber;
@property (nonatomic, retain) NSSet *maintenanceEvents;
@property (nonatomic, retain) RRPartType *partType;
@end

@interface RRPart (CoreDataGeneratedAccessors)

- (void)addMaintenanceEventsObject:(RRMaintenanceEvent *)value;
- (void)removeMaintenanceEventsObject:(RRMaintenanceEvent *)value;
- (void)addMaintenanceEvents:(NSSet *)values;
- (void)removeMaintenanceEvents:(NSSet *)values;

@end
