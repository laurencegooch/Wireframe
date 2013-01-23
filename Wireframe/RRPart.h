//
//  RRPart.h
//  Wireframe
//
//  Created by leeloo on 23/01/2013.
//  Copyright (c) 2013 cocoa-ocelot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RRMaintenance, RRPartType;

@interface RRPart : NSManagedObject

@property (nonatomic, retain) NSString * serialNumber;
@property (nonatomic, retain) RRPartType *partType;
@property (nonatomic, retain) NSSet *maintenanceHistory;
@end

@interface RRPart (CoreDataGeneratedAccessors)

- (void)addMaintenanceHistoryObject:(RRMaintenance *)value;
- (void)removeMaintenanceHistoryObject:(RRMaintenance *)value;
- (void)addMaintenanceHistory:(NSSet *)values;
- (void)removeMaintenanceHistory:(NSSet *)values;

@end
