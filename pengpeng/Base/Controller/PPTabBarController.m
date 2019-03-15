//
//  PPTabBarController.m
//  pengpeng
//
//  Created by wang on 2019/3/5.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPTabBarController.h"
#import "PPHomeViewController.h"
#import "PPActivityViewController.h"
#import "PPMessageViewController.h"
#import "PPMeViewController.h"


@implementation PPTabBarController

- (void)viewDidLoad  {
    [super viewDidLoad];
    [self addChildViewController];
}
-(void)addChildViewController {
    //首页
    PPHomeViewController *homeVC =[[PPHomeViewController alloc]init];
    [self addTabBarControl:homeVC Title:@"嘭嘭" Image:@"tab_home" SelectedImage:@"tab_home_select"];
    
    //活动
    PPActivityViewController *squareVC =[[PPActivityViewController alloc]init];
    [self addTabBarControl:squareVC Title:@"活动" Image:@"tab_activity" SelectedImage:@"tab_activity_select"];
    
    //消息
    PPMessageViewController *chatlistVC = [[PPMessageViewController alloc]init];
    [self addTabBarControl:chatlistVC Title:@"消息" Image:@"tab_info" SelectedImage:@"tab_info_select"];
    
    //我的
    PPMeViewController *meVC =[[PPMeViewController alloc]init];
    [self addTabBarControl:meVC Title:@"我的" Image:@"tab_me" SelectedImage:@"tab_me_select"];
    
}
-(void)addTabBarControl:(UIViewController *)control
                  Title:(NSString *)title
                  Image:(NSString *)image
          SelectedImage:(NSString *)selectedImage {
    
    control.tabBarItem.title = title;
    UIImage *img = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    control.tabBarItem.image = img;
    UIImage *selectImg = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    control.tabBarItem.selectedImage = selectImg;
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHex:0xEC8480],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    PPNavigationController *nc = [[PPNavigationController alloc]initWithRootViewController:control];
    [self addChildViewController:nc];
    
}

@end
