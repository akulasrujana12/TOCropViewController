#import "CountryCropViewController.h"

@implementation CountryCropViewController

- (instancetype)initWithImage:(UIImage *)image countryCode:(NSString *)countryCode cropSize:(CountryCropSize)cropSize {
    self = [super initWithCroppingStyle:TOCropViewCroppingStyleDefault image:image];
    if (self) {
        _countryCode = countryCode;
        _cropSize = cropSize;
        
        // Configure the crop view controller based on country and crop size
        [self configureForCountryAndCropSize];
    }
    return self;
}

- (void)configureForCountryAndCropSize {
    // Get the aspect ratio for the selected country and crop size
    CGSize aspectRatio = [CountryCropConfig aspectRatioForCountry:self.countryCode cropSize:self.cropSize];
    
    // Set the custom aspect ratio
    self.customAspectRatio = aspectRatio;
    
    // Lock the aspect ratio to prevent user from changing it
    self.aspectRatioLockEnabled = YES;
    
    // Prevent aspect ratio from being reset
    self.resetAspectRatioEnabled = NO;
    
    // Hide the aspect ratio picker button since we're locking it
    self.aspectRatioPickerButtonHidden = YES;
    
    // Set the title to show the current crop size
    NSString *cropSizeName = [CountryCropConfig displayNameForCropSize:self.cropSize];
    self.titleLabel.text = [NSString stringWithFormat:@"%@ - %@", self.countryCode, cropSizeName];
}

@end 