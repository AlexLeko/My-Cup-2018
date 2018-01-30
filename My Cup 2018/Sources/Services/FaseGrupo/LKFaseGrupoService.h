//
//  LKFaseGrupoService.h
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 18/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FaseGrupo;
@interface LKFaseGrupoService : NSObject

+ (void) getPartidaFaseGrupo:(BOOL)cache callBack:(void (^)(NSArray<FaseGrupo *> *, NSError *))callback;

@end
