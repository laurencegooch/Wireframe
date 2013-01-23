//
//  ThirdViewController.h
//  Wireframe
//
//  Created by leeloo on 03/01/2013.
//  Copyright (c) 2013 cocoa-ocelot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UITableViewController <UIScrollViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSMutableArray *arrayTurbines;
}


@property (strong, nonatomic) IBOutlet UIPickerView *turbinePicker;

    
@end
