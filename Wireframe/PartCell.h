//
//  PartCell.h
//  Wireframe
//
//  Created by leeloo on 11/01/2013.
//  Copyright (c) 2013 cocoa-ocelot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PartCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;
@property (weak, nonatomic) IBOutlet UILabel *productCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *serialNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
