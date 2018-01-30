//
//  AudioUtil.m
//  Som dos Bichos
//
//  Created by Cast Group on 09/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import "AudioUtil.h"

@implementation SoundUtil{
    AVAudioPlayer *_player;
}

- (void) playFile:(NSString*)arquivo{
    if (!_player) {
        NSString *path = [[[NSBundle mainBundle] resourcePath]
                          stringByAppendingPathComponent: arquivo];
        
        //criar a url apartir de um arquivo.
        NSURL *url = [NSURL fileURLWithPath:path];
        [self playURL:url];
        
    }else{
        [_player play];
    }
}


- (void) playURL:(NSURL*)url{
    
    if (!_player) {
        NSError *error;
        // inicializa o player com a url do arquivo.
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        //configura o volume de 0.0 a 1.0
        [_player setVolume:1.0];
        
        if(!error){
            _player.delegate = self;
            [_player play];
        }
        else{
            NSLog(@"Erro: %@", error.localizedDescription);
        }
    }
}

#pragma MARK: - AVAudioPlayerDelegate
- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    NSLog(@"FIM");
    _player = nil;
}

@end
