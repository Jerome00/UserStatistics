//
//  ViewController.m
//  UserStatisticsWithRuntime
//
//  Created by JJ on 2017/4/19.
//  Copyright © 2017年 JJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [[UIButton alloc]init];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(100, 100, 60, 40);
    btn.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:btn];
}

-(void)click{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
