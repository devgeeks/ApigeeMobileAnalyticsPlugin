//
//  ApigeeMobileAnalyticsPlugin.h
//
//  Created by Tommy-Carlos Williams on 12/12/2012.
//  Copyright 2012 Tommy-Carlos Williams. All rights reserved.
//  MIT Licensed
//

#import <Cordova/CDVPlugin.h>
#import <InstaOpsSDK/InstaOpsLogger.h>

typedef enum
{
	AMA_ASSERT,
    AMA_ERROR,
    AMA_WARN,
    AMA_INFO,
    AMA_DEBUG,
    AMA_VERBOSE
} LogSeverity;

#pragma mark -
#pragma mark EnumParser
@interface NSString (EnumParser)
- (LogSeverity)logSeverityForString;
@end

#pragma mark -
#pragma mark ApigeeMobileAnalyticsPlugin
@interface ApigeeMobileAnalyticsPlugin : CDVPlugin

- (void)log:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

@end
