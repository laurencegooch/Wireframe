//
//  RRMaintenanceEvent.h
//  Wireframe
//
//  Created by leeloo on 23/01/2013.
//  Copyright (c) 2013 cocoa-ocelot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RRPart;

@interface RRMaintenanceEvent : NSManagedObject

@property (nonatomic, retain) NSDate * dateOfMaintenance;
@property (nonatomic, retain) NSString * maintenanceType;
@property (nonatomic, retain) NSString * site;
@property (nonatomic, retain) NSString * turbine;
@property (nonatomic, retain) RRPart *part;

@end
