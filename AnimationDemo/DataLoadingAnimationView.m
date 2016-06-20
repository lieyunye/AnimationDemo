//
//  DataLoadingAnimationView.m
//  AnimationDemo
//
//  Created by lieyunye on 16/6/14.
//  Copyright © 2016年 lieyunye. All rights reserved.
//

#import "DataLoadingAnimationView.h"

static CGFloat mouseValue = 1.5;

@implementation DataLoadingAnimationView
{
    UIImageView *_bgAnimationImageView;
    
    UIImageView *_headImageView;

    UIImageView *_eye1BGImageView;
    UIImageView *_eye2BGImageView;
    UIImageView *_eye1ImageView;
    UIImageView *_eye2ImageView;
    UIImageView *_mouseImageView;
    
    UIView *_dotView1;
    UIView *_dotView2;
    UIView *_dotView3;
    UIView *_dotView4;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _bgAnimationImageView = [[UIImageView alloc] init];
        _bgAnimationImageView.contentMode = UIViewContentModeCenter;
        _bgAnimationImageView.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
        [self addSubview:_bgAnimationImageView];
        _bgAnimationImageView.frame = CGRectMake(0, 0,203, 134);
        _bgAnimationImageView.center = self.center;
        
        [self createHeadView];
        [self createDotsView];
    }
    return self;
}

- (void)createHeadView
{
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"页面加载%d",0]];
    _headImageView = [[UIImageView alloc] initWithImage:image];
    _headImageView.contentMode = UIViewContentModeCenter;
    _headImageView.backgroundColor = [UIColor clearColor];
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i <= 3; i++) {
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"页面加载%ld",i % 4]]];
    }
    for (NSInteger i = 2; i >= 0; i--) {
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"页面加载%ld",i % 4]]];
    }
    [_headImageView setAnimationImages:images];
    [_headImageView setAnimationDuration:5];
    
    [_bgAnimationImageView addSubview:_headImageView];
    _headImageView.frame = CGRectMake(0, 0, _headImageView.image.size.width, _headImageView.image.size.height);
    _headImageView.center = CGPointMake(CGRectGetWidth(_bgAnimationImageView.frame) / 2.0, CGRectGetHeight(_bgAnimationImageView.frame) / 2.0);
    
    _eye1ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"eye"]];
    
    _eye1BGImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    [_headImageView addSubview:_eye1BGImageView];
    _eye1BGImageView.frame = CGRectMake(0, 0, _eye1BGImageView.image.size.width, _eye1BGImageView.image.size.height);
    _eye1BGImageView.center = CGPointMake(10 + _eye1BGImageView.frame.size.width / 2.0, 30 + _eye1ImageView.image.size.height / 2.0);
    
    _eye2BGImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    [_headImageView addSubview:_eye2BGImageView];
    _eye2BGImageView.frame = CGRectMake(0, 0, _eye2BGImageView.image.size.width, _eye2BGImageView.image.size.height);
    _eye2BGImageView.center = CGPointMake(_eye1BGImageView.center.x + _eye1BGImageView.frame.size.width + 10, _eye1BGImageView.center.y);
    
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

- (void)createDotsView
{
    _dotView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 24/2.0, 24/2.0)];
    _dotView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 34/2.0, 34/2.0)];
    _dotView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44/2.0, 44/2.0)];
    _dotView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30/2.0, 30/2.0)];
    
    _dotView1.layer.masksToBounds = YES;
    _dotView1.layer.cornerRadius = CGRectGetWidth(_dotView1.frame) / 2.0;
    _dotView2.layer.masksToBounds = YES;
    _dotView2.layer.cornerRadius = CGRectGetWidth(_dotView2.frame) / 2.0;
    _dotView3.layer.masksToBounds = YES;
    _dotView3.layer.cornerRadius = CGRectGetWidth(_dotView3.frame) / 2.0;
    _dotView4.layer.masksToBounds = YES;
    _dotView4.layer.cornerRadius = CGRectGetWidth(_dotView4.frame) / 2.0;
    
    _dotView1.backgroundColor = [UIColor colorWithRed:183/255.0 green:219/255.0 blue:1 alpha:1];
    _dotView2.backgroundColor = [UIColor colorWithRed:183/255.0 green:219/255.0 blue:1 alpha:1];
    _dotView3.backgroundColor = [UIColor colorWithRed:183/255.0 green:219/255.0 blue:1 alpha:1];
    _dotView4.backgroundColor = [UIColor colorWithRed:183/255.0 green:219/255.0 blue:1 alpha:1];
    
    [_bgAnimationImageView addSubview:_dotView1];
    [_bgAnimationImageView addSubview:_dotView2];
    [_bgAnimationImageView addSubview:_dotView3];
    [_bgAnimationImageView addSubview:_dotView4];
    
    _dotView1.center = CGPointMake(91/2.0, 196/2.0);
    _dotView2.center = CGPointMake(80/2.0, 228/2.0);
    _dotView3.center = CGPointMake(265/2.0, 237/2.0);
    _dotView4.center = CGPointMake(341/2.0, 143/2.0);
}

