//
//  XWNaviOneTransition.m
//  trasitionpractice
//
//  Created by YouLoft_MacMini on 15/11/23.
//  Copyright © 2015年 YouLoft_MacMini. All rights reserved.
//

#import "XWNaviTransition.h"
#import "PPHomeViewController.h"
#import "PPMeDetailViewController.h"
#import "PPHomeTableViewCell.h"


@interface XWNaviTransition ()
/**
 *  动画过渡代理管理的是push还是pop
 */
@property (nonatomic, assign) XWNaviOneTransitionType type;

@end

@implementation XWNaviTransition

+ (instancetype)transitionWithType:(XWNaviOneTransitionType)type{
    return [[self alloc] initWithTransitionType:type];
}

- (instancetype)initWithTransitionType:(XWNaviOneTransitionType)type{
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}
/**
 *  动画时长
 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.75;
}
/**
 *  如何执行过渡动画
 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    switch (_type) {
        case XWNaviOneTransitionTypePush:
            [self doPushAnimation:transitionContext];
            break;
            
        case XWNaviOneTransitionTypePop:
            [self doPopAnimation:transitionContext];
            break;
    }
    
}

/**
 *  执行push过渡动画
 */
- (void)doPushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    PPHomeViewController *fromVC = (PPHomeViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    PPMeDetailViewController *toVC = (PPMeDetailViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //拿到当前点击的cell的imageView
    PPHomeTableViewCell *cell = [fromVC.mainTableView cellForRowAtIndexPath:fromVC.currentIndexPath];
    UIView *containerView = [transitionContext containerView];
    //snapshotViewAfterScreenUpdates 对cell的imageView截图保存成另一个视图用于过渡，并将视图转换到当前控制器的坐标
    UIView *tempView = [cell.headImageView snapshotViewAfterScreenUpdates:NO];
    tempView.frame = [cell.headImageView convertRect:toVC.headerView.frame toView: containerView];
    //设置动画前的各个控件的状态
    cell.headImageView.hidden = YES;
    toVC.view.alpha = 0;
    toVC.headerView.hidden = YES;
    //tempView 添加到containerView中，要保证在最前方，所以后添加
    [containerView addSubview:toVC.view];
    [containerView addSubview:tempView];
    //开始做动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:1  options:0 animations:^{
        tempView.frame = [toVC.headerView convertRect:toVC.headerView.bounds toView:containerView];
        toVC.view.alpha = 1;
        
    } completion:^(BOOL finished) {
        tempView.hidden = YES;
        toVC.headerView.hidden = NO;
        //如果动画过渡取消了就标记不完成，否则才完成，这里可以直接写YES，如果有手势过渡才需要判断，必须标记，否则系统不会中动画完成的部署，会出现无法交互之类的bug
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}
/**
 *  执行pop过渡动画
 */
- (void)doPopAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    PPMeDetailViewController *fromVC = (PPMeDetailViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    PPHomeViewController *toVC = (PPHomeViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    PPHomeTableViewCell *cell = [toVC.mainTableView cellForRowAtIndexPath:toVC.currentIndexPath];
    UIView *containerView = [transitionContext containerView];
    //这里的lastView就是push时候初始化的那个tempView
    UIView *tempView = containerView.subviews.lastObject;
    //设置初始状态
    cell.headImageView.hidden = YES;
    fromVC.headerView.hidden = YES;
    tempView.hidden = NO;
    [containerView insertSubview:toVC.view atIndex:0];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.55 initialSpringVelocity:1 / 0.55 options:0 animations:^{
        tempView.frame = [cell.headImageView convertRect:cell.headImageView.bounds toView:containerView];
        fromVC.view.alpha = 0;
    } completion:^(BOOL finished) {
        //由于加入了手势必须判断
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if ([transitionContext transitionWasCancelled]) {//手势取消了，原来隐藏的imageView要显示出来
            //失败了隐藏tempView，显示fromVC.imageView
            tempView.hidden = YES;
            fromVC.headerView.hidden = NO;
        }else{//手势成功，cell的imageView也要显示出来
            //成功了移除tempView，下一次pop的时候又要创建，然后显示cell的imageView
            cell.headImageView.hidden = NO;
            [tempView removeFromSuperview];
        }
    }];
}

@end
