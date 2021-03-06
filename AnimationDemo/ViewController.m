//
//  ViewController.m
//  AnimationDemo
//
//  Created by lieyunye on 16/6/13.
//  Copyright © 2016年 lieyunye. All rights reserved.
//

#import "ViewController.h"
#import "VideoLoadingAnimationView.h"
#import "DataLoadingAnimationView.h"

@interface ViewController ()
{
    VideoLoadingAnimationView *_videoLoadingAnimationView;
    DataLoadingAnimationView *_dataLoadingAnimationView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _videoLoadingAnimationView = [[VideoLoadingAnimationView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:_videoLoadingAnimationView];
    
    
    _dataLoadingAnimationView = [[DataLoadingAnimationView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_dataLoadingAnimationView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickAction
{
    [_dataLoadingAnimationView startAnimation];
}

@end
