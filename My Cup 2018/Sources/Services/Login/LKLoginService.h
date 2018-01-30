//
//  LKLoginService.h
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 17/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Usuario;
@interface LKLoginService : NSObject

+ (BOOL)validarUsuario:(Usuario*)usuario;

+ (void)cadastrarUsuario:(Usuario *)novo;
    
@end
