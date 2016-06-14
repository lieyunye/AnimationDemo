//
//  VideoLoadingAnimationView.m
//  AnimationDemo
//
//  Created by lieyunye on 16/6/13.
//  Copyright © 2016年 lieyunye. All rights reserved.
//

#import "VideoLoadingAnimationView.h"

static CGFloat mouseValue = 1.5;

@implementation VideoLoadingAnimationView
{
    UIView *_loadingView;
    UIImageView *_headImageView;
    UIImageView *_eye1BGImageView;
    UIImageView *_eye2BGImageView;
    UIImageView *_eye1ImageView;
    UIImageView *_eye2ImageView;
    UIImageView *_mouseImageView;
    
    UIView *_faildView;
    UIButton *_clickButton;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createLoadingView];
        [self createFailedView];
    }
    return self;
}

- (void)createLoadingView
{
    _loadingView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:_loadingView];
    
    _headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"body"]];
    [_loadingView addSubview:_headImageView];
    _headImageView.frame = CGRectMake(0, 0, _headImageView.image.size.width, _headImageView.image.size.height);
    _headImageView.center = _loadingView.center;
    
    _eye1ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"eye"]];
    
    _eye1BGImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    [_headImageView addSubview:_eye1BGImageView];
    _eye1BGImageView.frame = CGRectMake(0, 0, _eye1BGImageView.image.size.width, _eye1BGImageView.image.size.height);
    _eye1BGImageView.center = CGPointMake(12 + _eye1ImageView.image.size.width / 2.0, 20 + _eye1ImageView.image.size.height / 2.0);
    
    _eye2BGImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    [_headImageView addSubview:_eye2BGImageView];
    _eye2BGImageView.frame = CGRectMake(0, 0, _eye2BGImageView.image.size.width, _eye2BGImageView.image.size.height);
    _eye2BGImageView.center = CGPointMake(_eye1BGImageView.center.x + _eye1BGImageView.frame.size.width + 8, _eye1BGImageView.center.y);
    
    [_eye1BGImageView addSubview:_eye1ImageView];
    _eye1ImageView.frame = CGRectMake(0, 0, _eye1ImageView.image.size.width, _eye1ImageView.image.size.height);
    _eye1ImageView.center = CGPointMake(_eye1BGImageView.frame.size.width - _eye1ImageView.frame.size.width / 2.0 - 1, _eye1BGImageView.frame.size.height / 2.0);
    
    _eye2ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"eye"]];
    [_eye2BGImageView addSubview:_eye2ImageView];
    _eye2ImageView.frame = CGRectMake(0, 0, _eye2ImageView.image.size.width, _eye2ImageView.image.size.height);
    _eye2ImageView.center = CGPointMake(_eye2BGImageView.frame.size.width - _eye2ImageView.frame.size.width / 2.0 - 1, _eye2BGImageView.frame.size.height / 2.0);
    
    _mouseImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mouse"]];
    [_headImageView addSubview:_mouseImageView];
    _mouseImageView.frame = CGRectMake(0, 0, _mouseImageView.image.size.width, _mouseImageView.image.size.height);
    _mouseImageView.center = CGPointMake(_headImageView.frame.size.width / 2.0,  + _headImageView.frame.size.height / 4.0 * 3 - 7);
}

