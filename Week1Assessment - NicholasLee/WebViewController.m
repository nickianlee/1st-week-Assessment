//
//  WebViewController.m
//  Week1Assessment - NicholasLee
//
//  Created by nicholaslee on 20/03/2017.
//  Copyright © 2017 nicholaslee. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    [self loadURL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadURL {
    NSURL *URL = [NSURL URLWithString:@"https://www.google.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [self.webView loadRequest:request];
    
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError*) error {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"GENIUS" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Good" style: UIAlertActionStyleDestructive handler:NULL];
    
    if([error code] == NSURLErrorCancelled) return;
    
    [alert addAction:dismissAction];
    [self presentViewController:alert animated:YES completion:NULL];
    
}



@end
