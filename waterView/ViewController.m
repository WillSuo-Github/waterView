//
//  ViewController.m
//  waterView
//
//  Created by ws on 16/7/11.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewController.h"
#import "waterLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    waterLayout *layout = [[waterLayout alloc] init];
    
    CollectionViewController *collectionView = [[CollectionViewController alloc] initWithCollectionViewLayout:layout];
    
    [self presentViewController:collectionView animated:YES completion:nil];
}



@end
