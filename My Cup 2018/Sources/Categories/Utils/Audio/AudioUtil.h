//
//  AudioUtil.h
//  Som dos Bichos
//
//  Created by Cast Group on 09/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <AVFoundation/AVFoundation.h>

@interface SoundUtil : NSObject <AVAudioPlayerDelegate>

- (void) playFile:(NSString*)arquivo;
- (void) playURL:(NSURL*)url;


@end
