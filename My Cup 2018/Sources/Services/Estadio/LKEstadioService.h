//
//  LKEstadioService.h
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 12/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Estadio;
@interface LKEstadioService : NSObject

+ (void) getEstadios:(BOOL)cache callBack:(void (^)(NSArray<Estadio *> *, NSError *))callback;

@end
