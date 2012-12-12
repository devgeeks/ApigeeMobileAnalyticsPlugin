//
//  ApigeeMobileAnalyticsPlugin.m
//
//  Created by Tommy-Carlos Williams on 12/12/2012.
//  Copyright 2012 Tommy-Carlos Williams. All rights reserved.
//  MIT Licensed
//

#import "ApigeeMobileAnalyticsPlugin.h"

#pragma mark -
#pragma mark EnumParser
@implementation NSString (EnumParser)
- (LogSeverity)logSeverityForString
{
    NSDictionary *LogSeverities = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [NSNumber numberWithInteger:AMA_ASSERT], @"assert",
                                   [NSNumber numberWithInteger:AMA_ERROR], @"error",
                                   [NSNumber numberWithInteger:AMA_WARN], @"warn",
                                   [NSNumber numberWithInteger:AMA_INFO], @"info",
                                   [NSNumber numberWithInteger:AMA_DEBUG], @"debug",
                                   [NSNumber numberWithInteger:AMA_VERBOSE], @"verbose",
                                   nil
                                   ];
    return (LogSeverity)[[LogSeverities objectForKey:self] intValue];
}
@end

#pragma mark -
#pragma mark ApigeeMobileAnalyticsPlugin
@implementation ApigeeMobileAnalyticsPlugin

-(CDVPlugin*) initWithWebView:(UIWebView*)theWebView
{
    self = (ApigeeMobileAnalyticsPlugin*)[super initWithWebView:theWebView];
    return self;
}

- (void)log:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{
    // Set up some defaults
    NSString *severity = @"debug";
    NSString *tag = [[NSBundle mainBundle] bundleIdentifier];
    NSString *message = @""; // An empty log message is pretty useless, but better than dying if left out
    
    if(options)
	{
        if ([options objectForKey:@"severity"] != nil) severity = [options objectForKey:@"severity"];
        if ([options objectForKey:@"tag"] != nil) tag = [options objectForKey:@"tag"];
        if ([options objectForKey:@"message"] != nil) message = [options objectForKey:@"message"];
    }
        
    switch ([severity logSeverityForString]) {
        
        case AMA_ASSERT:
            [InstaOpsLogger assert:tag format:@"%@",message];
            break;
            
        case AMA_ERROR:
            [InstaOpsLogger error:tag format:@"%@",message];
            break;
            
        case AMA_WARN:
            [InstaOpsLogger warn:tag format:@"%@",message];
            break;
            
        case AMA_INFO:
            [InstaOpsLogger info:tag format:@"%@",message];
            break;

        case AMA_VERBOSE:
            [InstaOpsLogger verbose:tag format:@"%@",message];
            break;

        default:
            [InstaOpsLogger debug:tag format:@"%@",message]; // default is "Debug"
            break;
            
    }
}

@end


