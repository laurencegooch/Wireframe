//
//  Part.h
//  Wireframe
//
//  Created by leeloo on 11/01/2013.
//  Copyright (c) 2013 cocoa-ocelot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Part : NSObject

@property (nonatomic, copy) NSString *productCode;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, strong) UIImage *thumbnail;

@end
