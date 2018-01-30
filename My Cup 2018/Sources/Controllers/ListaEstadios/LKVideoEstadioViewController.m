//
//  LKVideoEstadioViewController.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 16/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKVideoEstadioViewController.h"
#import "LKVideoUtils.h"
#include <XCDYouTubeKit/XCDYouTubeKit.h>

@interface LKVideoEstadioViewController ()

@property (weak, nonatomic) IBOutlet UILabel *descricaoEstadio;
@property (weak, nonatomic) IBOutlet UIView *playerEstadio;


@end

@implementation LKVideoEstadioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.descricaoEstadio.text = self.estadio.descricao;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)visualizarVideo:(id)sender {
    NSString *idVideo = [self.estadio.url_video componentsSeparatedByString:@"="][1];
    
    XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:idVideo];
    [videoPlayerViewController presentInView:self.playerEstadio];
    [videoPlayerViewController.moviePlayer play];
    
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
