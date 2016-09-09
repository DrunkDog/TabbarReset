//
//  XNTabBarView.h
//  AreaProtect
//
//  Created by 赵帅 on 16/3/16.
//  Copyright © 2016年 赵帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XNTabBarView;
@protocol XNTabBarViewDelegate <NSObject>

-(void)tabBar :(XNTabBarView *)tabBarView selectedFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface XNTabBarView : UIView
@property(nonatomic,weak)id <XNTabBarViewDelegate>delegate;
-(void)addButtonWithImage:(UIImage *)image  selectedImage:(UIImage *)selectedImage;
-(void)addButtonWithString:(NSString *)string selectedString:(NSString *)selectedString;

@end
