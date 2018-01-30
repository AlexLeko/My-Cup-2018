//
//  LKOitavasServices.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 17/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKOitavasServices.h"
#import "LKOitavas.h"
#import "LKOitavasDBCoreData.h"

@implementation LKOitavasServices


// MUDAR API PARA OITAVAS - APOS UPLOAD
static NSString *URL_OITAVAS_JSON = @"https://api.myjson.com/bins/n445p";

+ (void) getPartidasMataMata:(BOOL)cache callBack:(void (^)(NSArray<LKOitavas *> *, NSError *))callback{
    
    __block NSMutableArray<LKOitavas*> *listaOitavas= nil;
    
    LKOitavasDBCoreData *oitavasDBCD = [LKOitavasDBCoreData new];
    
    if(cache){
        
        NSMutableArray<MataMataCD*> *parseOitavas = [oitavasDBCD buscarTodasPartidas];
        
        if (parseOitavas.count == 0) {
            listaOitavas = [@[] mutableCopy];
        }
        
        for (MataMataCD *oito in parseOitavas){
            NSLog(@"Recuperando dados da partida de oitadas numero: %@",[NSString stringWithFormat:@"%d", oito.numeroPartida]);
            
            LKOitavas *oitava = [LKOitavas new];
            oitava.numeroPartida = oito.numeroPartida;
            oitava.timeA = oito.timeA;
            oitava.timeB = oito.timeB;
            oitava.data = oito.data;
            oitava.horario = oito.horario;
            oitava.diaSemana = oito.diaSemana;
            oitava.estadio = oito.estadio;
            oitava.cidade = oito.cidade;
            
            [listaOitavas addObject:oitava];
        }
    }
    
    
    if(!listaOitavas || listaOitavas.count == 0){
        
        NSURL *url = [NSURL URLWithString:URL_OITAVAS_JSON];
        
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
                                             listaOitavas = [self parserJSON:data];
                                             
                                             if (listaOitavas) {
                                                 [oitavasDBCD deletarTodasPartidasMatamata];
                                                 
                                                 for (LKOitavas *oito in listaOitavas){
                                                     MataMataCD *mataCD = [LKOitavasDBCoreData newInstance];
                                                     
                                                     mataCD.numeroPartida = oito.numeroPartida;
                                                     mataCD.timeA = oito.timeA;
                                                     mataCD.timeB = oito.timeB;
                                                     mataCD.data = oito.data;
                                                     mataCD.horario = oito.horario;
                                                     mataCD.diaSemana = oito.diaSemana;
                                                     mataCD.estadio = oito.estadio;
                                                     mataCD.cidade = oito.cidade;
                                                     
                                                     [oitavasDBCD salvar:oito];
                                                 }
                                             }
                                         }
                                         
                                         dispatch_async(dispatch_get_main_queue(), ^{
                                             callback(listaOitavas, nil);
                                         });
                                     }] resume];
    }
    else{
        callback(listaOitavas, nil);
    }
}


+ (NSData*) recuperarDadosDoArquivoLocal{
    
    NSData *data = nil;
    NSString *stringPath = @"Oitavas";
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

+ (NSMutableArray<LKOitavas*>*) parserJSON:(NSData*)data{
    
    NSLog(@"Parse por %@", NSStringFromSelector(_cmd));
    
    if (!data || [data length] == 0) {
        NSLog(@"Nenhum registro encontrado!");
    }
    
    NSError *jsonError;    
    RootOitavas *rootOitavas= [[RootOitavas alloc] initWithData:data error:&jsonError];
    
    if (jsonError) {
        NSLog(@"Erro %@", jsonError.description);
    }
    
    return rootOitavas.oitavas;
}







@end
