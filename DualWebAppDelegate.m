//
//  DualWebAppDelegate.m
//  DualWeb
//
//  Created by Cesar Rivas on 7/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DualWebAppDelegate.h"


@implementation DualWebAppDelegate

@synthesize window;
@synthesize _webViewLeft;
@synthesize _textFieldLeft;
@synthesize _webViewRight;
@synthesize _textFieldRight;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
	
	[self resizeWindow];
	
}

- (void)awakeFromNib {
	[ _textFieldLeft setStringValue:@"http://google.com" ];
	[ _textFieldRight setStringValue:@"http://news.ycombinator.com/news" ];
	
	[ self goLeft:NULL];
	[ self goRight:NULL];

}

- (IBAction)goLeft: (id)sender
{
	NSString *address = [_textFieldLeft stringValue];
	[ [ _webViewLeft mainFrame ] loadRequest:[NSURLRequest requestWithURL:
											  [NSURL URLWithString:address]]];
}

- (IBAction)goRight: (id)sender
{
	NSString *address = [_textFieldRight stringValue];
	[ [ _webViewRight mainFrame ] loadRequest:[NSURLRequest requestWithURL:
											  [NSURL URLWithString:address]]];
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
	return YES;
}

- (void) resizeWindow {
	
    //NSArray *screenArray = [NSScreen screens];
    //NSScreen *mainScreen = [NSScreen mainScreen];
    //unsigned screenCount = [screenArray count];
    //unsigned index  = 0;
	
	NSRect  usableScreenRect = [[NSScreen mainScreen] visibleFrame];
	
	NSLog(@"Width %@",NSStringFromRect(usableScreenRect));

	[window setFrame:usableScreenRect display:YES animate:YES];
	

}

@end
