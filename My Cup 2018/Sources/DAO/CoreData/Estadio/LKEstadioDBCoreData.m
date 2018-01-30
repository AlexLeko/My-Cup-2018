//
//  LKEstadioDBCoreData.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 12/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKEstadioDBCoreData.h"
#import "AppDelegate.h"

@implementation LKEstadioDBCoreData

+ (NSManagedObjectContext*)context{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    return appDelegate.persistentContainer.viewContext;
}

+ (EstadioCD *) newInstance {
    EstadioCD *stadium = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(
                                            [EstadioCD class]) inManagedObjectContext:[LKEstadioDBCoreData context]];
    return stadium;
}

- (NSMutableArray<EstadioCD*> *) getEstadios{
    NSManagedObjectContext *context = [LKEstadioDBCoreData context];
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
    NSLog(@"DB > getEstadios: %@", array);
    return array;
}


- (void) salvar:(EstadioCD *)estadio {
    NSManagedObjectContext *context = [LKEstadioDBCoreData context];
    
    NSLog(@"Salvando Carro [%@]", estadio);
    if (!estadio.timestamp) {
        estadio.timestamp = [NSDate date];
    }
    
    NSError *error;
    BOOL saveOk = [context save:&error];
    if (!saveOk) {
        NSLog(@"Erro %@", error);
    } else {
        NSLog(@"O Estádio [%@] foi salvo com sucesso", estadio);
    }
}

- (void) deletarEstadio:(EstadioCD *)estadio{
    NSManagedObjectContext *context = [LKEstadioDBCoreData context];
    [context deleteObject:estadio];
    [context save:nil];
}

- (void) deletarTodosEstadios{
    NSMutableArray *estadios = [self getEstadios];
    for (EstadioCD *std in estadios) {
        [self deletarEstadio:std];
    }
}

@end
