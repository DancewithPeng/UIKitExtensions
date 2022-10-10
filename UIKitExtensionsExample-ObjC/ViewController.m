//
//  ViewController.m
//  UIKitExtensionsExample-ObjC
//
//  Created by DancewithPeng on 2020/7/8.
//  Copyright © 2020 dancewithpeng@gmail.com. All rights reserved.
//

#import "ViewController.h"
#import <UIKitExtensions/UIKitExtensions.h>
#import <DPLog/DPLog.h>
#import <DPLog/DPLog-Swift.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewDidTap:)]];
    
    UITableView *tableView;
}

- (void)viewDidTap:(id)sender {
    UIViewController *childVC = [[UIViewController alloc] init];
    childVC.view.backgroundColor = UIColor.redColor;
    childVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:childVC animated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    DPLogDebug(self.currentVisibleViewController);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    DPLogDebug(self.currentVisibleViewController);
}

@end
