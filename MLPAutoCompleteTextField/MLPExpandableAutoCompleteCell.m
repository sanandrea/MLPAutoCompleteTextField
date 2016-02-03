//
//  MLPExpandableAutoCompleteCell.m
//  MLPAutoCompleteDemo
//
//  Created by Andi Palo on 03/02/16.
//  Copyright © 2016 Mainloop. All rights reserved.
//

#import "MLPExpandableAutoCompleteCell.h"

@implementation MLPExpandableAutoCompleteCell

#define MAX_AUTO_ROWS 3

- (void)awakeFromNib {
    // Initialization code
    self.theAutoCompleteField.autoCompleteDataSource = self;
    self.theAutoCompleteField.autoCompleteDelegate = self;
    self.theAutoCompleteField.maximumEditDistance = 0;
    self.theAutoCompleteField.maximumNumberOfAutoCompleteRows = MAX_AUTO_ROWS;
    self.theAutoCompleteField.autoCompleteTableBorderColor = [UIColor blueColor];
    self.theAutoCompleteField.autoCompleteTableBorderWidth = 1;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
  didSelectAutoCompleteString:(NSString *)selectedString
       withAutoCompleteObject:(id<MLPAutoCompletionObject>)selectedObject
            forRowAtIndexPath:(NSIndexPath *)indexPath{

    [self.expandDelegate collapseTableViewCell:self];
}
- (void)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
willShowAutoCompleteTableView:(UITableView *)autoCompleteTableView{
    CGFloat expand = (MAX_AUTO_ROWS + 0.5) * self.theAutoCompleteField.autoCompleteRowHeight;
    [self.expandDelegate expandTableViewCell:self withHeight:expand];
}

- (void)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
 didChangeNumberOfSuggestions:(NSInteger)numberOfSuggestions{
    if (numberOfSuggestions == 0) {
        [self.expandDelegate collapseTableViewCell:self];
    }
}

@end
