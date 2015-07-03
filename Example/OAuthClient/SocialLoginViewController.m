//
//  SocialLoginViewController.m
//  OAuthClient
//
//  Created by daemmon on 7/2/15.
//  Copyright (c) 2015 daemmon. All rights reserved.
//

#import "SocialLoginViewController.h"

@interface SocialLoginViewController ()
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UINavigationItem *navItem;

@end

@implementation SocialLoginViewController


-(void)setupControls{
    [[self webView] setDelegate:self];
    UIBarButtonItem *cancelBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(dismiss)];
    [_navItem setLeftBarButtonItem:cancelBarButtonItem];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupControls];
    
}

-(void)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
