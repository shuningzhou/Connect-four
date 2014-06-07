//
//  ZSViewController.m
//  PodTest
//
//  Created by shuning zhou on 14-5-17.
//  Copyright (c) 2014年 ZS. All rights reserved.
//

#import "ZSViewController.h"
#import "ZSTileControl.h"
#import "ZSBoard.h"
#import "ZSBox.h"

@interface ZSViewController (){
    ZSBoard* _board;
}

@end

@implementation ZSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    _board = [[ZSBoard alloc]initWithSize:CGSizeMake(7, 6) inView:self.view];
    [_board draw];
    
    UIButton* resetButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    resetButton.frame = CGRectMake(50.0, 50.0, 30.0, 30.0);
    [resetButton addTarget:self action:@selector(reset:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:resetButton];
}

-(void)reset:(UIButton*)button{
    [_board reset];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
