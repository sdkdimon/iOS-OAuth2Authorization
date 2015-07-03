//
//  SocialCredentials.h
//  OAuthClient
//
//  Created by daemmon on 7/1/15.
//  Copyright (c) 2015 daemmon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OA2Credentials.h"
@interface SocialCredentials : NSObject <OA2Credentials>

@property(strong,nonatomic) NSString *accessToken;
@property(strong,nonatomic) NSDate *expiresAt;

@end
