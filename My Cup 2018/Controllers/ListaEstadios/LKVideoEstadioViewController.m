//
//  LKVideoEstadioViewController.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 16/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKVideoEstadioViewController.h"
#import "LKVideoUtils.h"

@interface LKVideoEstadioViewController ()

@property (weak, nonatomic) IBOutlet UILabel *descricaoEstadio;

@property (weak, nonatomic) IBOutlet UIView *playerEstadio;

@property (strong, nonatomic) LKVideoUtils *videoUtil;

@end

@implementation LKVideoEstadioViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.videoUtil = [[LKVideoUtils alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)visualizarVideo:(id)sender {
    NSURL *url = [NSURL URLWithString:self.estadio.url_video];
    [self.videoUtil playURL:url withView:self.playerEstadio];
}


- (IBAction)pausarVideo:(id)sender {
    [self.videoUtil pause];
}


- (IBAction)pararVideo:(id)sender {
    [self.videoUtil stop];
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
