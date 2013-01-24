//
//  FirstViewController.m
//  Wireframe
//
//  Created by leeloo on 03/01/2013.
//  Copyright (c) 2013 cocoa-ocelot. All rights reserved.
//

#import "FirstViewController.h"
#import "FourthViewController.h"
#import "RRPartStore.h"
#import "RRPartType.h"
#import <AVFoundation/AVFoundation.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    // the delegate receives decode results
    self.readerView.readerDelegate = self;
    
    // ensure initial camera orientation is correctly set
    UIApplication *app = [UIApplication sharedApplication];
    [self.readerView willRotateToInterfaceOrientation: app.statusBarOrientation
                                             duration: 0];
    
    // you can use this to support the simulator
    if(TARGET_IPHONE_SIMULATOR) {
        cameraSim = [[ZBarCameraSimulator alloc]
                     initWithViewController: self];
        cameraSim.readerView = self.readerView;
    }
    
    self.readerView.showsFPS = YES;
    
    self.readerView.torchMode = AVCaptureTorchModeOff;
}


- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) orient
{
    // auto-rotation is supported
    return(YES);
}

- (void) willRotateToInterfaceOrientation: (UIInterfaceOrientation) orient
                                 duration: (NSTimeInterval) duration
{
    // compensate for view rotation so camera preview is not rotated
    [self.readerView willRotateToInterfaceOrientation: orient
                                             duration: duration];
}

- (void) willAnimateRotationToInterfaceOrientation: (UIInterfaceOrientation) orient
                                          duration: (NSTimeInterval) duration
{
    // perform rotation in animation loop so camera preview does not move
    // wrt device orientation
    [self.readerView setNeedsLayout];
}

- (void) viewDidAppear: (BOOL) animated
{
    // run the reader when the view is visible
    [self.readerView start];
}

- (void) viewWillDisappear: (BOOL) animated
{
    [self.readerView stop];
}

- (void) readerView: (ZBarReaderView *) view
     didReadSymbols: (ZBarSymbolSet *) syms
          fromImage: (UIImage*) img
{
    // do something useful with results
    for(ZBarSymbol *sym in syms) {
        self.resultText.text = sym.data;
        break;
    }
    
    // find the productID in the sharedStore
    NSArray *store = [[RRPartStore sharedStore] allItems];
    NSString *productID = self.resultText.text;
    NSPredicate *p = [NSPredicate predicateWithFormat:@"productID == %@", productID];
    NSArray *parts = [store filteredArrayUsingPredicate:p];
    
    // did we find a part??
    // if(part) --> performSegue
    if ([parts count] > 0) {
        self.selectedPart = [parts objectAtIndex:0];
        NSLog(@"Selected Part: %@, %@", self.selectedPart.productID, self.selectedPart.name);
        [self performSegueWithIdentifier:@"PartIdentifiedSegue" sender:self];
    }


}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"PartIdentifiedSegue"]) {
        
        // Get destination view
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        FourthViewController *vc = (FourthViewController *)navController.topViewController;
        
        [vc setSelectedPartType:self.selectedPart];
        
        // Pass the information to your destination view
        //vc.selectedPartCell.productCodeLabel.textLabel = self.selectedPart.productID;
        //vc.selectedPartCell.descriptionLabel.textLabel = self.selectedPart.name;

    }
}

- (IBAction)lightButtonPressed:(id)sender {
    if (self.readerView.torchMode == AVCaptureTorchModeOff) {
        self.readerView.torchMode = AVCaptureTorchModeOn;
    } else {
        self.readerView.torchMode = AVCaptureTorchModeOff;
    }
}
@end