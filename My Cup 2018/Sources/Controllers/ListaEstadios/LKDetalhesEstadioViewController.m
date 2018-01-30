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
    
    self.descricaoEstadio.text = [self.estadioSelecionado descricao];
    self.cidadeEstadio.text = [self.estadioSelecionado cidade];
    self.infoEstadio.text = [self.estadioSelecionado informacao];
    
    NSURL *url = [NSURL URLWithString:self.estadioSelecionado.url_imagem];
    NSData *dataImagem = [NSData dataWithContentsOfURL:url];
    self.imagemEstadio.image = [UIImage imageWithData:dataImagem];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)localizarEstadio:(id)sender {
}

- (IBAction)visualizarVideoEstadio:(id)sender {
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        
    if ([segue.identifier isEqualToString:@"segueEstadioMap"]) {
        LKMapaEstadioViewController *mapa = segue.destinationViewController;
        mapa.estadio = self.estadioSelecionado;
    }

    if ([segue.identifier isEqualToString:@"segueEstadioVideo"]) {
        LKVideoEstadioViewController *detalheVideo = segue.destinationViewController;
        detalheVideo.estadio = self.estadioSelecionado;
    }
}


@end
