//
//  ViewController.m
//  MoreTab
//
//  Created by xixi on 2019/7/15.
//  Copyright © 2019 xixi. All rights reserved.
//

#import "ViewController.h"
#import "XMenuView.h"

@interface ViewController ()
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    XMenuView *v = [[XMenuView alloc] initWithFrame:CGRectMake(0, 100, kScreen_Width, 40.f)];
    [self.view addSubview:v];
}


@end
