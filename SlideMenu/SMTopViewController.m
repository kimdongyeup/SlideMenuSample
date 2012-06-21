//
//  SMTopViewController.m
//  SlideMenu
//
//  Created by kshuin on 12/06/21.
//  Copyright (c) 2012年 http://www.huin-lab.com All rights reserved.
//

#import "SMTopViewController.h"

@interface SMTopViewController ()
{
    __weak NSObject<SMSlideViewControllerDelegate> *_delegate;
}

- (void)_menuButtonPushed:(id)sender;

@end

@implementation SMTopViewController

@synthesize delegate = _delegate;
@synthesize navigationBar = _navigationBar;

@synthesize webView = _webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(_menuButtonPushed:)];
    UINavigationItem *items = [[UINavigationItem alloc] initWithTitle:@"Contents"];
    [items setLeftBarButtonItem:menuButton];
    
    [self.navigationBar pushNavigationItem:items animated:NO];
    
    self.view.backgroundColor = [UIColor greenColor];
/*
    CGRect bounds = self.view.bounds;
    bounds.origin.y = 44.f;
    bounds.size.height = 480.f - 44.f;
    self.webView = [[UIWebView alloc] initWithFrame:bounds];
    
    NSString *urlString = @"http://mobile.twitter.com";
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    [self.webView loadRequest:request];

    [self.view addSubview:self.webView];
*/
    [self.view addSubview:self.navigationBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - IBAction

- (void)_menuButtonPushed:(id)sender
{
    if([self.delegate conformsToProtocol:@protocol(SMSlideViewControllerDelegate)]){
        [self.delegate performSelectorOnMainThread:@selector(toggleShowingUnderView) withObject:nil waitUntilDone:NO];
    }
}

@end
