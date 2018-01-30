//
//  LKLoginService.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 17/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKLoginService.h"
#import "Usuario.h"
#import "LKLoginDBCoreData.h"


@implementation LKLoginService

+ (BOOL) validarUsuario:(Usuario*)usuario{
    LKLoginDBCoreData *loginDBCD = [LKLoginDBCoreData new];
    NSMutableArray<LoginCD*> *user = [loginDBCD recuperarUsuario:usuario.usuario senha:usuario.senha];
        
    if (user.count > 0) {
        return YES;
    }
    return NO;
}

+ (void) cadastrarUsuario:(Usuario *)novo{
    LoginCD *login = [LKLoginDBCoreData newInstance];
    login.usuario = novo.usuario;
    login.senha = novo.senha;
    
    LKLoginDBCoreData *loginDBCD = [LKLoginDBCoreData new];
    [loginDBCD salvarLogin:login];
}




@end