- (void)startAnimation
{
    [_headImageView startAnimating];
    
    CAKeyframeAnimation *eye1Animation = [self eyeAnimationWithPathCenter:CGPointMake(CGRectGetWidth(_eye1BGImageView.frame) / 2.0, CGRectGetHeight(_eye1BGImageView.frame) / 2.0) radius:_eye1BGImageView.frame.size.width / 2.0 - _eye1ImageView.frame.size.width / 2.0  - 1];
    [_eye1ImageView.layer addAnimation:eye1Animation forKey:@"position"];
    
    CAKeyframeAnimation *eye2Animation = [self eyeAnimationWithPathCenter:CGPointMake(CGRectGetWidth(_eye2BGImageView.frame) / 2.0, CGRectGetHeight(_eye2BGImageView.frame) / 2.0) radius:_eye2BGImageView.frame.size.width / 2.0 - _eye2ImageView.frame.size.width / 2.0  - 1];
    [_eye2ImageView.layer addAnimation:eye2Animation forKey:@"position"];
    
    [self mouseAnimation1];
    
    CGPoint dot1StartPoint = _dotView1.center;
    NSArray *dot1LinePoints = @[[NSValue valueWithCGPoint:CGPointMake(16/2.0,48/2.0)],[NSValue valueWithCGPoint:CGPointMake(68/2.0,83/2.0)],[NSValue valueWithCGPoint:_dotView1.center]];
    CAKeyframeAnimation *dot1Animation = [self dotAnimationWithStartPoint:dot1StartPoint linePoints:dot1LinePoints];
    [dot1Animation setKeyTimes:[NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.4], [NSNumber numberWithFloat:0.7],[NSNumber numberWithFloat:1.0], nil]];
    [_dotView1.layer addAnimation:dot1Animation forKey:NULL];
    
    CGPoint dot2StartPoint = _dotView2.center;
    NSArray *dot2LinePoints = @[[NSValue valueWithCGPoint:CGPointMake(76/2.0,183/2.0)],[NSValue valueWithCGPoint:CGPointMake(77/2.0,146/2.0)],[NSValue valueWithCGPoint:CGPointMake(27/2.0,126/2.0)],[NSValue valueWithCGPoint:CGPointMake(53/2.0,137/2.0)],[NSValue valueWithCGPoint:_dotView2.center]];
    CAKeyframeAnimation *dot2Animation = [self dotAnimationWithStartPoint:dot2StartPoint linePoints:dot2LinePoints];
    [dot2Animation setKeyTimes:[NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.1], [NSNumber numberWithFloat:0.40],[NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.8], [NSNumber numberWithFloat:1.0], nil]];
    [_dotView2.layer addAnimation:dot2Animation forKey:NULL];
    
    CGPoint dot3StartPoint = _dotView3.center;
    NSArray *dot3LinePoints = @[[NSValue valueWithCGPoint:CGPointMake(312/2.0,177/2.0)],[NSValue valueWithCGPoint:CGPointMake(304/2.0,148/2.0)],[NSValue valueWithCGPoint:CGPointMake(298/2.0,228/2.0)],[NSValue valueWithCGPoint:_dotView3.center]];
    CAKeyframeAnimation *dot3Animation = [self dotAnimationWithStartPoint:dot3StartPoint linePoints:dot3LinePoints];
    [dot3Animation setKeyTimes:[NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.3],[NSNumber numberWithFloat:0.7],[NSNumber numberWithFloat:0.9], [NSNumber numberWithFloat:1.0], nil]];
    [_dotView3.layer addAnimation:dot3Animation forKey:NULL];
    
    CGPoint dot4StartPoint = _dotView4.center;
    NSArray *dot4LinePoints = @[[NSValue valueWithCGPoint:CGPointMake(349/2.0,55/2.0)],[NSValue valueWithCGPoint:CGPointMake(368/2.0,16/2.0)],[NSValue valueWithCGPoint:CGPointMake(387/2.0,31/2.0)],[NSValue valueWithCGPoint:CGPointMake(318/2.0,122/2.0)],[NSValue valueWithCGPoint:_dotView4.center]];
    CAKeyframeAnimation *dot4Animation = [self dotAnimationWithStartPoint:dot4StartPoint linePoints:dot4LinePoints];
    [dot4Animation setKeyTimes:[NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.2], [NSNumber numberWithFloat:0.50],[NSNumber numberWithFloat:0.70],[NSNumber numberWithFloat:0.9], [NSNumber numberWithFloat:1.0], nil]];
    [_dotView4.layer addAnimation:dot4Animation forKey:NULL];

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

- (CAKeyframeAnimation *)dotAnimationWithStartPoint:(CGPoint)startPoint linePoints:(NSArray *)linePoints
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, startPoint.x, startPoint.y);
    for (int i = 0; i < linePoints.count; i++) {
        NSNumber *number = (NSNumber *)linePoints[i];
        CGPoint point = number.CGPointValue;
        CGPathAddLineToPoint(path, NULL, point.x, point.y);
    }
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //设置path属性
    [animation setPath:path];
    [animation setDuration:3.0];
    animation.repeatCount = MAXFLOAT;
    return animation;
}

@end
