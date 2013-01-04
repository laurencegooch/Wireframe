//
//  FirstViewController.h
//  Wireframe
//
//  Created by leeloo on 03/01/2013.
//  Copyright (c) 2013 cocoa-ocelot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <ZBarReaderViewDelegate>
{
    ZBarCameraSimulator *cameraSim;
}

@property (nonatomic, retain) IBOutlet ZBarReaderView *readerView;
//@property (nonatomic, retain) IBOutlet UITextView *resultText;

@end
