//
//  LKFaseGrupoDBCoreData.h
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 18/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "My_Cup_2018+CoreDataModel.h"

@interface LKFaseGrupoDBCoreData : NSObject

+ (FaseGrupoCD *) newInstance;

- (NSMutableArray<FaseGrupoCD*> *) getPartidasFaseGrupo;

- (void) salvarPartida:(FaseGrupoCD *)partida;

- (void) deletarTodasPartidas;

- (void) deletar:(FaseGrupoCD *)partida;


@end
