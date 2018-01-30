//
//  LKMapaEstadioViewController.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 15/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKMapaEstadioViewController.h"
#import <MapKit/MapKit.h>

@interface LKMapaEstadioViewController () <MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation LKMapaEstadioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest; // precisao da localização no raio.
    [self.locationManager requestWhenInUseAuthorization]; // autorização do usuario.
    [self.locationManager startUpdatingLocation]; // inicia as config.
    
    if(self.estadio != nil){
        //self.txtLocal.text = self.viagem.local;
        
        CLLocationCoordinate2D coordenadas;
        coordenadas.longitude =  [self.estadio.longitude doubleValue];
        coordenadas.latitude  = [self.estadio.latitude doubleValue];
        
        MKPointAnnotation *anotacao = [MKPointAnnotation new];
        anotacao.coordinate = coordenadas;
        //anotacao.title = self.viagem.local;
        
       // [self.mapaEstadio addAnnotation:anotacao];
        
        MKCoordinateSpan zoom = MKCoordinateSpanMake(0.001, 0.001);
        MKCoordinateRegion region = MKCoordinateRegionMake(coordenadas, zoom);
        
        //[self.mapaEstadio setRegion:region];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
