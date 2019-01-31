//
//  GMCodeInputView.m
//  MYVSPasswordInput
//
//  Created by Gmingyue on 2018/12/11.
//  Copyright © 2018 Gmingyue. All rights reserved.
//

#import "MYCodeInputView.h"
#import "GMLayoutRate.h"
#import "defines.h"

@protocol KeyInputTextfieldDelegate <NSObject>

@optional
-(void)deleteBackward;

@end

@interface GMCodeInputViewTextField : UITextField

@property (nonatomic, assign) id<KeyInputTextfieldDelegate>keyInputDelegate;

@end

@implementation GMCodeInputViewTextField

-(void)deleteBackward
{
    [super deleteBackward];
    if (self.keyInputDelegate && [self.keyInputDelegate respondsToSelector:@selector(deleteBackward)]) {
        [self.keyInputDelegate deleteBackward];
    }
}

@end

@interface MYCodeInputView ()<UITextFieldDelegate, KeyInputTextfieldDelegate>

@property (nonatomic, assign) NSInteger numbers;//密码数量
@property (nonatomic, strong) NSMutableArray<GMCodeInputViewTextField *> *textfields;
//@property (nonatomic, assign) NSInteger selectTag;//目前选中输入框
@property (nonatomic, assign) BOOL inputIsFirstResponder;//整体第一响应者
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation MYCodeInputView
#pragma mark - constructors
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame CodeNums:(NSInteger)codeNums
{
    self = [self initWithFrame:frame];
    if (self) {
        self.numbers = codeNums;
        self.cornerRadius = 3.0f;
        self.borederWidth = 0.5f;
        //self.borderColor = [UIColor redColor];
        //self.cursorColor = [UIColor redColor];
        //self.inputIsFirstResponder = YES;
        self.currentIndex = 0;
        [self setupUI];
    }
    return self;
}

+(instancetype)InitCodeInputViewWithFrame:(CGRect)frame CodeNums:(NSInteger)codeNums
{
    
    return [[self alloc] initWithFrame:frame CodeNums:codeNums];
}

#pragma mark - setup UI
-(void)setupUI
{
    [self createTextFields];
    [self inputBecomeFirstResponder];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChangeNotification) name:UITextFieldTextDidChangeNotification object:nil];
}

-(void)createTextFields
{
    CGFloat width = (DEVICE_WIDTH - 2 * GMLAYOUTRATE(20) - (self.numbers - 1) * GMLAYOUTRATE(7))/6;
    CGFloat height = width;
    for (int i = 0; i < self.numbers; i++) {
        GMCodeInputViewTextField *textfield = [[GMCodeInputViewTextField alloc] initWithFrame:CGRectMake(GMLAYOUTRATE(20) + i * (width + GMLAYOUTRATE(7)), 0, width, height)];
        textfield.backgroundColor = [UIColor clearColor];
        textfield.layer.cornerRadius = self.cornerRadius;
        textfield.layer.borderWidth = self.borederWidth;
        textfield.layer.borderColor = self.borderColor.CGColor;
        textfield.tintColor = self.cursorColor;
        textfield.keyboardType = UIKeyboardTypeNumberPad;
        textfield.tag = i;
        textfield.delegate = self;
        textfield.textAlignment = NSTextAlignmentCenter;
        textfield.font = [UIFont systemFontOfSize:22.0f];
        textfield.enabled = NO;
        textfield.keyInputDelegate = self;
        //textfield.text = @"";
        [self addSubview:textfield];
        [self.textfields addObject:textfield];
    }
}

#pragma mark - touch actions
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!self.inputIsFirstResponder) {
        if (self.currentIndex == self.numbers - 1) {
            GMCodeInputViewTextField *textfield = [self.textfields objectAtIndex:self.currentIndex];
            textfield.text = nil;
        }
        [self inputBecomeFirstResponder];
    } else {
        [self inputResignFirstResponder];
    }
}

