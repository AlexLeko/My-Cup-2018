//
//  LKFaseGrupoCell.h
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 18/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LKFaseGrupoCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *imgTimeA;
@property (weak, nonatomic) IBOutlet UIImageView *imgTimeB;


@property (weak, nonatomic) IBOutlet UILabel *txtTimeA;
@property (weak, nonatomic) IBOutlet UILabel *txtTimeB;


@property (weak, nonatomic) IBOutlet UILabel *lblData;
@property (weak, nonatomic) IBOutlet UILabel *lblHorario;
@property (weak, nonatomic) IBOutlet UILabel *lblEstadio;




@end
