//
//  PPTextView.m
//  pengpeng
//
//  Created by wang on 2019/3/6.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPTextView.h"

@implementation PPTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI {
    self.pp_placeLabel = [[UILabel alloc] init];
    [self addSubview:self.pp_placeLabel];
    self.pp_placeLabel.frame = CGRectMake(0, 5, self.width, 20);
    self.pp_placeLabel.textColor = [UIColor colorWithHex:0xa2a2a2];
    self.pp_placeLabel.font = [UIFont systemFontOfSize:10];
    self.pp_placeLabel.hidden = YES;
    
    self.pp_textField = [[UITextField alloc] init];
    [self addSubview:self.pp_textField];
    _pp_textField.frame = CGRectMake(0, self.pp_placeLabel.height, self.width, 30);
    _pp_textField.textColor = [UIColor colorWithHex:0x3e3e3e];
    _pp_textField.font = [UIFont systemFontOfSize:14];
    [_pp_textField addTarget:self action:@selector(textfieldChanged:) forControlEvents:UIControlEventEditingChanged];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - 1, self.width, 1)];
    [self addSubview:line];
    line.backgroundColor = [UIColor colorWithHex:0xa2a2a2];
    
}
-(void)textfieldChanged:(UITextField *)textfield {
    self.pp_placeLabel.hidden = textfield.text.length == 0;
    if (self.textBlock) {
        self.textBlock(textfield.text);
    }
}

-(void)setPlaceHolder:(NSString *)placeHolder {
    _placeHolder = placeHolder;
    _pp_textField.placeholder = placeHolder;
    _pp_placeLabel.text = placeHolder;
}
-(void)setText:(NSString *)text {
    _text = text;
    self.pp_textField.text = text;
    self.pp_placeLabel.hidden = !text;
}

@end
