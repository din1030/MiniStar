//
//  LoadGirlViewController.h
//  ConstellationDemo
//
//  Created by din1030 on 13/1/14.
//  Copyright (c) 2013年 EraSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kGETUrl @"http://140.119.19.34/din/getjsonGirl.php"

@interface LoadGirlViewController : UITableViewController
@property (nonatomic, strong) NSDictionary* jsonG;
@property (nonatomic, strong) NSMutableArray* starCommentG;
@property (nonatomic, strong) NSMutableArray* nameArrayG;
@end
