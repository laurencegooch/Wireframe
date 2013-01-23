//
//  RRImageStore.h
//  Wireframe
//
//  Created by leeloo on 23/10/2012.
//  Copyright (c) 2012 cocoa-ocelot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RRImageStore : NSObject
{
    NSMutableDictionary *dictionary;
}
+ (RRImageStore *)sharedStore;

- (NSString *)imagePathForKey:(NSString *)key;

- (void)setImage:(UIImage *)i forKey:(NSString *)s;
- (UIImage *)imageForKey:(NSString *)s;
- (void)deleteImageForKey:(NSString *)s;

@end
