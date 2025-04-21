#import "CountryCropConfig.h"

@implementation CountryCropConfig

+ (CGSize)aspectRatioForCountry:(NSString *)countryCode cropSize:(CountryCropSize)cropSize {
    // Default to standard passport photo size if country not found
    if (!countryCode) {
        return CGSizeMake(35, 45); // Standard passport photo size in mm
    }
    
    // Convert country code to uppercase for consistency
    NSString *upperCountryCode = [countryCode uppercaseString];
    
    switch (cropSize) {
        case CountryCropSizePassport:
            if ([upperCountryCode isEqualToString:@"US"]) {
                return CGSizeMake(51, 51); // US passport size (51x51mm)
            } else if ([upperCountryCode isEqualToString:@"UK"]) {
                return CGSizeMake(35, 45); // UK passport size
            } else {
                return CGSizeMake(35, 45); // Standard passport size
            }
            
        case CountryCropSizeVisa:
            if ([upperCountryCode isEqualToString:@"US"]) {
                return CGSizeMake(51, 51); // US visa size (51x51mm)
            } else if ([upperCountryCode isEqualToString:@"UK"]) {
                return CGSizeMake(35, 45); // UK visa size
            } else {
                return CGSizeMake(35, 45); // Standard visa size
            }
            
        case CountryCropSizeIDCard:
            if ([upperCountryCode isEqualToString:@"US"]) {
                return CGSizeMake(51, 51); // US ID size (51x51mm)
            } else if ([upperCountryCode isEqualToString:@"UK"]) {
                return CGSizeMake(35, 45); // UK ID size
            } else {
                return CGSizeMake(35, 45); // Standard ID size
            }
            
        case CountryCropSizeCustom:
            return CGSizeZero; // No fixed ratio for custom
            
        default:
            return CGSizeZero;
    }
}

+ (NSString *)displayNameForCropSize:(CountryCropSize)cropSize {
    switch (cropSize) {
        case CountryCropSizePassport:
            return @"Passport Photo";
        case CountryCropSizeVisa:
            return @"Visa Photo";
        case CountryCropSizeIDCard:
            return @"ID Card Photo";
        case CountryCropSizeCustom:
            return @"Custom Size";
        default:
            return @"";
    }
}

+ (BOOL)isCropSizeSupported:(CountryCropSize)cropSize forCountry:(NSString *)countryCode {
    // All sizes are supported by default
    return YES;
}

@end 