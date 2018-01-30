//
//  LKEstadioService.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 12/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKEstadioService.h"
#import "Estadio.h"
#import "LKEstadioDBCoreData.h"



@implementation LKEstadioService

static NSString *URL_ESTADIOS_JSON = @"https://api.myjson.com/bins/wvu9t";


#pragma mark: CONSUMINDO DADOS DA WEB

+ (void) getEstadios:(BOOL)cache callBack:(void (^)(NSArray<Estadio *> *, NSError *))callback{
    
    __block NSMutableArray<Estadio*> *listaEstadios = nil;
    LKEstadioDBCoreData *estadioDBCD = [LKEstadioDBCoreData new];
    
    if(cache){
        NSMutableArray<EstadioCD*> *parseEstadios = [estadioDBCD getEstadios];
            
        if (parseEstadios.count == 0) {
            listaEstadios = [@[] mutableCopy];
        }
            
        for (EstadioCD *std in parseEstadios){
            NSLog(@"Recuperando dados do estadio: %@", std.descricao);
                
            Estadio *stadium = [Estadio new];
            stadium.descricao = std.descricao;
            stadium.capacidade = std.capacidade;
            stadium.cidade = std.cidade,
            stadium.url_imagem = std.url_imagem;
            stadium.url_video = std.url_video;
            stadium.latitude = std.latitude;
            stadium.longitude = std.longitude;
            stadium.informacao = std.informacao;
                
            [listaEstadios addObject:stadium];
        }
    }
        
    if(!listaEstadios || listaEstadios.count == 0){
        
            NSURL *url = [NSURL URLWithString:URL_ESTADIOS_JSON];
        
            [[[NSURLSession sharedSession] dataTaskWithURL: url
                                         completionHandler:^(NSData * _Nullable data,
                                                             NSURLResponse * _Nullable response,
                                                             NSError * _Nullable error) {
                                             
            if (error) {
                NSLog(@"Erro ao consumir dados da web, recuperando arquivo local!");
                data = [self recuperarDadosDoArquivoLocal];
            }
            else{
                NSLog(@"Consumindo dados da web...");
            }
            
            if (data) {
                listaEstadios = [self parserJSON:data];
                
                if (listaEstadios) {
                    [estadioDBCD deletarTodosEstadios];
                    
                    for (Estadio *std in listaEstadios){
                                                
                        EstadioCD *stadium = [LKEstadioDBCoreData newInstance];
                        
                        stadium.descricao = std.descricao;
                        stadium.capacidade = std.capacidade;
                        stadium.cidade = std.cidade,
                        stadium.url_imagem = std.url_imagem;
                        stadium.url_video = std.url_video;
                        stadium.latitude = std.latitude;
                        stadium.longitude = std.longitude;
                        stadium.informacao = std.informacao;
                        
                        [estadioDBCD salvar:stadium];
                    }
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(listaEstadios, nil);
            });
        }] resume];
    }
    else{
        callback(listaEstadios, nil);
    }
}


+ (NSData*) recuperarDadosDoArquivoLocal{
    
    NSData *data = nil;
    
    NSString *stringPath = @"Estadios";
    NSString *sourcePath = nil;
    sourcePath = [[NSBundle mainBundle] pathForResource:stringPath ofType:@".json"];
    
    if (sourcePath) {
        data = [[NSData alloc] initWithContentsOfFile:sourcePath];
    }else{
        NSLog(@"Arquivo não encontrado!");
    }
    
    return data;
}


#pragma mark: [JSON]

+ (NSMutableArray<Estadio*>*) parserJSON:(NSData*)data{
    
    NSLog(@"Parse por %@", NSStringFromSelector(_cmd));
    
    if (!data || [data length] == 0) {
        NSLog(@"Nenhum registro encontrado!");
    }
    
    NSError *jsonError;
    
    Estadios *rootEstadios = [[Estadios alloc] initWithData:data error:&jsonError];
    
    if (jsonError) {
        NSLog(@"Erro %@", jsonError.description);
    }
    
    return rootEstadios.estadios;
}

@end
