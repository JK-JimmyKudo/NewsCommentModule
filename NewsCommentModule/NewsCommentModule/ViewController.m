//
//  ViewController.m
//  NewsCommentModule
//
//  Created by power on 2022/10/18.
//

#import "ViewController.h"
#import "NewsCommentViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    NewsCommentViewController *viewController = [[NewsCommentViewController alloc] init];
//    viewController.newsID = self.newsIDTextField.text;
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
