#import "UIImage+TBCityIconFont.h"
#import "TBCityIconInfo.h"

#define TBCityIconInfoMake(text, imageSize, imageColor) [TBCityIconInfo iconInfoWithText:text size:imageSize color:imageColor]

/************* 使用宏 *************/
//#define IC_Img(name,size,color) [UIImage iconWithInfo:TBCityIconInfoMake(name, size, color)]
//
//#define IC_Font(s) [UIFont fontWithName:@"iconfont"size:s]
/************* 使用宏 *************/

@interface TBCityIconFont : NSObject

+ (UIFont *)fontWithSize: (CGFloat)size;
+ (void)setFontName:(NSString *)fontName;

@end
