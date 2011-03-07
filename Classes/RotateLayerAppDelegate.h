//
//  RotateLayerAppDelegate.h
//  RotateLayer
//
//  Created by Giovambattista Fazioli on 08/03/11.
//  Copyright Saidmade Srl 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RotateLayerViewController;

@interface RotateLayerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RotateLayerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RotateLayerViewController *viewController;

@end

