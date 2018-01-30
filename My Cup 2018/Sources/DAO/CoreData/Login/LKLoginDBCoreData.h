//
//  LKLoginDBCoreData.h
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 17/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "My_Cup_2018+CoreDataModel.h"
#import "LoginCD+CoreDataClass.h"

@interface LKLoginDBCoreData : NSObject

+ (LoginCD *) newInstance;

- (NSMutableArray<LoginCD*>*) recuperarUsuario:(NSString*)usuario senha:(NSString*)pass;

- (void) salvarLogin:(LoginCD *)login;

- (void) deletarLogin:(LoginCD *)login;


@end
