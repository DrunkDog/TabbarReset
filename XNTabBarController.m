//
//  XNTabBarController.m
//  AreaProtect
//
//  Created by 赵帅 on 16/3/16.
//  Copyright © 2016年 赵帅. All rights reserved.
//自定义tabbar

#import "XNTabBarController.h"
#import "XNTabBarButton.h"
#import "XNTabBarView.h"

@interface XNTabBarController ()<XNTabBarViewDelegate>
@property(nonatomic,weak)UIButton *selectedButton;
@end

@implementation XNTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect rect = self.tabBar.frame;
    [self.tabBar removeFromSuperview];//移除tabbarcontroller自带的下部的条
    
    XNTabBarView *myView = [[XNTabBarView alloc]init];
    myView.frame = rect;
    myView.delegate = self;
    myView.backgroundColor = [UIColor colorWithWhite:0.95f alpha:1.0];
    [self.view addSubview:myView];
    NSArray *array = [[NSArray alloc]initWithObjects:@"首页",@"消息",@"我", nil];
    
    for (int i=0; i<self.viewControllers.count; i++)
    {
        [myView addButtonWithString:[array objectAtIndex:i] selectedString:nil];
        
        
    }
}

//-(void)clickBtn:(UIButton *)sender
//{
//    //1.将之前的选中的按钮设置为未选中
//    self.selectedButton.selected=NO;
//    //2.再将当前按钮设置为选中
//    sender.selected=YES;
//    //3.重新赋值
//    self.selectedButton = sender;
//    //4.跳转到相应的试图控制器
//    self.selectedIndex = sender.tag;
//}
-(void)tabBar:(XNTabBarView *)tabBarView selectedFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