#pragma mark - inputIsFirstResponder
-(void)inputBecomeFirstResponder
{
    if (self.inputIsFirstResponder) {
        [self updateBorderColor:self.currentIndex];
        return;
    }
    if (self.currentIndex == self.numbers - 1) {
        GMCodeInputViewTextField *textfield = [self.textfields objectAtIndex:self.currentIndex];
        [self updateBorderColor:self.currentIndex];
        textfield.text = nil;
    }
    self.inputIsFirstResponder = YES;
    GMCodeInputViewTextField *textfield = [self.textfields objectAtIndex:self.currentIndex];
    textfield.enabled = YES;
    //textfield.text = @"";
    [self updateBorderColor:self.currentIndex];
    [textfield becomeFirstResponder];
}

-(void)updateBorderColor:(NSUInteger)index
{
    for (int i = 0; i < self.textfields.count; i++) {
        GMCodeInputViewTextField *textfield = self.textfields[i];
        if (textfield) {
            if (i == index) {
                textfield.layer.borderColor = self.heighlightBorderColor.CGColor;
            } else {
                textfield.layer.borderColor = self.borderColor.CGColor;
            }
        } else {
            
        }
    }
}

-(void)inputResignFirstResponder
{
    if (!self.inputIsFirstResponder) {
        return;
    }
    self.inputIsFirstResponder = NO;
    GMCodeInputViewTextField *textfield = [self.textfields objectAtIndex:self.currentIndex];
    textfield.enabled = NO;
    [textfield resignFirstResponder];
    [self updateBorderColor:self.currentIndex + 1];
}

#pragma mark - actions
-(void)textFieldTextDidChangeNotification
{
    GMCodeInputViewTextField *textfield = [self.textfields objectAtIndex:self.currentIndex];
    if (textfield.text.length == 1) {
        if (self.currentIndex != self.numbers - 1) {
            [self inputResignFirstResponder];
            self.currentIndex++;
            [self inputBecomeFirstResponder];
        } else {
            // 输满六位
            [self inputResignFirstResponder];
            __weak typeof(self) weakSelf = self;
            if (self.completedBlock) {
                self.completedBlock(weakSelf.codeText);
            }
        }
    } else {
        if (self.currentIndex != 0) {
            self.currentIndex--;
            [self inputBecomeFirstResponder];
        }
    }
}

#pragma mark - KeyInputTextfieldDelegate
-(void)deleteBackward
{
    //NSLog(@"deleteBackward");
    GMCodeInputViewTextField *textfield;
    if (self.currentIndex != 0) {
        [self inputResignFirstResponder];
        self.currentIndex--;
        textfield = [self.textfields objectAtIndex:self.currentIndex];
        textfield.text = nil;
        [self inputBecomeFirstResponder];
    } else {
        //
    }
}

#pragma mark - getters and setters
-(NSMutableArray<GMCodeInputViewTextField *> *)textfields
{
    if (!_textfields) {
        _textfields = [NSMutableArray arrayWithCapacity:self.numbers];
    }
    return _textfields;
}

-(NSString *)codeText
{
    NSMutableString *string = [@"" mutableCopy];
    for (int i = 0; i <= self.currentIndex; i++) {
        GMCodeInputViewTextField *textfield = [self.textfields objectAtIndex:i];
        [string appendString:textfield.text];
    }
    return string;
}

-(void)setIsSecured:(BOOL)isSecured
{
    if (_isSecured != isSecured) {
        _isSecured = isSecured;
        for (int i = 0; i < self.textfields.count; i++) {
            GMCodeInputViewTextField *textfield = [self.textfields objectAtIndex:i];
            textfield.secureTextEntry = _isSecured;
        }
    }
}

-(void)setCursorColor:(UIColor *)cursorColor
{
    _cursorColor = cursorColor;
    for (int i = 0; i < self.textfields.count; i++) {
        GMCodeInputViewTextField *textfield = self.textfields[i];
        if (textfield) {
            textfield.tintColor = _cursorColor;
        } else {
            //
        }
    }
}

-(void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    for (int i = 0; i < self.textfields.count; i++) {
        GMCodeInputViewTextField *textfield = self.textfields[i];
        if (textfield) {
            textfield.layer.borderColor = _borderColor.CGColor;
            //[textfield.layer setNeedsDisplay]
        } else {
            //
        }
    }
}

-(void)setHeighlightBorderColor:(UIColor *)heighlightBorderColor
{
    _heighlightBorderColor = heighlightBorderColor;
    [self updateBorderColor:self.currentIndex];
}

@end
