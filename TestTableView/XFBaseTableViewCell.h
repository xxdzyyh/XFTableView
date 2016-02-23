//
//  XFBaseTableViewCell.h
//  TestTableView
//
//  Created by mc008 on 16/2/21.
//  Copyright © 2016年 mc008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XFBaseTableViewCell : UITableViewCell

+ (NSString *)cellIdentifier;

+ (id)cellForTableView:(UITableView *)tableView;

- (instancetype)initWithCellIdentifer:(NSString *)cellIdentifer;

@end
