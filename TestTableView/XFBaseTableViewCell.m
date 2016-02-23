//
//  XFBaseTableViewCell.m
//  TestTableView
//
//  Created by mc008 on 16/2/21.
//  Copyright © 2016年 mc008. All rights reserved.
//

#import "XFBaseTableViewCell.h"

@implementation XFBaseTableViewCell

- (instancetype)initWithCellIdentifer:(NSString *)cellIdentifer {
    
    return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass(self);
}

+ (id)cellForTableView:(UITableView *)tableView {

    NSString *cellIdentifer = [self cellIdentifier];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    
    if (cell == nil) {
        
        //先看看能不能从xib加载
        NSBundle *classBundle = [NSBundle bundleForClass:self];
        
        NSString *path = [classBundle pathForResource:NSStringFromClass(self) ofType:@"nib"];
        
        if (path.length > 0) {
            
            UINib *nib = [UINib nibWithNibName:NSStringFromClass(self) bundle:classBundle];
            
            [tableView registerNib:nib forCellReuseIdentifier:cellIdentifer];
            
            NSArray *nibObjects = [nib instantiateWithOwner:nil options:nil];
            
            NSAssert2(([nibObjects count] > 0) &&
                      [[nibObjects firstObject] isKindOfClass:self], @"Nib '%@' does not appert a valid %@", NSStringFromClass(self), NSStringFromClass(self));
            
            cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];

        } else {
            
            cell = [[self alloc] initWithCellIdentifer:cellIdentifer];
        }
    }
    
    return cell;
}


@end
