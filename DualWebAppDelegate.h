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
	
	NSBox *_verticalSeparator;
	
}

- (IBAction)goLeft: (id)sender;
- (IBAction)goRight: (id)sender; 

- (void) resizeWindow;

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet WebView *_webViewLeft;
@property (assign) IBOutlet NSTextField *_textFieldLeft;
@property (assign) IBOutlet WebView *_webViewRight;
@property (assign) IBOutlet NSTextField *_textFieldRight;

@property (assign) IBOutlet NSBox *_verticalSeparator;

@end
