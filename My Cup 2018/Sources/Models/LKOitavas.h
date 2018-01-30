//
//  LKOitavas.h
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 17/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONAPI.h"

@interface LKOitavas : NSObject

@property (nonatomic, assign)NSInteger *numeroPartida;
@property (nonatomic, strong)NSString *timeA;
@property (nonatomic, strong)NSString *timeB;
@property (nonatomic, strong)NSString *data;
@property (nonatomic, strong)NSString *horario;
@property (nonatomic, strong)NSString *diaSemana;
@property (nonatomic, strong)NSString *estadio;
@property (nonatomic, strong)NSString *cidade;


@end

#pragma mark : [MAPPING]

@protocol Oitavas
@end

@interface RootOitavas : JSONModel

@property (nonatomic, strong)NSMutableArray<Oitavas> *oitavas;

@end
