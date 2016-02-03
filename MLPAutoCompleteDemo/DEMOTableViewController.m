//
//  DEMOTableViewController.m
//  MLPAutoCompleteDemo
//
//  Created by Andi Palo on 03/02/16.
//  Copyright © 2016 Mainloop. All rights reserved.
//

#import "DEMOTableViewController.h"
#import "DEMODataSource.h"

#define kTitleKey       @"title"   // key for obtaining the data source item's title

#define MAX_ROW 12
#define EXPAND_ROW_INDEX 6

static NSString *kNormalCellID = @"basicCell"; // the cell containing the date picker
static NSString *kAutoCellID = @"expandCell";     // the remaining cells at the end



@interface DEMOTableViewController ()

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) DEMODataSource *dataSource;

@end

@implementation DEMOTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *itemOne = [@{ kTitleKey : @"Item 1" } mutableCopy];
    NSMutableDictionary *itemTwo = [@{ kTitleKey : @"Item 2" } mutableCopy];
    NSMutableDictionary *itemThree = [@{ kTitleKey : @"Item 3" } mutableCopy];
    NSMutableDictionary *itemFour = [@{ kTitleKey : @"Item 4" } mutableCopy];
    NSMutableDictionary *itemFive = [@{ kTitleKey : @"Item 5" } mutableCopy];
    NSMutableDictionary *itemSix = [@{ kTitleKey : @"Item 6" } mutableCopy];
    NSMutableDictionary *itemSeven = [@{ kTitleKey : @"Item 7" } mutableCopy];
    NSMutableDictionary *itemEight = [@{ kTitleKey : @"Item 8" } mutableCopy];
    NSMutableDictionary *itemNine = [@{ kTitleKey : @"Item 9" } mutableCopy];
    NSMutableDictionary *itemTen = [@{ kTitleKey : @"Item 10" } mutableCopy];
    NSMutableDictionary *itemEleven = [@{ kTitleKey : @"Item 11" } mutableCopy];

    
    self.dataArray = @[itemOne, itemTwo, itemThree, itemFour, itemFive, itemSix,
                       itemSeven, itemEight, itemNine, itemTen, itemEleven];
    self.dataSource = [[DEMODataSource alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return MAX_ROW;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    
    NSString *cellID = kNormalCellID;
    if (indexPath.row == EXPAND_ROW_INDEX) {
        cellID = kAutoCellID;
    }
    cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    
    NSInteger modelRow = indexPath.row;
    if (EXPAND_ROW_INDEX <= indexPath.row)
    {
        modelRow--;
    }
    
    NSDictionary *itemData = self.dataArray[modelRow];
    
    // proceed to configure our cell
    if ([cellID isEqualToString:kAutoCellID])
    {
        ((MLPExpandableAutoCompleteCell*) cell).dataSource = self.dataSource;
        ((MLPExpandableAutoCompleteCell*) cell).expandDelegate = self;
    }
    else if ([cellID isEqualToString:kNormalCellID])
    {
        // this cell is a normal cell, just assign it's text label
        //
        cell.textLabel.text = [itemData valueForKey:kTitleKey];
    }
    
    return cell;
}


























@end
