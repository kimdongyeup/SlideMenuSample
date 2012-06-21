//
//  SMTopViewController.h
//  SlideMenu
//
//  Created by kshuin on 12/06/21.
//  Copyright (c) 2012年 http://www.huin-lab.com All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SMSlideViewController.h"

@interface SMTopViewController : UIViewController


@property (weak, nonatomic) NSObject<SMSlideViewControllerDelegate> *delegate;
@property (strong, nonatomic) UINavigationBar *navigationBar;

@property (strong, nonatomic) UIWebView *webView;

@end
