//
//  ZSTile.h
//  PodTest
//
//  Created by shuning zhou on 14-5-17.
//  Copyright (c) 2014年 ZS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZSTileControlDelegate <NSObject>

-(void)touchEnded;

@end

typedef NS_ENUM(NSInteger, ZSTileState){
    ZSTileStateDefault,
    ZSTileStateRed,
    ZSTileStateYellow
};

@interface ZSTileControl : UIControl

@property (nonatomic) ZSTileState tileState;
@property (nonatomic) id<ZSTileControlDelegate> delegate;

@end
