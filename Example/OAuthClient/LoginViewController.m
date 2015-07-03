//
//  ViewController.m
//  OAuthClient
//
//  Created by daemmon on 6/28/15.
//  Copyright (c) 2015 daemmon. All rights reserved.
//

#import "LoginViewController.h"
#import "OA2Authorization.h"
#import "SocialLoginViewController.h"
#import "SocialOAuthProvider.h"
#import "OA2Credentials.h"
#import "SocialCredentials.h"

typedef enum {
    SocialTypeFB = 0,
    SocialTypeVK
}SocialType;

@interface LoginViewController ()
@property(strong,nonatomic) OA2Authorization *oAuthAuthorization;
@property (strong, nonatomic) IBOutlet UIButton *vkLoginButton;
@property (strong, nonatomic) IBOutlet UIButton *fbLoginButton;
@property (strong, nonatomic) IBOutlet UIButton *clearCookiesButton;

@property(strong,nonatomic) NSDictionary *socialTypeNames;

@end

@implementation LoginViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        [self initialize];
    }
    return self;
}

-(void)initialize{
    _socialTypeNames = @{@(SocialTypeFB) : @"facebook",
                         @(SocialTypeVK) : @"vkontakte"};
}

-(void)setupOAuthAuthorization{
    Class urlHandlerClass = [SocialLoginViewController class];
    Class credentialsClass = [SocialCredentials class];
    
    SocialOAuthProvider *vkProvider = [[SocialOAuthProvider alloc] init];
    [vkProvider setClientId:@"YOUR_APP_ID"];
    [vkProvider setRedirectURLString:@"https://oauth.vk.com/blank.html"];
    [vkProvider setAuthorizeURLString:@"https://oauth.vk.com/authorize"];
    [vkProvider setScope:@"email"];
    [vkProvider setName:_socialTypeNames[@(SocialTypeVK)]];
    [vkProvider setUrlHandlerClass:urlHandlerClass];
    [vkProvider setCredentialsClass:credentialsClass];
    
    SocialOAuthProvider *fbProvider = [[SocialOAuthProvider alloc] init];
    [fbProvider setClientId:@"YOUR_APP_ID"];
    [fbProvider setRedirectURLString:@"https://www.facebook.com/connect/login_success.html"];
    [fbProvider setAuthorizeURLString:@"https://www.facebook.com/dialog/oauth"];
    [fbProvider setScope:@"email"];
    [fbProvider setName:_socialTypeNames[@(SocialTypeFB)]];
    [fbProvider setUrlHandlerClass:urlHandlerClass];
    [fbProvider setCredentialsClass:credentialsClass];
    
    _oAuthAuthorization = [[OA2Authorization alloc] initWithProviders:@[vkProvider,fbProvider]];
}

-(void)setupControls{
    [_fbLoginButton setTag:SocialTypeFB];
    [_vkLoginButton setTag:SocialTypeVK];
    
    [_fbLoginButton addTarget:self action:@selector(loginButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [_vkLoginButton addTarget:self action:@selector(loginButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [_clearCookiesButton addTarget:self action:@selector(clearCookiesButtonTap:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [self setupOAuthAuthorization];
    [self setupControls];
}

-(void)clearCookies{
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *cookies = [cookieStorage cookies];
    for(NSHTTPCookie *cookie in cookies){
        [cookieStorage deleteCookie:cookie];
    }
}


#pragma mark - ViewInteraction

-(void)loginButtonTap:(UIButton *)sender{
    
    NSString *providerName = _socialTypeNames[@([sender tag])];
    
    UIViewController <OA2AuthorizationURLHandler> *urlHandler =  (UIViewController <OA2AuthorizationURLHandler> *)[_oAuthAuthorization authorizeProvider:providerName success:^(id <OA2Credentials> credentials) {
        NSLog(@"access token %@",[credentials accessToken]);
        [urlHandler dismissViewControllerAnimated:YES completion:nil];
    } error:^(NSError *error) {
        [urlHandler dismissViewControllerAnimated:YES completion:nil];
    }];
    [self presentViewController:urlHandler animated:YES completion:^{
        [urlHandler startURLHandling];
    }];
}

-(void)clearCookiesButtonTap:(UIButton *)sender{
    [self clearCookies];
}


@end
