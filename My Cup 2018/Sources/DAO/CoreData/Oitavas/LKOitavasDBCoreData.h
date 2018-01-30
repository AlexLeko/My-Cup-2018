//
//  LKOitavasDBCoreData.h
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 17/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "My_Cup_2018+CoreDataModel.h"
#import "MataMataCD+CoreDataClass.h"

@interface LKOitavasDBCoreData : NSObject

+ (EstadioCD *) newInstance;

- (NSMutableArray<EstadioCD*> *) buscarTodasPartidas;

- (void) salvar:(MataMataCD *)matamata;

- (void) deletarMataMata:(EstadioCD *)matamata;

- (void) deletarTodasPartidasMatamata;


@end