- (void)createFailedView
{
    _faildView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:_faildView];
    _faildView.hidden = YES;
    _clickButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 120, 174/2.0)];
    [_clickButton setBackgroundImage:[UIImage imageNamed:@"bg"] forState:UIControlStateNormal];
    _clickButton.center = _faildView.center;
    [_clickButton setTitle:@"加载失败 点击重试" forState:UIControlStateNormal];
    [_clickButton setImage:[UIImage imageNamed:@"shuaxin"] forState:UIControlStateNormal];
    [_faildView addSubview:_clickButton];
    _clickButton.titleLabel.font = [UIFont systemFontOfSize:12];
    _clickButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_clickButton addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    CGRect titleRect = _clickButton.titleLabel.frame; //文本控件在按钮中的frame值。
    CGRect imageRect = _clickButton.imageView.frame;  //图片控件在按钮中的frame值。
    CGFloat padding = 15; //用于指定文本和图片的间隔值。
    CGFloat selfWidth = _clickButton.frame.size.width; //按钮控件的宽度
    CGFloat selfHeight = _clickButton.frame.size.height; //按钮控件的高度
    CGFloat totalHeight=titleRect.size.height+padding+imageRect.size.height;  //图文上下布局时所占用的总高度，注意这里也算上他们之间的间隔值padding
    
    _clickButton.titleEdgeInsets =UIEdgeInsetsMake(((selfHeight - totalHeight)/2 + imageRect.size.height + padding - titleRect.origin.y),
                                      (selfWidth/2 - titleRect.origin.x - titleRect.size.width /2) - (selfWidth - titleRect.size.width) /2,
                                      -((selfHeight - totalHeight)/2 + imageRect.size.height + padding - titleRect.origin.y),
                                      -(selfWidth/2 - titleRect.origin.x - titleRect.size.width /2) - (selfWidth - titleRect.size.width) /2);
    
    _clickButton.imageEdgeInsets =UIEdgeInsetsMake(((selfHeight - totalHeight)/2 - imageRect.origin.y),
                                      (selfWidth /2 - imageRect.origin.x - imageRect.size.width /2),
                                      -((selfHeight - totalHeight)/2 - imageRect.origin.y),
                                      -(selfWidth /2 - imageRect.origin.x - imageRect.size.width /2));
}

- (void)clickAction
{
    if ([_delegate respondsToSelector:@selector(click2Retry)]) {
        [_delegate click2Retry];
    }
}

- (void)showFialedView:(BOOL)show
{
    _faildView.hidden = !show;
    _loadingView.hidden = show;
}


- (void)startAnimation
{
    CAKeyframeAnimation *eye1Animation = [self eyeAnimationWithPathCenter:CGPointMake(CGRectGetWidth(_eye1BGImageView.frame) / 2.0, CGRectGetHeight(_eye1BGImageView.frame) / 2.0) radius:_eye1BGImageView.frame.size.width / 2.0 - _eye1ImageView.frame.size.width / 2.0  - 1];
    [_eye1ImageView.layer addAnimation:eye1Animation forKey:@"position"];
    
    CAKeyframeAnimation *eye2Animation = [self eyeAnimationWithPathCenter:CGPointMake(CGRectGetWidth(_eye2BGImageView.frame) / 2.0, CGRectGetHeight(_eye2BGImageView.frame) / 2.0) radius:_eye2BGImageView.frame.size.width / 2.0 - _eye2ImageView.frame.size.width / 2.0  - 1];
    [_eye2ImageView.layer addAnimation:eye2Animation forKey:@"position"];
    
    [self mouseAnimation1];

}

- (void)stopAnimation
{
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj.layer removeAllAnimations];
    }];
}

- (CAKeyframeAnimation *)eyeAnimationWithPathCenter:(CGPoint)center radius:(CGFloat)radius
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:NO];
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.path = path.CGPath;
    [pathAnimation setCalculationMode:kCAAnimationCubic];
    pathAnimation.duration = 2;
    pathAnimation.repeatCount = MAXFLOAT;
    [pathAnimation setKeyTimes:[NSArray arrayWithObjects:[NSNumber numberWithFloat:0.05],[NSNumber numberWithFloat:0.3], [NSNumber numberWithFloat:0.70],[NSNumber numberWithFloat:0.9], [NSNumber numberWithFloat:1.0], nil]];
    return  pathAnimation;
}

- (void)mouseAnimation1
{
    CABasicAnimation *scale= [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.toValue = @(mouseValue);
    scale.duration = 1;
    scale.autoreverses = YES;
    scale.delegate = self;
    [_mouseImageView.layer addAnimation:scale forKey:NSStringFromSelector(@selector(mouseAnimation1))];
}

- (void)mouseAnimation2
{
    CABasicAnimation *scale= [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.toValue = @1.8;
    scale.duration = 1;
    scale.autoreverses = YES;
    scale.delegate = self;
    [_mouseImageView.layer addAnimation:scale forKey:NSStringFromSelector(@selector(mouseAnimation2))];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    CABasicAnimation *animation = (CABasicAnimation *)anim;
    NSNumber *toValue = animation.toValue;
    if ([toValue isEqualToNumber:@(mouseValue)]) {
        [self mouseAnimation2];
    }else {
        [self mouseAnimation1];
    }
}

@end
