//
//  RRMaintenance.h
//  Wireframe
//
//  Created by leeloo on 23/01/2013.
//  Copyright (c) 2013 cocoa-ocelot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RRPart;

@interface RRMaintenance : NSManagedObject

@property (nonatomic, retain) NSString * site;
@property (nonatomic, retain) NSString * maintenanceType;
@property (nonatomic, retain) NSString * turbine;
@property (nonatomic, retain) NSDate * dateOfMaintenance;
@property (nonatomic, retain) RRPart *part;

@end
