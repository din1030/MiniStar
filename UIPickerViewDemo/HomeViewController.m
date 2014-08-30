//
//  HomeViewController.m
//  ConstellationDemo
//
//  Created by Rocio on 13/1/12.
//  Copyright (c) 2013年 EraSoft. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    NSMutableArray * anims = [[NSMutableArray alloc] init];
    UIImage *img1 = [UIImage imageNamed:@"logo1.png"];
    UIImage *img2 = [UIImage imageNamed:@"logo2.png"];
    UIImage *img3 = [UIImage imageNamed:@"logo3.png"];
    [anims addObject:img1];
    [anims addObject:img2];
    [anims addObject:img3];
    
    
    _image1.animationImages = anims;
    _image1.animationDuration = 1.0f;
    _image1.animationRepeatCount = 0;
    [_image1 startAnimating];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setImage1:nil];
    [super viewDidUnload];
}
@end
