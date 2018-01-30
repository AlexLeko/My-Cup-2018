//
//  FaseGrupo.h
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 18/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONAPI.h"

typedef NS_ENUM(NSUInteger, LKEnumGrupos) {
    A=0, B=1, C=2, D=3, E=4, F=5, G=6, H=7
};

@interface FaseGrupo : JSONModel

@property (nonatomic, strong)NSString *grupo;
@property (nonatomic, strong)NSString *timeA;
@property (nonatomic, strong)NSString *timeB;
@property (nonatomic, strong)NSString *data;
@property (nonatomic, strong)NSString *horario;
@property (nonatomic, strong)NSString *diaSemana;
@property (nonatomic, strong)NSString *estadio;
@property (nonatomic, strong)NSString *escudoA;
@property (nonatomic, strong)NSString *escudoB;

+ (NSString*) descricaoGrupoEnum:(LKEnumGrupos) enumGrupo;
+ (LKEnumGrupos) stringToEnum:(NSString*) grupo;

@end

@protocol FaseGrupo
@end

@interface RootFaseGrupo : JSONModel

@property (nonatomic, strong)NSMutableArray<FaseGrupo> *faseGrupo;

@end
