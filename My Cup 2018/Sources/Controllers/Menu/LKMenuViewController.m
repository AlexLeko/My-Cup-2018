//
//  LKMenuViewController.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 17/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKMenuViewController.h"
#import "AudioUtil.h"

@interface LKMenuViewController ()

@property (nonatomic, strong)SoundUtil *soundUtil;

@end

@implementation LKMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.soundUtil = [[SoundUtil alloc] init];
    [self.soundUtil playFile:@"vinhetaFox.mp3"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)visualizarEstadios:(id)sender {
    [self.soundUtil playFile:@"front-desk.mp3"];
}

- (IBAction)visualizarTabela:(id)sender {
    [self.soundUtil playFile:@"ice-cubes.mp3"];
   
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
