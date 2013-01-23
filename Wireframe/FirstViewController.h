//
//  FirstViewController.h
//  Wireframe
//
//  Created by leeloo on 03/01/2013.
//  Copyright (c) 2013 cocoa-ocelot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface FirstViewController : UIViewController <ZBarReaderViewDelegate>
{
    ZBarCameraSimulator *cameraSim;
}

@property (nonatomic, strong) IBOutlet ZBarReaderView *readerView;
@property (nonatomic, retain) IBOutlet UITextView *resultText;

- (IBAction)lightButtonPressed:(id)sender;

@end
