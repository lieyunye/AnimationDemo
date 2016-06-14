//
//  VideoLoadingAnimationView.h
//  AnimationDemo
//
//  Created by lieyunye on 16/6/13.
//  Copyright © 2016年 lieyunye. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VideoLoadingAnimationViewDelegate <NSObject>

- (void)click2Retry;

@end

@interface VideoLoadingAnimationView : UIView
@property (nonatomic ,assign) id<VideoLoadingAnimationViewDelegate> delegate;
- (void)startAnimation;
- (void)stopAnimation;
- (void)showFialedView:(BOOL)show;

@end
