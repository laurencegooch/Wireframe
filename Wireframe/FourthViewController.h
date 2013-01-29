//
//  FourthViewController.h
//  Wireframe
//
//  Created by leeloo on 11/01/2013.
//  Copyright (c) 2013 cocoa-ocelot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PartCell.h"
#import "RRPartType.h"

@interface FourthViewController : UITableViewController

@property (weak, nonatomic) IBOutlet PartCell *selectedPartCell;
@property (strong, nonatomic) RRPartType *selectedPartType;
@end
