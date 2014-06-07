//
//  ZSGame.m
//  PodTest
//
//  Created by shuning zhou on 14-5-18.
//  Copyright (c) 2014年 ZS. All rights reserved.
//

#import "ZSGame.h"

static BOOL yellow;

@implementation ZSGame

+(void)initialize{
    yellow = YES;
}

+(void)switchTurn{
    yellow = !yellow;
}

+(BOOL)yellowsTurn{
    return yellow;
}

@end
