//
//  ZSTile.m
//  PodTest
//
//  Created by shuning zhou on 14-5-17.
//  Copyright (c) 2014年 ZS. All rights reserved.
//

#import "ZSTileControl.h"

@interface ZSTileControl (){
    float _width;
}

@end

@implementation ZSTileControl

#pragma mark external

- (void)setTileState:(ZSTileState)tileState{
    _tileState = tileState;
    [self setNeedsDisplay];
}


#pragma mark Initialization

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSAssert(frame.size.width == frame.size.height, @"ZSTile: frame.width != frame.height");
        _width = frame.size.width;
    }
    return self;
}

-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    [self.delegate touchEnded];
}

#pragma mark Drawing

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();

    switch (self.tileState) {
            
        case ZSTileStateDefault:
            [self drawCircleColor:[UIColor whiteColor] context:context];
            break;
            
        case ZSTileStateRed:
            [self drawCircleColor:[UIColor redColor] context:context];
            break;
            
        case ZSTileStateYellow:
            [self drawCircleColor:[UIColor yellowColor] context:context];
            break;
            
        default:
            [self drawCircleColor:[UIColor whiteColor] context:context];
            break;
    }
}


- (void)drawCircleColor:(UIColor*)color context:(CGContextRef)context{
    
    CGContextSaveGState(context);

    [color set];
    
    CGContextFillEllipseInRect(context, CGRectMake(0, 0, _width, _width));
    
    CGContextRestoreGState(context);
}



@end
