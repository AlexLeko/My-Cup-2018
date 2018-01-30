//
//  LKEstadio.h
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 12/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONAPI.h"

@interface Estadio : JSONModel

@property (nonatomic, strong)NSString *descricao;
@property (nonatomic, strong)NSString *capacidade;
@property (nonatomic, strong)NSString *cidade;
@property (nonatomic, strong)NSString *url_imagem;
@property (nonatomic, strong)NSString *url_video;
@property (nonatomic, strong)NSString *latitude;
@property (nonatomic, strong)NSString *longitude;
@property (nonatomic, strong)NSString *informacao;


@end


#pragma mark : [MAPPING]

@protocol Estadio
@end

@interface Estadios : JSONModel

@property (nonatomic, strong)NSMutableArray<Estadio> *estadios;

@end

