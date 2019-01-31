//
//  defines.h
//  MYVSPasswordInput
//
//  Created by Gmingyue on 2018/12/11.
//  Copyright © 2018 Gmingyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#ifndef defines_h
#define defines_h

// 屏幕尺寸
#define DEVICE_BOUNDS [UIScreen mainScreen].bounds
#define DEVICE_WIDTH [UIScreen mainScreen].bounds.size.width
#define DEVICE_HEIGHT [UIScreen mainScreen].bounds.size.height

/**
 *  适配缩放比例
 */
#define GMLAYOUTRATE_FORPLUS(orginLayout) (CGFloat)(layoutRateByHeightForPlus(orginLayout))
#define GMLAYOUTRATE(orginLayout) (CGFloat)(layoutRateByHeight(orginLayout))
#define GMLAYOUTRATE_OC(orginLayout) [GMLayoutRate layoutRateByOCHeight:orginLayout]
#define GMLAYOUTRATEFORPLUS_OC(orginLayout) [GMLayoutRate layoutRateByOCHeightForPlus:orginLayout]

#pragma mark - 字体大小定义
/****字体大小定义开始***/
#define font8 [UIFont systemFontOfSize:GMFONTSCALE(8)]
#define font9 [UIFont systemFontOfSize:GMFONTSCALE(9)]
#define font10 [UIFont systemFontOfSize:GMFONTSCALE(10)]
#define font11 [UIFont systemFontOfSize:GMFONTSCALE(11)]
#define font12 [UIFont systemFontOfSize:GMFONTSCALE(12)]
#define font13 [UIFont systemFontOfSize:GMFONTSCALE(13)]
#define font14 [UIFont systemFontOfSize:GMFONTSCALE(14)]
#define font15 [UIFont systemFontOfSize:GMFONTSCALE(15)]
#define font16 [UIFont systemFontOfSize:GMFONTSCALE(16)]
#define font17 [UIFont systemFontOfSize:GMFONTSCALE(17)]
#define font18 [UIFont systemFontOfSize:GMFONTSCALE(18)]
#define font19 [UIFont systemFontOfSize:GMFONTSCALE(19)]
#define font20 [UIFont systemFontOfSize:GMFONTSCALE(20)]
#define font21 [UIFont systemFontOfSize:GMFONTSCALE(21)]
#define font22 [UIFont systemFontOfSize:GMFONTSCALE(22)]
#define font23 [UIFont systemFontOfSize:GMFONTSCALE(23)]
#define font24 [UIFont systemFontOfSize:GMFONTSCALE(24)]
#define font25 [UIFont systemFontOfSize:GMFONTSCALE(25)]
#define font26 [UIFont systemFontOfSize:GMFONTSCALE(26)]
#define font27 [UIFont systemFontOfSize:GMFONTSCALE(27)]
#define font28 [UIFont systemFontOfSize:GMFONTSCALE(28)]
#define font29 [UIFont systemFontOfSize:GMFONTSCALE(29)]
#define font30 [UIFont systemFontOfSize:GMFONTSCALE(30)]
#define font36 [UIFont systemFontOfSize:GMFONTSCALE(36)]
#define font39 [UIFont systemFontOfSize:GMFONTSCALE(39)]
#define font40 [UIFont systemFontOfSize:GMFONTSCALE(40)]
#define font41 [UIFont systemFontOfSize:GMFONTSCALE(41)]
#define font42 [UIFont systemFontOfSize:GMFONTSCALE(42)]
#define font43 [UIFont systemFontOfSize:GMFONTSCALE(43)]
#define font44 [UIFont systemFontOfSize:GMFONTSCALE(44)]
#define ResentMonReturnTableViewCellHIGHT 70

#define boldfont15 [UIFont boldSystemFontOfSize:GMFONTSCALE(15)]
#define boldfont16 [UIFont boldSystemFontOfSize:GMFONTSCALE(16)]
#define boldfont17 [UIFont boldSystemFontOfSize:GMFONTSCALE(17)]
#define boldfont18 [UIFont boldSystemFontOfSize:GMFONTSCALE(18)]
#define boldfont19 [UIFont boldSystemFontOfSize:GMFONTSCALE(19)]
#define boldfont20 [UIFont boldSystemFontOfSize:GMFONTSCALE(20)]
#define boldfont21 [UIFont boldSystemFontOfSize:GMFONTSCALE(21)]
#define boldfont22 [UIFont boldSystemFontOfSize:GMFONTSCALE(22)]
#define boldfont23 [UIFont boldSystemFontOfSize:GMFONTSCALE(23)]
#define boldfont24 [UIFont boldSystemFontOfSize:GMFONTSCALE(24)]
#define boldfont25 [UIFont boldSystemFontOfSize:GMFONTSCALE(25)]
#define boldfont34 [UIFont boldSystemFontOfSize:GMFONTSCALE(34)]
/****字体大小定义结束***/
// 字体
#define GMFONTSCALE(originFont) DEVICE_HEIGHT > 568 ? originFont : (originFont - 2)


#endif /* defines_h */
