//
//  SMSlideMenuViewController.h
//  SlideMenu
//
//  Created by kshuin on 12/06/21.
//  Copyright (c) 2012年 http://www.huin-lab.com All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol SMSlideViewControllerDelegate

- (void)toggleShowingUnderView;

@end

@interface SMSlideViewController : UIViewController<SMSlideViewControllerDelegate>
{
    UIViewController *_topViewController;
    UIViewController *_underRightViewController;
}

@property (strong, nonatomic) UIViewController *topViewController;
@property (strong, nonatomic) UIViewController *underRightViewController;

@property (nonatomic) BOOL isShowingUnderRightView;

@end