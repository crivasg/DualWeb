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
@synthesize _verticalSeparator;

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
	
	NSRect rectLeft = [_textFieldLeft frame];
	
	NSRect usableScreenRect = [[NSScreen mainScreen] visibleFrame];
	NSRect vRect = NSMakeRect(usableScreenRect.size.width/2.0, 0.0, 
							  1.0, usableScreenRect.size.height);
	
	NSRect webRightRect =  NSMakeRect(usableScreenRect.size.width/2.0+5.0, 20.0,
									   usableScreenRect.size.width/2.0-10.0, 
									   usableScreenRect.size.height-100.0);
	
	NSRect webLeftRect =  NSMakeRect(5.0, 20.0,
									   usableScreenRect.size.width/2.0-10.0, 
									   usableScreenRect.size.height-100.0);
	
	
	NSLog(@"Width %@",NSStringFromRect(rectLeft));

	[window setFrame:usableScreenRect display:YES animate:NO];
	[_verticalSeparator setFrame:vRect];
	[_webViewRight setFrame:webRightRect];
	[_webViewLeft setFrame:webLeftRect];
	

}

@end
