//
//  LKEstadioDBCoreData.h
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 12/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "My_Cup_2018+CoreDataModel.h"
#import "EstadioCD+CoreDataClass.h"

@interface LKEstadioDBCoreData : NSObject


+ (EstadioCD *) newInstance;

- (NSMutableArray<EstadioCD *>*) getEstadios;

- (void) salvar:(EstadioCD*)estadio;

- (void) deletarEstadio:(EstadioCD*)estadio;

- (void) deletarTodosEstadios;


@end
