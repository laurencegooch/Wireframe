//
//  RRPartType.h
//  Wireframe
//
//  Created by leeloo on 24/01/2013.
//  Copyright (c) 2013 cocoa-ocelot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RRPart;

@interface RRPartType : NSManagedObject

@property (nonatomic, retain) NSNumber *hasSerialNumber;
@property (nonatomic, retain) NSString *imageKey;
@property (nonatomic, retain) NSString *productID;
@property (nonatomic, retain) UIImage *thumbnail;
@property (nonatomic, retain) NSData *thumbnailData;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSSet *parts;
@end

@interface RRPartType (CoreDataGeneratedAccessors)

- (void)addPartsObject:(RRPart *)value;
- (void)removePartsObject:(RRPart *)value;
- (void)addParts:(NSSet *)values;
- (void)removeParts:(NSSet *)values;

@end
