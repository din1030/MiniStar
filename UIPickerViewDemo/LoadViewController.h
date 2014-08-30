//
//  LoadViewController.h
//  ConstellationDemo
//
//  Created by din1030 on 13/1/14.
//  Copyright (c) 2013年 EraSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kGETUrl @"http://140.119.19.34/din/getjson.php"

@interface LoadViewController : UITableViewController
@property (nonatomic, strong) NSDictionary* json;
@property (nonatomic, strong) NSMutableArray* starComment;
@property (nonatomic, strong) NSMutableArray* nameArray;
@end
