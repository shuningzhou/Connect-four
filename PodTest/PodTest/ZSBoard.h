//
//  ZSBoard.h
//  PodTest
//
//  Created by shuning zhou on 14-5-17.
//  Copyright (c) 2014年 ZS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZSBox.h"

@interface ZSBoard : NSObject<ZSBoxDelegate>

- (id)initWithSize:(CGSize)size inView:(UIView*)view;
-(void)draw;
- (void)reset;

@end
