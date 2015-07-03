//
//  FBOAuthProvider.m
//  OAuthClient
//
//  Created by daemmon on 6/29/15.
//  Copyright (c) 2015 daemmon. All rights reserved.
//

#import "SocialOAuthProvider.h"
#import "NSURL+Query.h"

@implementation SocialOAuthProvider
@synthesize credentials = _credentials;
@synthesize urlHandlerClass = _urlHandlerClass;
@synthesize credentialsClass = _credentialsClass;

-(NSURL *)authorizeURL{
    NSDictionary *urlQueryDict = @{@"client_id" : _clientId,
                                   @"scope" : _scope,
                                   @"redirect_uri" : _redirectURLString,
                                   @"response_type" : @"token"};
    
    NSURL *url = [NSURL urlWithString:_authorizeURLString query:urlQueryDict];
   
    return url;
}

@end
