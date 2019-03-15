//
//  PPTextView.h
//  pengpeng
//
//  Created by wang on 2019/3/6.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^textBlock)(NSString *taxt);

@interface PPTextView : UIView
@property (nonatomic, strong)UITextField *pp_textField;
@property (nonatomic, strong)UILabel *pp_placeLabel;
@property (nonatomic, strong)NSString *placeHolder;
@property (nonatomic, strong)NSString *text;
@property (nonatomic,copy)textBlock textBlock;

@end

NS_ASSUME_NONNULL_END
