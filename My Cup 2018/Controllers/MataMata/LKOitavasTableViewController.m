//
//  LKOitavasTableViewController.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 17/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKOitavasTableViewController.h"
#import "LKOitavas.h"
#import "LKOitavasServices.h"
#import "LKMataMataTableViewCell.h"


@interface LKOitavasTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)NSArray<LKOitavas*> *listaOitavas;

@end

@implementation LKOitavasTableViewController
static NSString *cellMataMata = @"cellMataMata";

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"LKOitavasCell" bundle:nil];
    
    
    [LKOitavasServices getPartidasMataMata:YES callBack:^(NSArray<LKOitavas *> *oitavas, NSError *error) {
        if (!error) {
            self.listaOitavas = oitavas;
            [self.tableView reloadData];
        }else{
            NSLog(@"Error %@", error.localizedDescription);
        }
    }];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:cellMataMata];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listaOitavas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellMataMata" forIndexPath:indexPath];
    
    LKMataMataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellMataMata"];
    
    LKOitavas *oitava = self.listaOitavas[indexPath.row];
    cell.numeroPartida.text = [NSString stringWithFormat:@"%i", oitava.numeroPartida];
    cell.dataPartida.text = oitava.data;
    cell.horarioPartida.text = oitava.horario;
    cell.estadioPartida.text = oitava.estadio;
    cell.timeA.text = oitava.timeA;
    cell.timeB.text = oitava.timeB;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
//    if([segue.identifier isEqualToString:@"segueDetalharEstadio"]){
//        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
//        LKDetalhesEstadioViewController *detalhe = [segue destinationViewController];
//        [detalhe setEstadioSelecionado:self.listaEstadios[indexPath.row]];
//    }
    
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
