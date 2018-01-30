//
//  LKVideoUtils.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 16/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKVideoUtils.h"

@implementation LKVideoUtils {
    AVPlayerViewController *_playerController;
}


- (void)playFile:(NSString *)file withView:(UIView *)view{
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:nil];
    if (path) {
        NSURL *url = [NSURL fileURLWithPath:path];
        NSLog(@"URL %@", url);
        [self playURL:url withView:view];
    }
}


- (void) playURL:(NSURL *)url withView:(UIView *)view{
    @try {
        if(!_playerController){
            AVPlayer *player = [AVPlayer playerWithURL:url];
            _playerController = [[AVPlayerViewController alloc] init];
            _playerController.player = player;
            
            [_playerController.view setFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
            
            _playerController.showsPlaybackControls = YES;
            
            [view addSubview:_playerController.view];
        }
        [_playerController.player play];
        
    } @catch (NSException *exception) {
        NSLog(@"Error %@", [exception description]);
    }
}

- (void) playFileFullScreen:(NSString *)file controller:(UIViewController *)controller{
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:nil];
    if (path) {
        NSURL *url = [NSURL fileURLWithPath:path];
        NSLog(@"URL %@", url);
        [self playURLFullScreen:url controller:controller];
    }
}

- (void)playURLFullScreen:(NSURL *)url controller:(UIViewController *)controller{
    
    @try {
        
        
    } @catch (NSException *exception) {
        NSLog(@"Error %@", [exception description]);
    }
}

- (void) pause{
    [_playerController.player pause];
}

- (void) stop{
    [_playerController.player pause];
    _playerController.player = nil;
    _playerController = nil;
}

@end
