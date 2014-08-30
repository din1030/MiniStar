//
//  LoadViewCell.h
//  ConstellationDemo
//
//  Created by din1030 on 13/1/14.
//  Copyright (c) 2013年 EraSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *star_icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *zodiac;
@property (weak, nonatomic) IBOutlet UILabel *comment;
@end
