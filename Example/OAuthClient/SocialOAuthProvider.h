//
//  FBOAuthProvider.h
//  OAuthClient
//
//  Created by daemmon on 6/29/15.
//  Copyright (c) 2015 daemmon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OA2Provider.h"
@interface SocialOAuthProvider : NSObject <OA2Provider>
@property(strong,nonatomic) NSString *clientToken;
@property(strong,nonatomic) NSString *name;
@property(strong,nonatomic) NSString *clientId;
@property(strong,nonatomic) NSString *redirectURLString;
@property(strong,nonatomic) NSString *authorizeURLString;
@property(strong,nonatomic) NSString *scope;
@end
