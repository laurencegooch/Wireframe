//
//  FourthViewController.m
//  Wireframe
//
//  Created by leeloo on 11/01/2013.
//  Copyright (c) 2013 cocoa-ocelot. All rights reserved.
//

#import "FourthViewController.h"
#import "PartCell.h"

@interface FourthViewController ()

@end

@implementation FourthViewController
{
    NSMutableArray *arrayTurbines;
    UIActionSheet *actionSheet;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.selectedPartType) {
        self.selectedPartCell.productCodeLabel.text = self.selectedPartType.productID;
        self.selectedPartCell.descriptionLabel.text = self.selectedPartType.name;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
