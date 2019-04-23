//
//  CustomTools.h
//  moneyhll
//
//  Created by 李雪阳 on 16/11/7.
//  Copyright © 2016年 浙江龙之游旅游开发有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomTools : NSObject


/**
 自定义Label
 */
+ (UILabel *_Nullable)labelWithTitle:(NSString *_Nullable)text Font:(UIFont *_Nonnull)font textColor:(UIColor *_Nullable)color;


/**
 自定义button
 */
+ (UIButton *_Nullable)buttonWithTitle:(NSString *_Nullable)title font:(UIFont *_Nonnull)font titleColor:(UIColor *_Nullable)color Selector:(SEL _Nullable )btnSelect Target:(UIViewController *_Nullable)vc;


/**
 自定义View层上button
 */
+ (UIButton *_Nullable)buttonFromViewWithTitle:(NSString *_Nullable)title font:(UIFont *_Nonnull)font titleColor:(UIColor *_Nullable)color Selector:(SEL _Nullable )btnSelect Target:(UIView *_Nullable)vc;


/**
 自定义textfield
 */
+ (UITextField *_Nullable)textFieldWithPlaceHolder:(NSString *_Nullable)placeHolder textFont:(NSInteger)font textColor:(UIColor *_Nullable)color;



/**
 自定义文字属性大小及颜色 label.attributedText
 
 @param lableText 要定义的文字内容
 @param sectionRange 改变属性的文字范围 例NSMakeRange(5, lableText.length-7)
 @param textFont 改变的字体属性及大小 常规字体 粗体等
 @param textColor 改变的字体颜色 不更改传nil
 */
+ (NSMutableAttributedString *_Nullable)labelDifferentAttributedWithText:(NSString *_Nullable)lableText Section:(NSRange)sectionRange Font:(UIFont *_Nonnull)textFont TextColor:(UIColor *_Nullable)textColor;


/**
 判断座机号
 */
+ (BOOL)isTelephoneNumber:(NSString *_Nullable)telephone;


/**
 判断手机号
 */
+ (BOOL)isMobileNumber:(NSString *_Nullable)mobileNum;


 /** 判断邮箱是否合法 */
+ (BOOL)checkEmail:(NSString *_Nullable)email;

/**
 判断是否是纯数字
 */
+(BOOL)isFidureNumber:(NSString*_Nullable)numer;



/**
 匹配中文，英文字母和数字及_
 */
+ (BOOL)isNormalAccount:(NSString *_Nullable)accountName;


/**
 判断身份证
 */
+ (BOOL)checkUserIdCard:(NSString *_Nullable)idCard;



/**
 判断是否有表情 (yes有表情)
 */
+ (BOOL)isContainsToEmoji:(NSString *_Nullable)string;


/**
 禁止输入表情（输入表情就为空）
 */
+ (NSString *_Nullable)disable_emoji:(NSString *_Nullable)text;

/**
 解码URLDecodedString
 */
+ (NSString *_Nullable)URLDecodedString:(NSString *_Nullable)str;


/**
 汉字转 Unicode   张三 →  \u5f20\u4e09
 */
+ (NSString *_Nullable)ChineseToUnicode:(NSString *_Nullable)chinese;


#pragma mark Unicode转中文
+ (NSString *_Nullable) replaceUnicode:(NSString *_Nullable)TransformUnicodeString;


/**
 编码URLEncodedString
 */
+ (NSString *_Nullable)URLEncodedString:(NSString *_Nullable)str;



/**
 头像图片base64加密
 */
+ (NSString *_Nullable)base64EncodingWithImage:(UIImage *_Nullable)image;



/**
 base64加密data数据
 */
+ (NSString *_Nullable)base64EncodingWithSourceData:(NSData *_Nullable)sourceData;



/**
 base64解密
 */
+ (NSString *_Nullable)base64DecodingWithString:(NSString *_Nullable)base64String;



/**
 从字符串(string)分割位置(segmentStr)开始取到后面的内容

 @param string 需要分割的字符串
 @param segmentStr 分割开始的位置字符串
 @return 取到的内容
 */
