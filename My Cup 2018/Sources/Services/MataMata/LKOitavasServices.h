//
//  LKOitavasServices.h
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 17/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LKOitavas;
@interface LKOitavasServices : NSObject

+ (void) getPartidasMataMata:(BOOL)cache callBack:(void (^)(NSArray<LKOitavas *> *, NSError *))callback;

@end
