//
//  ViewController.m
//  sixNumsPassword
//
//  Created by Gmingyue on 2019/1/31.
//  Copyright © 2019 Gmingyue. All rights reserved.
//

#import "ViewController.h"
#import "MYCodeInputView.h"
#import "GMLayoutRate.h"
#import "defines.h"
#import "UIColor+Extension.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) MYCodeInputView *inputView;
@property (nonatomic, strong) UIButton *cancelButton;

@end

@implementation ViewController


#pragma mark - init UI
-(void)initUI
{
    [self.view addSubview:self.inputView];
    [self.view addSubview:self.cancelButton];
    
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-GMLAYOUTRATE(100));
    }];
}

#pragma mark - root view life time
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGBString:@"#FFFFFF"];
    //self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initUI];
}

#pragma mark - button actions
-(void)cancelAction
{
    [self.inputView clear];
}

#pragma mark - getters and setters
-(UIView *)inputView
{
    if (!_inputView) {
        _inputView = [MYCodeInputView InitCodeInputViewWithFrame:CGRectMake(0,GMLAYOUTRATE(221) - 64, DEVICE_WIDTH, GMLAYOUTRATE(50)) CodeNums:6];
        _inputView.borderColor = [UIColor colorWithRGBString:@"#999999"];
        _inputView.heighlightBorderColor = [UIColor colorWithRGBString:@"#1E86FF"];
        __weak typeof(self) weakSelf = self;
        _inputView.completedBlock = ^(NSString *text) {
            NSLog(@"text = %@", text);
            //            if (weakSelf.completedBlock) {
            //                weakSelf.completedBlock(text);
            //            }
        };
    }
    return _inputView;
}

-(UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton setTitle:@"clear" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

-(NSString *)codeText
{
    return self.inputView.codeText;
}

@end
