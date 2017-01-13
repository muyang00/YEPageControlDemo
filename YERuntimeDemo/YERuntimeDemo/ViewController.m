//
//  ViewController.m
//  YERuntimeDemo
//
//  Created by yongen on 17/1/12.
//  Copyright © 2017年 yongen. All rights reserved.
//

#import <objc/runtime.h>
#import "ViewController.h"

#define kKeyWindow [UIApplication sharedApplication].keyWindow
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIPageControl *pageNor = [[UIPageControl alloc]initWithFrame:CGRectMake(10, 200, kScreenWidth - 20, 30)];
    pageNor.backgroundColor = [UIColor orangeColor];
    pageNor.currentPageIndicatorTintColor = [UIColor redColor];
    pageNor.pageIndicatorTintColor = [UIColor greenColor];
    pageNor.numberOfPages = 5;
    [self.view addSubview:pageNor];
    
    
    UIPageControl *page2 = [[UIPageControl alloc]initWithFrame:CGRectMake(10, 350, kScreenWidth - 20, 30)];
    page2.backgroundColor = [UIColor orangeColor];
    page2.currentPageIndicatorTintColor = [UIColor redColor];
    page2.pageIndicatorTintColor = [UIColor greenColor];
    page2.numberOfPages = 5;
    [page2 setValue:[UIImage imageNamed:@"home_page_pre"] forKeyPath:@"_pageImage"];
    [page2 setValue:[UIImage imageNamed:@"home_page_nor"] forKeyPath:@"_currentPageImage"];
    [self.view addSubview:page2];
    
    
    //遍历UIPageControl成员变量
    [self memberVariables];
    
}

#pragma mark - 遍历UIPageControl成员变量

- (void)memberVariables{
    // 获得所有的成员变量
    unsigned int outCount = 0;
    Ivar *ivarList = class_copyIvarList([UIPageControl class], &outCount);
    
    // 遍历所有的成员变量
    for (int i = 0; i < outCount; i++) {
        // 获得第i个成员变量
        Ivar ivar = ivarList[i];
        
        // 获得成员变量的名称和类型
        NSLog(@"%@ -> %s = %s", [UIPageControl class], ivar_getName(ivar), ivar_getTypeEncoding(ivar));
    }
    // 释放资源
    free(ivarList);
}



/*
 u_int count;
 objc_property_t *properties =class_copyPropertyList([UIPageControl class], &count);//class_copyPropertyList
 
 NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
 for (int i = 0; i<count; i++)
 {
 const char* propertyName =property_getName(properties[i]);
 NSLog(@"属性%@\n",[NSString stringWithUTF8String: propertyName]);
 [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
 }
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
