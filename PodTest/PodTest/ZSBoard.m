//
//  ZSBoard.m
//  PodTest
//
//  Created by shuning zhou on 14-5-17.
//  Copyright (c) 2014年 ZS. All rights reserved.
//
#import "ZSBoard.h"
#import "ZSBox.h"
#import "ZSTileControl.h"
#import "ZSGame.h"

@interface ZSBoard (){
    CGSize _size;
    NSMutableArray* _boardArray;
    UIView* _view;
}

@end

@implementation ZSBoard

- (id)initWithSize:(CGSize)size inView:(UIView*)view{
    self = [super init];
    if (self) {
        _size = size;
        _view = view;
        _boardArray = [NSMutableArray arrayWithCapacity:_size.width];
        for (int i = 0; i < _size.width; i++ ) {
            NSMutableArray* verticalArray = [NSMutableArray arrayWithCapacity:_size.height];
            for (int j = 0; j < _size.height; j++) {
                ZSBox* box = [[ZSBox alloc]initWithIndexX:i indexY:j];
                box.delegate = self;
                [verticalArray addObject:box];
            }
            _boardArray[i] = verticalArray;
        }
    }
    return self;
}

-(void)draw{
    
    for (int i = 0; i < _size.width; i++ ) {
        for (int j = 0; j < _size.height; j++) {

            ZSBox* box = _boardArray[i][j];
            
            CGFloat x = 0;
            CGFloat y = 0;
            
            x = 145.0f + i * 105.0f;
            y = 69.0f + j * 105.0f;

            CGRect frame = CGRectMake(x, y, 100.0f, 100.0f);
            UIView* boxView = [box drawInFrame:frame];
            boxView.tag = 99;
            [_view addSubview:boxView];
        }
    }
}

- (void)reset{
    for (int i = 0; i < _size.width; i++ ) {
        for (int j = 0; j < _size.height; j++) {
            NSMutableArray* verticalArray = _boardArray[i];
            ZSBox* box = verticalArray[j];
            [box reset];
        }
    }
}

-(void)touchColumn:(NSInteger)column{
    NSMutableArray* verticalArray = _boardArray[column];
    for (int j = 0; j < _size.height; j++) {
        NSInteger height = _size.height;
        height = height -j - 1;
        ZSBox* box = verticalArray[height];
        BOOL updated = [box updateStateForColor:[ZSGame yellowsTurn]];
        if (updated) {
            CGPoint index = CGPointMake(column, height);
            if ([self connected:index]) {
                [self reset];
            }
            [ZSGame switchTurn];
            return;
        }
    }
}

-(BOOL)connected:(CGPoint)index{
    
    if ([self checkHorizontalAtIndex:index]) {
        return YES;
    }
    if ([self checkVerticalAtIndex:index]) {
        return YES;
    }
    if ([self checkForwardDiagonalAtIndex:index]) {
        return YES;
    }
    if ([self checkBackwardDiagonalAtIndex:index]) {
        return YES;
    }

    return NO;
}

-(BOOL)checkVerticalAtIndex:(CGPoint)index {
    
    NSInteger numberOfBox = 0;
    
    numberOfBox = [self getNumberOfBoxWithTheSameStateFromIndex:index ForDirection:CGPointMake(0, 1)]
                + [self getNumberOfBoxWithTheSameStateFromIndex:index ForDirection:CGPointMake(0, -1)]
                - 1;
    
    if (numberOfBox >= 4) {
        return YES;
    }
    return NO;
}

-(BOOL)checkHorizontalAtIndex:(CGPoint)index {
    
    NSInteger numberOfBox = 0;
    
    numberOfBox = [self getNumberOfBoxWithTheSameStateFromIndex:index ForDirection:CGPointMake(1, 0)]
                + [self getNumberOfBoxWithTheSameStateFromIndex:index ForDirection:CGPointMake(-1, 0)]
                - 1;
    
    if (numberOfBox >= 4) {
        return YES;
    }
    return NO;
}

-(BOOL)checkForwardDiagonalAtIndex:(CGPoint)index {
    
    NSInteger numberOfBox = 0;
    
    numberOfBox = [self getNumberOfBoxWithTheSameStateFromIndex:index ForDirection:CGPointMake(1, 1)]
                + [self getNumberOfBoxWithTheSameStateFromIndex:index ForDirection:CGPointMake(-1, -1)]
                - 1;
    
    if (numberOfBox >= 4) {
        return YES;
    }
    return NO;
}

-(BOOL)checkBackwardDiagonalAtIndex:(CGPoint)index {
    
    NSInteger numberOfBox = 0;
    
    numberOfBox = [self getNumberOfBoxWithTheSameStateFromIndex:index ForDirection:CGPointMake(1, -1)]
                + [self getNumberOfBoxWithTheSameStateFromIndex:index ForDirection:CGPointMake(-1, 1)]
                - 1;
    
    if (numberOfBox >= 4) {
        return YES;
    }
    return NO;
}

-(NSInteger)getNumberOfBoxWithTheSameStateFromIndex:(CGPoint)index ForDirection:(CGPoint)direction{
    NSInteger column = index.x;
    NSInteger row = index.y;
    NSInteger directionX = direction.x;
    NSInteger directionY = direction.y;
    ZSBox* box = _boardArray[column][row];
    ZSTileState state = [box getTileState];
    NSInteger numberOfBox = 0;
    
    while ([box getTileState] == state) {
        numberOfBox ++;
        NSInteger nextColumn = column + numberOfBox * directionX;
        NSInteger nextRow = row + numberOfBox * directionY;
        
        if (nextColumn < 0 || nextColumn > (NSInteger)_size.width - 1) {
            break;
        }
        
        if (nextRow < 0 || nextRow > (NSInteger)_size.height - 1) {
            break;
        }
        
        box = _boardArray[nextColumn][nextRow];
    }

    return numberOfBox;
}

@end
