//
//  MLPExpandableTableViewController.m
//  MLPAutoCompleteDemo
//
//  Created by Andi Palo on 03/02/16.
//  Copyright © 2016 Mainloop. All rights reserved.
//

#import "MLPExpandableTableViewController.h"

@interface MLPExpandableTableViewController ()

@property (nonatomic, strong) NSIndexPath *expandableIndexPath;
@property (nonatomic, assign) CGFloat expandedSize;

@end

@implementation MLPExpandableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [super numberOfSectionsInTableView:tableView];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ((self.expandableIndexPath != nil) && ([indexPath compare:self.expandableIndexPath] == NSOrderedSame)) {
        return self.expandedSize;
    }
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];
}

- (void) expandTableViewCell:(UITableViewCell*) cell withHeight:(CGFloat) newHeight{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    self.expandedSize = newHeight;
    self.expandableIndexPath = indexPath;
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}
- (void) collapseTableViewCell:(UITableViewCell*) cell{
    self.expandableIndexPath = nil;
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

@end
