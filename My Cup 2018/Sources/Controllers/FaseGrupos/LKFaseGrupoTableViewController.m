//
//  LKFaseGrupoTableViewController.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 18/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKFaseGrupoTableViewController.h"
#import "FaseGrupo.h"
#import "LKFaseGrupoService.h"
#import "LKFaseGrupoCell.h"


@interface LKFaseGrupoTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray<FaseGrupo*> *listaFaseGrupo;
@property (nonatomic, strong) NSDictionary *dicionarioFaseGrupos;

@end

@implementation LKFaseGrupoTableViewController
static NSString *cellIdentifier = @"cellIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.dataSource = self;
    
    [LKFaseGrupoService getPartidaFaseGrupo:YES callBack:^(NSArray<FaseGrupo *> *listaPartidas, NSError *error) {
        if (!error) {
            NSMutableDictionary *dicionarioGrupos = [@{} mutableCopy];
            
            for (FaseGrupo *grupo in listaPartidas) {
                NSMutableArray *listaGrupos = [dicionarioGrupos objectForKey: grupo.grupo];
                
                if(listaGrupos == nil){
                    listaGrupos = [@[] mutableCopy];
                    [dicionarioGrupos setObject:listaGrupos forKey: grupo.grupo];
                }
                
                [listaGrupos addObject:grupo];
            }
            self.dicionarioFaseGrupos = dicionarioGrupos;
            [self.tableView reloadData];
            
        }else{
            NSLog(@"Error %@", error.localizedDescription);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dicionarioFaseGrupos.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.dicionarioFaseGrupos objectForKey:[FaseGrupo descricaoGrupoEnum:section]] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"Grupo %@", [FaseGrupo descricaoGrupoEnum: section]];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LKFaseGrupoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellFaseGrupo"];
    
    FaseGrupo *faseGrupo = [self.dicionarioFaseGrupos objectForKey:[FaseGrupo descricaoGrupoEnum: indexPath.section]][indexPath.row];
    cell.imgTimeA.image = [UIImage imageNamed:faseGrupo.escudoA];
    cell.imgTimeB.image = [UIImage imageNamed:faseGrupo.escudoB];
    cell.txtTimeA.text = [faseGrupo timeA];
    cell.txtTimeB.text = [faseGrupo timeB];
    cell.lblData.text = [faseGrupo data];
    cell.lblHorario.text = [faseGrupo horario];
    cell.lblEstadio.text = [faseGrupo estadio];
    
    NSURL *urlA = [NSURL URLWithString:faseGrupo.escudoA];
    NSData *dataImagemA = [NSData dataWithContentsOfURL:urlA];
    cell.imgTimeA.image = [UIImage imageWithData:dataImagemA];
    
    NSURL *urlB = [NSURL URLWithString:faseGrupo.escudoB];
    NSData *dataImagemB = [NSData dataWithContentsOfURL:urlB];
    cell.imgTimeB.image = [UIImage imageWithData:dataImagemB];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
