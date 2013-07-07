//
//  triangleAppDelegate.h
//  triangle
//
//  Created by PHILIP JACOBS on 7/6/13.
//  Copyright (c) 2013 PHILIP JACOBS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface triangleAppDelegate : UIResponder <UIApplicationDelegate> {
	View *view;
	UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
