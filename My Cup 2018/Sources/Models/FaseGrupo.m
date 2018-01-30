//
//  FaseGrupo.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 18/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "FaseGrupo.h"

@implementation FaseGrupo

+ (NSString*) descricaoGrupoEnum:(LKEnumGrupos) enumGrupo{
    
    NSString *descricao = nil;
    
    switch (enumGrupo) {
        case A:
            descricao = @"A";
            break;
            
        case B:
            descricao = @"B";
            break;
            
        case C:
            descricao = @"C";
            break;
            
        case D:
            descricao = @"D";
            break;
            
        case E:
            descricao = @"E";
            break;
            
        case F:
            descricao = @"F";
            break;
            
        case G:
            descricao = @"G";
            break;
            
        case H:
            descricao = @"H";
            break;
            
        default:
            descricao = @"A";
            break;
    }
    return descricao;
}

+ (LKEnumGrupos) stringToEnum:(NSString*) grupo{
    
    if ([grupo isEqualToString:@"A"])
        return 0;
    else if ([grupo isEqualToString:@"B"])
        return 1;
    else if ([grupo isEqualToString:@"C"])
        return 2;
    else if ([grupo isEqualToString:@"D"])
        return 3;
    else if ([grupo isEqualToString:@"E"])
        return 4;
    else if ([grupo isEqualToString:@"F"])
        return 5;
    else if ([grupo isEqualToString:@"G"])
        return 6;
    else if ([grupo isEqualToString:@"H"])
        return 7;
    else
        return 0;
}

@end

@implementation RootFaseGrupo
@end
