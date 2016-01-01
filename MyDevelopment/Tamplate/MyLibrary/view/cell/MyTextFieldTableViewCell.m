//
//  MyTextFieldTableViewCell.m
//  MyDevelopment
//
//  Created by Petey Mi on 12/28/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import "MyTextFieldTableViewCell.h"

@implementation MyTextFieldTableViewCell
@synthesize textField = _textField;

-(UITextField*)textField
{
    if (_textField == nil) {
        _textField = [[UITextField alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_textField];
    }
    return _textField;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    if (_textField) {
        _textField.frame = CGRectMake(CGRectGetMaxX(self.textField.frame) + 5, 0, CGRectGetWidth(self.contentView.frame) - CGRectGetMaxX(self.textField.frame) - 5, self.contentView.bounds.size.height);
    }
}

@end
