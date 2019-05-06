//
//  GMCodeInputView.h
//  MYVSPasswordInput
//
//  Created by Gmingyue on 2018/12/11.
//  Copyright © 2018 Gmingyue. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GMCodeInputViewCompletedBlock)(NSString * _Nullable text);

NS_ASSUME_NONNULL_BEGIN

@interface MYCodeInputView : UIView

@property (nonatomic, strong) UIColor *borderColor;//边框颜色
@property (nonatomic, strong) UIColor *heighlightBorderColor;//被选中边框颜色
@property (nonatomic, assign) CGFloat borederWidth;//边框宽度
@property (nonatomic, strong) UIColor *cursorColor;//光标颜色
@property (nonatomic, assign) CGFloat cornerRadius;//圆角半径
@property (nonatomic, copy, readonly) NSString *codeText;//输入密码内容
@property (nonatomic, assign) BOOL isSecured;//是否密码显示
@property (nonatomic, copy) GMCodeInputViewCompletedBlock completedBlock;
@property (nonatomic, assign) BOOL completeTypeIn;

+(instancetype)InitCodeInputViewWithFrame:(CGRect)frame CodeNums:(NSInteger)codeNums;
-(void)inputBecomeFirstResponder;
-(void)inputResignFirstResponder;
-(void)clear;

@end

NS_ASSUME_NONNULL_END
