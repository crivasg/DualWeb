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
@synthesize _splitview;

static CGFloat statusHeigth = 20.0;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
	
	[self resizeWindow];
	
}

- (void)awakeFromNib {
	
	[self centerViews:NULL];
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

- (IBAction)centerViews: (id)sender
{

	CGFloat h = [ _splitview frame].size.height;
	CGFloat w = [ _splitview frame].size.width;
	CGFloat divider = [_splitview dividerThickness];
	
	CGFloat desiredWidth = ( w - divider ) / 2.0;
	
	NSRect dividerRect1 = NSMakeRect(0.0,0.0, desiredWidth, h);
	NSRect dividerRect2 = NSMakeRect(desiredWidth+ divider,0.0, desiredWidth, h);

	NSArray *subviews = [_splitview subviews];
	NSView *subview = [subviews objectAtIndex:0];
	NSView *subview2 = [subviews objectAtIndex:1];
	
	subview.frame = dividerRect1;
	subview2.frame = dividerRect2;
	
	NSArray *newArray = [NSArray arrayWithObjects:subview, subview2, nil];
	[_splitview setSubviews:newArray];
	[_splitview adjustSubviews];
	
//	//
//	CGFloat w1 =[ self getSizeOfSplitSubview:0 splitView:_splitview ];
//	CGFloat w2 =[ self getSizeOfSplitSubview:1 splitView:_splitview ];	
//	
//	NSLog(@"X:%f Y:%f", w1,w2 );
	
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
	return YES;
}

- (void) resizeWindow {
	
	NSRect usableScreenRect = [[NSScreen mainScreen] visibleFrame];
	/*NSRect vRect = NSMakeRect(usableScreenRect.size.width/2.0, 0.0, 
							  1.0, usableScreenRect.size.height);
	 */
	
	[window setFrame:usableScreenRect display:YES animate:NO];

	[self spaceEvenly:_splitview];
	// have the AppKit redraw the dividers
	[_splitview adjustSubviews];


	CGFloat toolbarHeight = 0.0;
	NSRect windowFrame;
	
	float leftSubviewWidth = [self getSizeOfSplitSubview:0 splitView:_splitview];
	float rightSubviewWidth = [self getSizeOfSplitSubview:1 splitView:_splitview];
	
	windowFrame = [NSWindow contentRectForFrameRect:[window frame]
										  styleMask:[window styleMask]];
	
	toolbarHeight = NSHeight(windowFrame) - NSHeight([[window contentView] frame]);
	//NSLog(@"Width %@ %.3f",NSStringFromRect(windowFrame), toolbarHeight);

	
	
	NSRect webRightRect =  NSMakeRect(0.0,statusHeigth,rightSubviewWidth, 
									  windowFrame.size.height - statusHeigth);
	
	NSRect webLeftRect =  NSMakeRect(0.0,statusHeigth,leftSubviewWidth, 
									 windowFrame.size.height - statusHeigth);
	
	[_webViewRight setFrame:webRightRect];
	[_webViewLeft  setFrame:webLeftRect];
	 
}

- (void)spaceEvenly:(NSSplitView *)splitView
{
	// get the subviews of the split view
	NSArray *subviews = [splitView subviews];
	unsigned int n = [subviews count];
	
	// compute the new height of each subview
	float divider = [splitView dividerThickness];
	float height = ([splitView bounds].size.height - (n - 1) * divider) / n; 
	
	// adjust the frames of all subviews
	float y = 0;
	NSView *subview;
	NSEnumerator *e = [subviews objectEnumerator];
	while ((subview = [e nextObject]) != nil)
	{
		NSRect frame = [subview frame];
		frame.origin.y = rintf(y);
		frame.size.height = rintf(y + height) - frame.origin.y;
		[subview setFrame:frame];
		y += height + divider;
	}
	
}

- (float)getSizeOfSplitSubview:(int)index splitView:(NSSplitView *)splitView
{
	NSArray *subviews = [splitView subviews];
	float w = -1.0;
	
	NSView *subview = [subviews objectAtIndex:index];
	NSRect frame = [subview frame];
	
	NSLog(@"|--> %@", NSStringFromRect(frame));
	
	w = frame.size.width;
	
	return w;
	
	
}


@end
