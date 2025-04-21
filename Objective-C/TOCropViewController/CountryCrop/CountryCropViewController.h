#import <UIKit/UIKit.h>
#import "TOCropViewController.h"
#import "CountryCropConfig.h"

@interface CountryCropViewController : TOCropViewController

@property (nonatomic, strong) NSString *countryCode;
@property (nonatomic, assign) CountryCropSize cropSize;

- (instancetype)initWithImage:(UIImage *)image countryCode:(NSString *)countryCode cropSize:(CountryCropSize)cropSize;

@end 