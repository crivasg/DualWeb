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

static CGFloat statusHeigth = 20.0;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
	
	[self resizeWindow];
	
}

- (void)awakeFromNib {
	[ _textFieldLeft setStringValue:@"http://duckduckgo.com" ];
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
	
	NSRect usableScreenRect = [[NSScreen mainScreen] visibleFrame];
	NSRect vRect = NSMakeRect(usableScreenRect.size.width/2.0, 0.0, 
							  1.0, usableScreenRect.size.height);

	
	[window setFrame:usableScreenRect display:YES animate:NO];
	[_verticalSeparator setFrame:vRect];


	CGFloat toolbarHeight = 0.0;
	NSRect windowFrame;
	
	windowFrame = [NSWindow contentRectForFrameRect:[window frame]
										  styleMask:[window styleMask]];
	
	toolbarHeight = NSHeight(windowFrame) - NSHeight([[window contentView] frame]);
	NSLog(@"Width %@ %.3f",NSStringFromRect(windowFrame), toolbarHeight);
	
	
	NSRect webRightRect =  NSMakeRect(usableScreenRect.size.width/2.0,statusHeigth,
									  usableScreenRect.size.width/2.0, 
									  windowFrame.size.height - statusHeigth);
	
	NSRect webLeftRect =  NSMakeRect(0.0,statusHeigth,
									 usableScreenRect.size.width/2.0, 
									 windowFrame.size.height - statusHeigth);
	
	[_webViewRight setFrame:webRightRect];
	[_webViewLeft setFrame:webLeftRect];
}

@end
