//
//  BGUIViewController.m
//  ConstellationDemo
//
//  Created by Rocio on 13/1/11.
//  Copyright (c) 2013年 EraSoft. All rights reserved.
//

#import "BGUIViewController.h"

@interface BGUIViewController ()

@end

@implementation BGUIViewController

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
    UIImage *img1 = [UIImage imageNamed:@"circle-1.png"];
    UIImage *img2 = [UIImage imageNamed:@"circle-2.png"];
    UIImage *img3 = [UIImage imageNamed:@"circle-3.png"];
    UIImage *img4 = [UIImage imageNamed:@"circle-4.png"];
    UIImage *img5 = [UIImage imageNamed:@"circle-5.png"];
    [anims addObject:img1];
    [anims addObject:img2];
    [anims addObject:img3];
    [anims addObject:img4];
    [anims addObject:img5];
    
    _image01.animationImages = anims;
    _image01.animationDuration = 1.8f;
    _image01.animationRepeatCount = 0;
    [_image01 startAnimating];

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setImage01:nil];
    [super viewDidUnload];
}
@end