+ (NSString *_Nullable)getElementFromString:(NSString *_Nullable)string WithRangeSegmentString:(NSString *_Nullable)segmentStr;



/**
 给字符串第index处插入一个字符串

 @param originStr 需要更改的字符串
 @param index 插入的位置
 @param string 插入的字符串
 */
+ (NSString *_Nullable)insertElementFromString:(NSString *_Nullable)originStr insertIndex:(NSInteger)index insertString:(NSString *_Nullable)string;



/**
 添加webview加载动画
 */
+(UIActivityIndicatorView *_Nullable)addWebViewLoadingViewWithTarget:(UIViewController*_Nonnull)VC;



/**
 从字典中元素排序
 */
+ (NSArray *_Nullable)rankArrayFromDictionary:(NSDictionary *_Nullable)infoDict;



/**
 字典字母排序拼接返回字符串
 */
+ (NSString *_Nullable)orderSignStringWithDictionary:(NSDictionary *_Nullable)dict;



/**
 拨打电话
 */
+ (void)callUpWithPhoneNumber:(NSString *_Nullable)phoneNum;



/**
 复制文字并提示
 */
+ (void)copyStringToPasteBoard:(NSString *_Nonnull)string;



/**
 计算文字范围

 @param size CGSizeMake(width, CGFLOAT_MAX)
 @param string 文字内容
 @param font 文字大小
 */
+ (CGSize)boundingRectWithSize:(CGSize)size String:(NSString *_Nullable)string Font:(UIFont *_Nonnull)font;



/**
 获取文字高度

 @param string 文字内容
 @param font 大小
 @param textWidth 文字宽度（控件总宽-文字外部分）
 */
+ (CGFloat)rectTextHeightWithString:(NSString *_Nullable)string Font:(UIFont *_Nonnull)font TextWidth:(CGFloat)textWidth;



/**
 获取文字宽度

 @param string 文字内容
 @param font 大小
 @param textHeight 文字高度（控件总高-文字外部分）
 */
+ (CGFloat)rectTextWidthWithString:(NSString *_Nullable)string Font:(UIFont *_Nonnull)font TextHeight:(CGFloat)textHeight;



/**
 遍历文件夹获得文件夹大小，返回多少M

 @param folderPath 文件路径
 */
+ (float)folderSizeAtPath:(NSString *_Nullable)folderPath;



/**
 获取单个文件的大小

 @param filePath 文件路径
 */
+ (float)fileSizeAtPath:(NSString *_Nullable)filePath;



/**
 检测APP版本号

 @param appId APP在store中的id
 @param appUrl APP在store的下载地址
 */
+ (void)checkAppVersionWithAppID:(NSString *_Nullable)appId AppUrl:(NSString *_Nullable)appUrl Target:(UIViewController *_Nonnull)VC;



/**
 判断当前app版本和AppStore最新app版本大小

 @param newVersion 线上新版本
 @param oldVersion 老版本
 */
+ (BOOL)judgeNewVersion:(NSString *_Nullable)newVersion withOldVersion:(NSString *_Nullable)oldVersion;



/**
 数字每三位用逗号分隔

 @param number 需改变的数字
 @param prefix 前缀 如@“￥” 没有传nil
 @param suffix 后缀 如@“元” 没有传nil
 */
+ (NSString *_Nullable)separateNumberUseCommaWithNumber:(NSString *_Nullable)number Prefix:(NSString *_Nullable)prefix Suffix:(NSString *_Nullable)suffix;



/**
 大图片缩放、压缩

 @param image 原图
 @param newSize 新尺寸清晰度
 */
+ (UIImage *_Nullable)scaleImage:(UIImage *_Nullable)image newSize:(CGSize)newSize;



/**
 大分辨率图片缩放
 */
+ (UIImage *_Nullable)scaleImageWithData:(NSData *_Nonnull)data withSize:(CGSize)size scale:(CGFloat)scale orientation:(UIImageOrientation)orientation;



/**
 数组转成json字符串
 */
+ (NSString *)transformToJsonStrWithArray:(NSArray *)array;

@end
