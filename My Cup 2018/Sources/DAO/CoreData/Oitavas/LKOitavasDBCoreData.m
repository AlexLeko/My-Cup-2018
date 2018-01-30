//
//  LKOitavasDBCoreData.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 17/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKOitavasDBCoreData.h"
#import "AppDelegate.h"

@implementation LKOitavasDBCoreData


+ (NSManagedObjectContext*)context{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    return appDelegate.persistentContainer.viewContext;
}

+ (MataMataCD *) newInstance {
    MataMataCD *matamata = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(
              [MataMataCD class]) inManagedObjectContext:[LKOitavasDBCoreData context]];
    return matamata;
}

- (NSMutableArray<EstadioCD*> *) buscarTodasPartidas{
    NSManagedObjectContext *context = [LKOitavasDBCoreData context];
    NSFetchRequest *request = [EstadioCD fetchRequest];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timestamp" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    NSError *error;
    NSMutableArray *array = [[context executeFetchRequest:request error:&error] mutableCopy];
    if (!array) {
        NSLog(@"Erro %@", error);
        return nil;
    }
    NSLog(@"DB > buscarTodasPartidas: %@", array);
    return array;
}


- (void) salvar:(MataMataCD *)matamata {
    NSManagedObjectContext *context = [LKOitavasDBCoreData context];
    
    NSLog(@"Salvando jogos de mata-mata [%@]", matamata);
    if (!matamata.timestamp) {
        matamata.timestamp = [NSDate date];
    }
    
    NSError *error;
    BOOL saveOk = [context save:&error];
    if (!saveOk) {
        NSLog(@"Erro %@", error);
    } else {
        NSLog(@"A partida [%@] foi salva com sucesso", matamata);
    }
}

- (void) deletarMataMata:(EstadioCD *)matamata{
    NSManagedObjectContext *context = [LKOitavasDBCoreData context];
    [context deleteObject:matamata];
    [context save:nil];
}

- (void) deletarTodasPartidasMatamata{
    NSMutableArray *matamata = [self buscarTodasPartidas];
    for (MataMataCD *mm in matamata) {
        [self deletarMataMata:mm];
    }
}


@end
