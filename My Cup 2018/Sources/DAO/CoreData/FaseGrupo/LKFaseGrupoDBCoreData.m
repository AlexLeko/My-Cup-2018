//
//  LKFaseGrupoDBCoreData.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 18/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKFaseGrupoDBCoreData.h"
#import "AppDelegate.h"

@implementation LKFaseGrupoDBCoreData

+ (NSManagedObjectContext*)context{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    return appDelegate.persistentContainer.viewContext;
}

+ (FaseGrupoCD *) newInstance {
    FaseGrupoCD *grupo = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([FaseGrupoCD class]) inManagedObjectContext:[LKFaseGrupoDBCoreData context]];
    return grupo;
}

- (NSMutableArray<FaseGrupoCD*> *) getPartidasFaseGrupo {
    
    NSManagedObjectContext *context = [LKFaseGrupoDBCoreData context];
    NSFetchRequest *request = [FaseGrupoCD fetchRequest];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timestamp" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    NSError *error;
    NSMutableArray *array = [[context executeFetchRequest:request error:&error] mutableCopy];
    if (!array) {
        NSLog(@"Erro %@", error);
        return nil;
    }
    NSLog(@"DB > getPartidasFaseGrupo [%@]", array);
    return array;
}

- (void) salvarPartida:(FaseGrupoCD *)partida {
    
    NSManagedObjectContext *context = [LKFaseGrupoDBCoreData context];
    NSLog(@"Salvando partida da fase de grupos [%@]", partida);
    
    if (!partida.timestamp) {
        partida.timestamp = [NSDate date];
    }
    NSError *error;
    BOOL saveOk = [context save:&error];
    if (!saveOk) {
        NSLog(@"Erro %@", error);
    } else {
        NSLog(@"Partida [%@] cadastrada com sucesso", partida);
    }
}


- (void) deletarTodasPartidas {
    NSMutableArray *faseGrupos = [self getPartidasFaseGrupo];
    for (FaseGrupoCD *fg in faseGrupos) {
        [self deletar:fg];
    }
}


- (void) deletar:(FaseGrupoCD *)partida {
    NSManagedObjectContext *context = [LKFaseGrupoDBCoreData context];
    [context deleteObject:partida];
    [context save:nil];
}



@end
