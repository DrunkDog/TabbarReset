//
//  XNTabBarView.m
//  AreaProtect
//
//  Created by 赵帅 on 16/3/16.
//  Copyright © 2016年 赵帅. All rights reserved.
//

#import "XNTabBarView.h"
#import "XNTabBarButton.h"

@interface XNTabBarView()
@property(nonatomic,weak)UIButton *selectedButton;

@end

@implementation XNTabBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        NSArray *array = [[NSArray alloc]initWithObjects:@"首页",@"消息",@"我", nil];
        for (int i =0; i<3; i++)
        {
            XNTabBarButton *btn = [[XNTabBarButton alloc]init];
            [btn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorFromHexCode:@"333333"] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
            
            
            [self addSubview:btn];
            btn.tag = i;
            
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            if (i==0)
            {
                btn.selected = YES;
                self.selectedButton= btn;
                btn.backgroundColor=[UIColor colorFromHexCode:@"#d7d7d7"];
            }
            
        }
    }
    return self;
}
-(void)addButtonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    UIButton *btn = [[UIButton alloc] init];
    
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selectedImage forState:UIControlStateSelected];
    
    [self addSubview:btn];
    
    //带参数的监听方法记得加"冒号"
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //如果是第一个按钮, 则选中(按顺序一个个添加)
    if (self.subviews.count == 1) {
        [self clickBtn:btn];
    }
    
}
-(void)addButtonWithString:(NSString *)string selectedString:(NSString *)selectedString
{
    UIButton *btn = [[UIButton alloc] init];
    
    [btn setTitle:string forState:UIControlStateNormal];
    [btn setTitle:selectedString forState:UIControlStateSelected];
    
    [self addSubview:btn];
    
    //带参数的监听方法记得加"冒号"
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //如果是第一个按钮, 则选中(按顺序一个个添加)
    if (self.subviews.count == 1) {
        [self clickBtn:btn];
    }
    

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    int count = (int)self.subviews.count;
    for (int i = 0; i < count; i++) {
        //取得按钮
        UIButton *btn = self.subviews[i];
        
        btn.tag = i; //设置按钮的标记, 方便来索引当前的按钮,并跳转到相应的视图
        
        CGFloat x = i * self.bounds.size.width / count;
        CGFloat y = 0;
        CGFloat width = self.bounds.size.width / count;
        CGFloat height = self.bounds.size.height;
        btn.frame = CGRectMake(x, y, width, height);
    }  
}

-(void)clickBtn:(UIButton *)sender
{
    //1.将之前的选中的按钮设置为未选中
    self.selectedButton.selected=NO;
    self.selectedButton.backgroundColor=[UIColor colorFromHexCode:@"#f2f2f2"];
    //2.再将当前按钮设置为选中
    sender.selected=YES;
    sender.backgroundColor=[UIColor colorFromHexCode:@"#d7d7d7"];
    //3.重新赋值
    self.selectedButton = sender;
    //4.跳转到相应的试图控制器
    
    if ([self.delegate respondsToSelector:@selector(tabBar:selectedFrom:to:)]) {
        [self.delegate tabBar:self selectedFrom:self.selectedButton.tag to:sender.tag];
    }
}


@end
