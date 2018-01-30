//
//  LKDetalhesEstadioViewController.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 15/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKDetalhesEstadioViewController.h"
#import "LKMapaEstadioViewController.h"
#import "LKVideoEstadioViewController.h"

@interface LKDetalhesEstadioViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imagemEstadio;

@property (weak, nonatomic) IBOutlet UILabel *descricaoEstadio;

@property (weak, nonatomic) IBOutlet UILabel *cidadeEstadio;

@property (weak, nonatomic) IBOutlet UITextView *infoEstadio;


@end

@implementation LKDetalhesEstadioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imagemEstadio.image = [UIImage imageNamed:[self.estadioSelecionado url_imagem]];
    self.descricaoEstadio.text = [self.estadioSelecionado descricao];
    self.cidadeEstadio.text = [self.estadioSelecionado cidade];
    self.infoEstadio.text = [self.estadioSelecionado informacao];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)localizarEstadio:(id)sender {
    UIStoryboardSegue *segue = @"segueEstadioMap";
    LKMapaEstadioViewController *detalheMapa = segue.destinationViewController;
    detalheMapa.estadio = self.estadioSelecionado;
}

- (IBAction)visualizarVideoEstadio:(id)sender {
    UIStoryboardSegue *segue = @"segueEstadioVideo";
    LKVideoEstadioViewController *detalheVideo = segue.destinationViewController;
    detalheVideo.estadio = self.estadioSelecionado;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
//    if ([segue.identifier isEqualToString:@"segueEstadioMap"]) {
//        LKMapaEstadioViewController *detalheMapa = segue.destinationViewController;
//        detalheMapa.estadio = self.estadioSelecionado;
//    }

//    if ([segue.identifier isEqualToString:@"segueEstadioVideo"]) {
//        LKVideoEstadioViewController *detalheVideo = segue.destinationViewController;
//        detalheVideo.estadio = self.estadioSelecionado;
//    }
}


@end
