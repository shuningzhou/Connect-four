//
//  ZSBox.h
//  PodTest
//
//  Created by shuning zhou on 14-5-17.
//  Copyright (c) 2014年 ZS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZSTileControl.h"

@protocol ZSBoxDelegate <NSObject>

-(void)touchColumn:(NSInteger)column;

@end

@interface ZSBox : NSObject<ZSTileControlDelegate>

@property (nonatomic) id<ZSBoxDelegate> delegate;

-(id)initWithIndexX:(NSInteger)x indexY:(NSInteger)y;
- (UIView*)drawInFrame:(CGRect)frame;
-(BOOL)updateStateForColor:(BOOL)yellow;
-(void)reset;
-(ZSTileState)getTileState;

@end
