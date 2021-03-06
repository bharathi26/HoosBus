//
//  NSString+HAUtils.m
//
//  Created by Yaogang Lian on 10/18/10.
//  Copyright 2010 HappenApps, Inc. All rights reserved.
//

#import "NSString+HAUtils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (HAUtils)

- (NSString *)trim
{
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

// Returns md5 hash in ALL UPPPER CASE
- (NSString *)md5
{
	const char *cStr = [self UTF8String];
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	CC_MD5( cStr, strlen(cStr), result );
	return [NSString  stringWithFormat:
			@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
			result[0], result[1], result[2], result[3], result[4],
			result[5], result[6], result[7],
			result[8], result[9], result[10], result[11], result[12],
			result[13], result[14], result[15]
			];
}

@end
