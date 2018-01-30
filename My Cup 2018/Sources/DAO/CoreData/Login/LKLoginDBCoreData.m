//
//  LKLoginDBCoreData.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 17/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKLoginDBCoreData.h"
#import "AppDelegate.h"

@implementation LKLoginDBCoreData

+ (NSManagedObjectContext*)context{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    return appDelegate.persistentContainer.viewContext;
}

+ (LoginCD *) newInstance {
    LoginCD *login = [NSEntityDescription insertNewObjectForEntityForName:
                      NSStringFromClass([LoginCD class]) inManagedObjectContext:[LKLoginDBCoreData context]];
    return login;
}

- (NSMutableArray<LoginCD*>*) recuperarUsuario:(NSString*)usuario senha:(NSString*)pass{
    
    NSManagedObjectContext *context = [LKLoginDBCoreData context];
    NSFetchRequest *request = [LoginCD fetchRequest];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"usuario == %@ AND senha == %@", usuario, pass];
    [request setPredicate:predicate];
    
    NSError *error;
    NSMutableArray *array = [[context executeFetchRequest:request error:&error] mutableCopy];
    
    if (!array) {
        NSLog(@"Erro durante acesso do usuário %@", error);
        return nil;
    }
    return array;
}

- (void) salvarLogin:(LoginCD *)login {
    NSManagedObjectContext *context = [LKLoginDBCoreData context];
    
    NSLog(@"Salvando o login [%@]", login);
    if (!login.timestamp) {
        login.timestamp = [NSDate date];
    }
    
    NSError *error;
    BOOL saveOk = [context save:&error];
    if (!saveOk) {
        NSLog(@"Erro %@", error);
    } else {
        NSLog(@"O login [%@] foi incluido com sucesso", login);
    }
}

- (void) deletarLogin:(LoginCD *)login{
    NSManagedObjectContext *context = [LKLoginDBCoreData context];
    [context deleteObject:login];
    [context save:nil];
}



@end
