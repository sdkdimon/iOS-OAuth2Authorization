//
//  SocialCredentials.m
//  OAuthClient
//
//  Created by daemmon on 7/1/15.
//  Copyright (c) 2015 daemmon. All rights reserved.
//

#import "SocialCredentials.h"


@implementation SocialCredentials

+(instancetype)credentialsWithQueryDictValue:(NSDictionary *)queryDictValue{
    
    return [[self alloc] initWithQueryDictValue:queryDictValue];
}

-(id)initWithQueryDictValue:(NSDictionary *)queryDictValue{
    if(self = [super init]){
        _accessToken = queryDictValue[@"access_token"];
        NSTimeInterval expiresInTimeinterval = [queryDictValue[@"expires_in"] integerValue];
        _expiresAt = [NSDate dateWithTimeIntervalSinceNow:expiresInTimeinterval];
    }
    
    return self;
}


@end
