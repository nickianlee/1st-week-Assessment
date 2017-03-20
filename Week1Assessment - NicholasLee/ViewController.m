//
//  ViewController.m
//  Week1Assessment - NicholasLee
//
//  Created by nicholaslee on 20/03/2017.
//  Copyright © 2017 nicholaslee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, assign) int no1;
@property (nonatomic ,assign) int no2;
@property (nonatomic ,assign) int sum;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray* operatorButtons;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for(UIButton *button in self.operatorButtons){
    [button addTarget:self action:@selector(calculateNum:) forControlEvents:UIControlEventTouchUpInside];
   self.tabBarController.tabBar.userInteractionEnabled = NO;
    
    }
}

-(void) calculateNum:(UIButton*)sender  {
    _no1 = [self.textField1.text intValue];
    _no2 = [self.textField2.text intValue];
    
    
    if([sender.titleLabel.text isEqualToString:@"+"]) {
        _sum = _no1 + _no2;
    }else if ([sender.titleLabel.text isEqualToString:@"-"])  {
        _sum = _no1 - _no2;
    }else if ([sender.titleLabel.text isEqualToString:@"x"]) {
        _sum = _no1 * _no2;
    }else if ([sender.titleLabel.text isEqualToString:@"÷"])  {
        _sum = _no1 / _no2;
    }else {
        return;
    }
    
    if(self.tabBarController.tabBar.userInteractionEnabled == YES) {
        self.tabBarController.tabBar.userInteractionEnabled = NO;
    }
    
    self.resultLabel.text = [NSString stringWithFormat:@"Result is:%d", _sum];
    
    
        if(_sum%9 ==0){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"GENIUS" message:NULL preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Good" style: UIAlertActionStyleDestructive handler:NULL];
            
            [alert addAction:dismissAction];
            [self presentViewController:alert animated:YES completion:NULL];
        }
    
    if  (_sum == 999){
        [self.tabBarController setSelectedIndex:1];
        self.tabBarController.tabBar.userInteractionEnabled = YES;
    }
}




@end
