//
//  SMSlideMenuViewController.m
//  SlideMenu
//
//  Created by kshuin on 12/06/21.
//  Copyright (c) 2012年 http://www.huin-lab.com All rights reserved.
//

#import "SMSlideViewController.h"

@interface SMSlideViewController ()

@end

@implementation SMSlideViewController

@synthesize topViewController = _topViewController;
@synthesize underRightViewController = _underRightViewController;
@synthesize isShowingUnderRightView = _isShowingUnderRightView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _isShowingUnderRightView = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Accessor

- (void)setTopViewController:(UIViewController *)topViewController
{
    _topViewController = topViewController;
    [self addChildViewController:topViewController];
    [self.topViewController didMoveToParentViewController:self];

    self.topViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.topViewController.view];
}

- (void)setUnderRightViewController:(UIViewController *)underRightViewController
{
    _underRightViewController = underRightViewController;
    
    if(_underRightViewController){
        [self addChildViewController:underRightViewController];
        [self.underRightViewController didMoveToParentViewController:self];
        
        [self.view insertSubview:self.underRightViewController.view
                         atIndex:0];
        
        self.underRightViewController.view.frame = self.view.bounds;
    }
}


#pragma mark - SMSideViewControllerDelegate

- (void)toggleShowingUnderView
{
    void (^animations)(void);
    if(self.isShowingUnderRightView){
        // reset animation
        animations = ^(void) {
            CGPoint newCenter = self.topViewController.view.center;
            newCenter.x = 160.f;
            self.topViewController.view.center = newCenter;            
        };

    }else{
        // slide animation
        animations = ^(void) {
            CGPoint newCenter = self.topViewController.view.center;
            newCenter.x = 410.f;
            self.topViewController.view.center = newCenter;
        };

        self.topViewController.view.layer.shadowColor = [[UIColor blackColor] CGColor];
        self.topViewController.view.layer.shadowRadius = 10.f;
        self.topViewController.view.layer.shadowOpacity = 0.75f;
    }
    
    
    [UIView animateWithDuration:0.5f
                     animations:animations
                     completion:^(BOOL finished){                         
                         if(self.isShowingUnderRightView){
                             self.isShowingUnderRightView = NO;
                         }else{
                             self.isShowingUnderRightView = YES;
                             self.topViewController.view.layer.shadowOffset = CGSizeZero;
                         }
                     }];
}

@end
