//
//  DualWebAppDelegate.h
//  DualWeb
//
//  Created by Cesar Rivas on 7/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface DualWebAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	
	NSTextField *_textFieldLeft;
	WebView *_webViewLeft;
	
	NSTextField *_textFieldRight;
	WebView *_webViewRight;
	
	NSSplitView *_splitview;
	
	
}

- (IBAction)goLeft: (id)sender;
- (IBAction)goRight: (id)sender; 
- (IBAction)centerViews: (id)sender;
- (IBAction)reload: (id)sender;

- (void)resizeWindow;
- (void)spaceEvenly:(NSSplitView *)splitView;
- (float)getSizeOfSplitSubview:(int)index splitView:(NSSplitView *)splitView;

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet WebView *_webViewLeft;
@property (assign) IBOutlet NSTextField *_textFieldLeft;
@property (assign) IBOutlet WebView *_webViewRight;
@property (assign) IBOutlet NSTextField *_textFieldRight;
@property (assign) IBOutlet NSSplitView *_splitview;


@end
