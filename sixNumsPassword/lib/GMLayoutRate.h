//
//  GMLayoutRate.h
//  GmLoanClient
//
//  Created by Gmingyue on 16/7/13.
//  Copyright © 2016年 Gmingyue. All rights reserved.
//

#ifndef GMLayoutRate_h
#define GMLayoutRate_h

#include <stdio.h>

#ifdef __cplusplus
extern "C" float layoutRateByHeight(float orginLayout);
extern "C" float layoutRateByHeightForPlus(float orginLayout);
#else
extern float layoutRateByHeight(float orginLayout);
extern float layoutRateByHeightForPlus(float orginLayout);
#endif

#import <UIKit/UIKit.h>

@interface GMLayoutRate :NSObject
+ (CGFloat)layoutRateByOCHeight:(CGFloat)orginLayout;
+ (CGFloat)layoutRateByOCHeightForPlus:(CGFloat)orginLayout;
@end


#endif /* GMLayoutRate_h */
