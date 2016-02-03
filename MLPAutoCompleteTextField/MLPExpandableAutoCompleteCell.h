//
//  MLPExpandableAutoCompleteCell.h
//  MLPAutoCompleteDemo
//
//  Created by Andi Palo on 03/02/16.
//  Copyright © 2016 Mainloop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLPAutoCompleteTextField.h"
#import "MLPAutoCompletionObject.h"

@protocol MLPExpandableAutoComplete <NSObject>

- (void) expandTableViewCell:(UITableViewCell*) cell withHeight:(CGFloat) newHeight;
- (void) collapseTableViewCell:(UITableViewCell*) cell;

@end

@interface MLPExpandableAutoCompleteCell : UITableViewCell<MLPAutoCompleteTextFieldDelegate>

@property (strong, nonatomic) IBOutlet MLPAutoCompleteTextField *theAutoCompleteField;
@property (strong, nonatomic) id<MLPExpandableAutoComplete> expandDelegate;

@property (strong, nonatomic) id<MLPAutoCompleteTextFieldDataSource> dataSource;

@end
