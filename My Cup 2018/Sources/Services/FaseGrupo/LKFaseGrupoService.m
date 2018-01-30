//
//  LKFaseGrupoService.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 18/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKFaseGrupoService.h"
#import "FaseGrupo.h"
#import "LKFaseGrupoDBCoreData.h"


@implementation LKFaseGrupoService

static NSString *URL_FASE_GRUPO_JSON = @"https://api.myjson.com/bins/qf2n5";


#pragma mark: CONSUMINDO DADOS DA WEB

+ (void) getPartidaFaseGrupo:(BOOL)cache callBack:(void (^)(NSArray<FaseGrupo *> *, NSError *))callback{
    
    __block NSMutableArray<FaseGrupo*> *partidasFaseGrupo = nil;

    LKFaseGrupoDBCoreData *faseGrupoDBCD = [LKFaseGrupoDBCoreData new];
    
    if(cache){
        NSMutableArray<FaseGrupoCD*> *parseFaseGrupo = [faseGrupoDBCD getPartidasFaseGrupo];
        
        if (parseFaseGrupo.count == 0) {
            parseFaseGrupo = [@[] mutableCopy];
        }
        
        for (FaseGrupoCD *part in parseFaseGrupo){
            NSLog(@"Recuperando dados das partida da fase de grupo: %@", [part.timeA stringByAppendingString: part.timeB]);
            
            FaseGrupo *partida = [FaseGrupo new];
            partida.grupo = part.grupo;
            partida.timeA = part.timeA;
            partida.timeB = part.timeB;
            partida.data = part.data;
            partida.horario = part.horario;
            partida.diaSemana = part.diaSemana;
            partida.estadio = part.estadio;
            partida.escudoA = part.escudoA;
            partida.escudoB = part.escudoB;
            
            [partidasFaseGrupo addObject:partida];
        }
    }
    
    if(!partidasFaseGrupo || partidasFaseGrupo.count == 0){
        
        NSURL *url = [NSURL URLWithString:URL_FASE_GRUPO_JSON];
        
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
                                             partidasFaseGrupo = [self parserJSON:data];
                                             
                                             if (partidasFaseGrupo) {
                                                 [faseGrupoDBCD deletarTodasPartidas];
                                                 
                                                 for (FaseGrupo *part in partidasFaseGrupo){
                                                     
                                                     FaseGrupoCD *partidaCD = [LKFaseGrupoDBCoreData newInstance];
                                                     
                                                     partidaCD.grupo = part.grupo;
                                                     partidaCD.timeA = part.timeA;
                                                     partidaCD.timeB = part.timeB;
                                                     partidaCD.data = part.data;
                                                     partidaCD.horario = part.horario;
                                                     partidaCD.diaSemana = part.diaSemana;
                                                     partidaCD.estadio = part.estadio;
                                                     partidaCD.escudoA = part.escudoA;
                                                     partidaCD.escudoB = part.escudoB;
                                                     
                                                     [faseGrupoDBCD salvarPartida:partidaCD];
                                                 }
                                             }
                                         }
                                         dispatch_async(dispatch_get_main_queue(), ^{
                                             callback(partidasFaseGrupo, nil);
                                         });
                                     }] resume];
    }
    else{
        callback(partidasFaseGrupo, nil);
    }
}


+ (NSData*) recuperarDadosDoArquivoLocal{
    
    NSData *data = nil;
    NSString *stringPath = @"FaseGrupo";
    
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

+ (NSMutableArray<FaseGrupo*>*) parserJSON:(NSData*)data{
    
    NSLog(@"Parse por %@", NSStringFromSelector(_cmd));
    
    if (!data || [data length] == 0) {
        NSLog(@"Nenhum registro encontrado!");
    }
    
    NSError *jsonError;
    RootFaseGrupo *rootFaseGrupo = [[RootFaseGrupo alloc] initWithData:data error:&jsonError];
    
    if (jsonError) {
        NSLog(@"Erro %@", jsonError.description);
    }
    
    return rootFaseGrupo.faseGrupo;
}







@end
