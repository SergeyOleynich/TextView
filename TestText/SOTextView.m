//
//  SOTextView.m
//  TestText
//
//  Created by Sergey Oleynich on 1/9/16.
//  Copyright © 2016 Sergey Oleynich. All rights reserved.
//

#import "SOTextView.h"

@interface SOTextView () <UIScrollViewDelegate>

@property (assign, nonatomic) NSInteger pointY;
@property (assign, nonatomic) BOOL shouldAnimating;

@end

@implementation SOTextView

#pragma mark - Initialization

-(instancetype)init {
    if (self = [super init]) {
        self.shouldAnimating = YES;
        self.editable = NO;
    }
    return self;
}

#pragma mark - Helpers methods

- (void)animateText {
    
    self.pointY = lrintf(self.pointY + 1);
        self.contentOffset = CGPointMake(0, self.pointY);
    if (self.contentSize.height - CGRectGetHeight(self.frame) <= self.pointY) {
        return ;
    }
    if (!self.shouldAnimating) {
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self animateText];
    });
    
}

#pragma mark - Public methods

-(void)touchTextView {
    self.shouldAnimating = NO;
}

-(void)unTouchTextView {
    self.shouldAnimating = YES;
    self.pointY = self.contentOffset.y;
    [self animateText];
}


@end
