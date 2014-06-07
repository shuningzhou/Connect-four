//
//  ZSBox.m
//  PodTest
//
//  Created by shuning zhou on 14-5-17.
//  Copyright (c) 2014年 ZS. All rights reserved.
//

#import "ZSBox.h"
#import "ZSTileControl.h"

@interface ZSBox (){
    ZSTileControl* _tile;
    NSInteger _x;
    NSInteger _y;
}

@end

@implementation ZSBox

-(id)initWithIndexX:(NSInteger)x indexY:(NSInteger)y{
    self = [super init];
    if (self) {
        _x = x;
        _y = y;
    }
    return self;
}

-(void)reset{
    _tile.tileState = ZSTileStateDefault;
}

- (UIView*)drawInFrame:(CGRect)frame{
    _tile = [[ZSTileControl alloc]initWithFrame:frame];
    _tile.delegate = self;
    return _tile;
}

-(BOOL)updateStateForColor:(BOOL)yellow{
    if (_tile.tileState != ZSTileStateDefault) {
        return NO;
    }
    
    if (yellow) {
        _tile.tileState = ZSTileStateYellow;
        
    }
    else{
        _tile.tileState = ZSTileStateRed;
    }
    return YES;
}

-(void)touchEnded{
    [self.delegate touchColumn:_x];
}

-(ZSTileState)getTileState{
    return _tile.tileState;
}

@end
