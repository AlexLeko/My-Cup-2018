//
//  LKVideoUtils.h
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 16/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <AVKit/AVKit.h>
#include <AVFoundation/AVFoundation.h>

@interface LKVideoUtils : NSObject

- (void) playFile:(NSString*) file withView:(UIView*)view;
- (void) playURL:(NSURL*)url withView:(UIView*)view;

- (void) playFileFullScreen:(NSString*)file controller:(UIViewController*)controller;
- (void) playURLFullScreen:(NSURL*)url controller:(UIViewController*)controller;

-(void)pause;
-(void)stop;

@end
