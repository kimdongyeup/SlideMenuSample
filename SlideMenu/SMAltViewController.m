//
//  SMAltViewController.m
//  SlideMenu
//
//  Created by kshuin on 12/06/21.
//  Copyright (c) 2012年 http://www.huin-lab.com All rights reserved.
//

#import "SMAltViewController.h"

@interface SMAltViewController ()

@end

@implementation SMAltViewController

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
    
    CGRect rect = self.view.bounds;
    self.webView = [[UIWebView alloc] initWithFrame:rect];
    [self.view addSubview:self.webView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    NSString *urlString = @"http://m.google.com";
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
