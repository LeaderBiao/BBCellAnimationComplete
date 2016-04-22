//
//  ViewController.m
//  BBCellAnimationComplete
//
//  Created by Biao on 16/4/21.
//  Copyright © 2016年 Biao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UINavigationBar *navBar;
}

/**
 *  @author Biao
 *
 *  上一个cell的下标
 */
@property (nonatomic,assign)long lastCellIndex;

/**
 *  @author Biao
 *
 *  判断tableView是否已经显示完毕
 */
@property (nonatomic,assign)BOOL isApper;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:0];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    self.isApper = true;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"123";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID
                  ];
        cell.backgroundColor = [UIColor magentaColor];
    }
    
    cell.textLabel.text = @"BiaoBiao";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

/**
 *  @author Biao
 *
 *  willDisplayCell
 */
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //转动特效
    CATransform3D rotaion;
    rotaion = CATransform3DMakeRotation((90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotaion.m34 = 1.0 / -600;
    
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    cell.layer.transform = rotaion;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    [UIView beginAnimations:@"rotaion" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
    
    [UIView animateWithDuration:0.5 animations:^{
        cell.layer.transform = CATransform3DIdentity;
        cell.alpha = 1;
        cell.layer.shadowOffset = CGSizeMake(0, 0);
    }];
    
    
}


@end
