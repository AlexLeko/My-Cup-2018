//
//  LKLoginViewController.m
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 17/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import "LKLoginViewController.h"
#import "LKLoginService.h"
#import "LKMenuViewController.h"

@interface LKLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtNome;
@property (weak, nonatomic) IBOutlet UITextField *txtSenha;


@end

@implementation LKLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.txtNome resignFirstResponder];
    [self.txtSenha resignFirstResponder];
}

#pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
     if ([segue.identifier isEqualToString:@"segueEntrar"]) {
         
         if([self.txtNome hasText] && [self.txtSenha hasText]){
             Usuario *user = [Usuario new];
             user.usuario = self.txtNome.text;
             user.senha = self.txtSenha.text;
         
             BOOL valido = [LKLoginService validarUsuario: user];
         
             if(!valido){
                 UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"LOGIN" message:@"Nome/Senha inválidos!" preferredStyle:(UIAlertControllerStyleAlert)];
                 
                 UIAlertAction *acaoOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                 [alert addAction:acaoOK];
                 
                 [self presentViewController:alert animated:YES completion:nil];
             }
             self.txtNome.text = @"";
             self.txtSenha.text = @"";
         }
         else{
             UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"LOGIN"
                message:@"Campos obrigatórios não preenchidos." preferredStyle: (UIAlertControllerStyleAlert)];
             
             UIAlertAction *acaoOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
             [alert addAction:acaoOK];
             
             [self presentViewController:alert animated:YES completion:nil];
         }
         
     }
     
     if ([segue.identifier isEqualToString:@"seguePrimeiroAcesso"]) {
         
         if([self.txtNome hasText] && [self.txtSenha hasText]){
             Usuario *user = [Usuario new];
             user.usuario = self.txtNome.text;
             user.senha = self.txtSenha.text;
             
             NSError *erro = nil;
             
             [LKLoginService cadastrarUsuario: user];
             
             if(!erro){
             
                 UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"LOGIN"
                                                                                message:@"Cadastro realizado com sucesso!" preferredStyle: (UIAlertControllerStyleAlert)];
             
                 UIAlertAction *acaoOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                 [alert addAction:acaoOK];
             
                 [self presentViewController:alert animated:YES completion:nil];
             
                 self.txtNome.text = @"";
                 self.txtSenha.text = @"";
             }
         }
         else{
             NSString *title = @"LOGIN";
             NSString *msg = @"Campos obrigatórios não preenchidos.";
             
             UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                message:msg preferredStyle: (UIAlertControllerStyleAlert)];
             
             UIAlertAction *acaoOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
             [alert addAction:acaoOK];
             [self presentViewController:alert animated:YES completion:nil];
         }         
     }
     
     
 }




@end
