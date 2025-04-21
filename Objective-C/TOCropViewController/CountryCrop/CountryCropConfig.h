#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

typedef NS_ENUM(NSInteger, CountryCropSize) {
    CountryCropSizePassport,
    CountryCropSizeVisa,
    CountryCropSizeIDCard,
    CountryCropSizeCustom
};

@interface CountryCropConfig : NSObject

+ (CGSize)aspectRatioForCountry:(NSString *)countryCode cropSize:(CountryCropSize)cropSize;
+ (NSString *)displayNameForCropSize:(CountryCropSize)cropSize;
+ (BOOL)isCropSizeSupported:(CountryCropSize)cropSize forCountry:(NSString *)countryCode;

@end 