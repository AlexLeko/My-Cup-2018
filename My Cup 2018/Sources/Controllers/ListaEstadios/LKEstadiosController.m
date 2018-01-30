//
//  LKEstadiosController.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 11/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKEstadiosController.h"
#import "Estadio.h"
#import "LKEstadioService.h"
#import "LKEstadioCell.h"
#import "LKDetalhesEstadioViewController.h"

@interface LKEstadiosController () <UITableViewDelegate, UITableViewDataSource>


@property (strong, nonatomic) NSArray<Estadio*> *listaEstadios;


@end

@implementation LKEstadiosController
static NSString *cellIdentifier = @"cellIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"LKEstadioCell" bundle:nil];
   
    [LKEstadioService getEstadios:YES callBack:^(NSArray<Estadio *> *listaEstadios, NSError *error) {
        if (!error) {
            self.listaEstadios = listaEstadios;
            [self.tableView reloadData];
        }else{
            NSLog(@"Error %@", error.localizedDescription);
        }
    }];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:cellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listaEstadios.count;
}



#pragma mark - Populando a cell estadio

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LKEstadioCell *cell = [tableView dequeueReusableCellWithIdentifier:@"estadioCell"];
    
    Estadio *estadio = self.listaEstadios[indexPath.row];
    cell.descricaoEstadio.text = [estadio descricao];
    cell.imagemEstadio.image = [UIImage imageNamed:estadio.url_imagem];
    
    NSURL *url = [NSURL URLWithString:estadio.url_imagem];
    NSData *dataImagem = [NSData dataWithContentsOfURL:url];
    cell.imagemEstadio.image = [UIImage imageWithData:dataImagem];
                                
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"segueDetalharEstadio"]){
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        LKDetalhesEstadioViewController *detalhe = [segue destinationViewController];
        [detalhe setEstadioSelecionado:self.listaEstadios[indexPath.row]];
    }    
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



@end
