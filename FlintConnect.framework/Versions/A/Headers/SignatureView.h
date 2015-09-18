//
//  SignatureView.h
//  SignatureView
//
//  Created by Michal Konturek on 05/05/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SignatureView;

@protocol SignatureViewDelegate <NSObject>

@optional
- (void)signatureViewEndSigningStroke:(SignatureView *)signatureView;

@end

@interface SignatureView : UIImageView

@property (weak, nonatomic) id<SignatureViewDelegate>delegate;

@property (strong, nonatomic) UIColor *foregroundLineColor;
@property (strong, nonatomic) UIColor *backgroundLineColor;

@property (assign, nonatomic) CGFloat foregroundLineWidth;
@property (assign, nonatomic) CGFloat backgroundLineWidth;

@property (strong, nonatomic) UILongPressGestureRecognizer *recognizer;

- (void)setLineColor:(UIColor *)color;
- (void)setLineWidth:(CGFloat)width;

- (void)clear;
- (void)clearWithColor:(UIColor *)color;

- (UIImage *)signatureImage;
- (NSData *)signatureData;

- (BOOL)isSigned;

@end
