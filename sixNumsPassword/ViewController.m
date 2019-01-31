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

@end

@implementation ViewController


#pragma mark - init UI
-(void)initUI
{
    [self.view addSubview:self.inputView];
}

#pragma mark - root view life time
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGBString:@"#FFFFFF"];
    //self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initUI];
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
            //            if (weakSelf.completedBlock) {
            //                weakSelf.completedBlock(text);
            //            }
        };
    }
    return _inputView;
}

-(NSString *)codeText
{
    return self.inputView.codeText;
}

@end
