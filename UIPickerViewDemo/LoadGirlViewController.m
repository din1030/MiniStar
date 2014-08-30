//
//  LoadViewController.m
//  ConstellationDemo
//
//  Created by din1030 on 13/1/14.
//  Copyright (c) 2013年 EraSoft. All rights reserved.
//

#import "LoadGirlViewController.h"
#import "LoadGirlCell.h"

@interface LoadGirlViewController ()

@end

@implementation LoadGirlViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self start];
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) getData:(NSData *) data{
    NSError *error;
    _jsonG = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    _starCommentG = [_jsonG objectForKey:@"starComment"]; // 剝第一層（把每個comment 存進 array）
    
    [self.tableView reloadData];
}

-(void) start{
    NSURL *url = [NSURL URLWithString:kGETUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    [self getData:data];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _starCommentG.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cellG";
    //NSLog(CellIdentifier);
    LoadGirlCell *cell = [tableView
                          dequeueReusableCellWithIdentifier:CellIdentifier
                          forIndexPath:indexPath];
    
    // Configure the cell...
    int row = [indexPath row];
    
    NSDictionary* temp = _starCommentG[row];
    //NSLog(temp);
    
    cell.nameG.text = [temp objectForKey:@"name"];
    cell.nameG.font = [UIFont systemFontOfSize:14.0];
    cell.nameG.frame =  CGRectMake(80, 30, 100, 20);
    
    
    NSString * zodiac_Str = [temp objectForKey:@"zodiac"];
    NSString* sex_Str = [temp objectForKey:@"sex"];
    //[zodiac_Str stringByAppendingString:sex_Str];
    cell.zodiacG.text = zodiac_Str;
    cell.zodiacG.font = [UIFont systemFontOfSize:15.0];
    cell.zodiacG.frame =  CGRectMake(200, 30, 100, 20);
    cell.zodiacG.hidden = YES;
    
    cell.commentG.text = [temp objectForKey:@"content"];
    cell.commentG.font = [UIFont systemFontOfSize:14.0];
    cell.commentG.frame =  CGRectMake(80, 40, 190, 50);
    
    
    UIImageView *subview = [[UIImageView alloc] initWithFrame:
                            CGRectMake(0.0f, 0.0f, 70.0f, 70.0f)];
    
    
    
    if ([sex_Str isEqualToString:@"g"]) {
        if ([zodiac_Str isEqualToString:@"1"]) {
            [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
            [subview setImage:[UIImage imageNamed:@"starpink-32.png"]];
        } else {
            if ([zodiac_Str isEqualToString:@"2"]) {
                [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                [subview setImage:[UIImage imageNamed:@"starpink-42.png"]];
            } else {
                if ([zodiac_Str isEqualToString:@"3"]) {
                    [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                    [subview setImage:[UIImage imageNamed:@"starpink-43.png"]];
                } else {
                    if ([zodiac_Str isEqualToString:@"4"]) {
                        [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                        [subview setImage:[UIImage imageNamed:@"starpink-33.png"]];
                    } else {
                        if ([zodiac_Str isEqualToString:@"5"]) {
                            [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                            [subview setImage:[UIImage imageNamed:@"starpink-40.png"]];
                        } else {
                            if ([zodiac_Str isEqualToString:@"6"]) {
                                [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                [subview setImage:[UIImage imageNamed:@"starpink-41.png"]];
                            } else {
                                if ([zodiac_Str isEqualToString:@"7"]) {
                                    [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                    [subview setImage:[UIImage imageNamed:@"starpink-34.png"]];
                                } else {
                                    if ([zodiac_Str isEqualToString:@"8"]) {
                                        [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                        [subview setImage:[UIImage imageNamed:@"starpink-38.png"]];
                                    } else {
                                        if ([zodiac_Str isEqualToString:@"9"]) {
                                            [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                            [subview setImage:[UIImage imageNamed:@"starpink-39.png"]];
                                        } else {
                                            if ([zodiac_Str isEqualToString:@"10"]) {
                                                [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                                [subview setImage:[UIImage imageNamed:@"starpink-35.png"]];
                                            } else {
                                                if ([zodiac_Str isEqualToString:@"11"]) {
                                                    [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                                    [subview setImage:[UIImage imageNamed:@"starpink-36.png"]];
                                                } else {
                                                    if ([zodiac_Str isEqualToString:@"12"]) {
                                                        [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                                        [subview setImage:[UIImage imageNamed:@"starpink-37.png"]];
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else if ([sex_Str isEqualToString:@"b"]) {
        if ([zodiac_Str isEqualToString:@"1"]) {
            [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
            [subview setImage:[UIImage imageNamed:@"starblue-32.png"]];
        } else {
            if ([zodiac_Str isEqualToString:@"2"]) {
                [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                [subview setImage:[UIImage imageNamed:@"starblue-42.png"]];
            } else {
                if ([zodiac_Str isEqualToString:@"3"]) {
                    [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                    [subview setImage:[UIImage imageNamed:@"starblue-43.png"]];
                } else {
                    if ([zodiac_Str isEqualToString:@"4"]) {
                        [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                        [subview setImage:[UIImage imageNamed:@"starblue-33.png"]];
                    } else {
                        if ([zodiac_Str isEqualToString:@"5"]) {
                            [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                            [subview setImage:[UIImage imageNamed:@"starblue-40.png"]];
                        } else {
                            if ([zodiac_Str isEqualToString:@"6"]) {
                                [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                [subview setImage:[UIImage imageNamed:@"starblue-41.png"]];
                            } else {
                                if ([zodiac_Str isEqualToString:@"7"]) {
                                    [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                    [subview setImage:[UIImage imageNamed:@"starblue-34.png"]];
                                } else {
                                    if ([zodiac_Str isEqualToString:@"8"]) {
                                        [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                        [subview setImage:[UIImage imageNamed:@"starblue-38.png"]];
                                    } else {
                                        if ([zodiac_Str isEqualToString:@"9"]) {
                                            [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                            [subview setImage:[UIImage imageNamed:@"starblue-39.png"]];
                                        } else {
                                            if ([zodiac_Str isEqualToString:@"10"]) {
                                                [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                                [subview setImage:[UIImage imageNamed:@"starblue-35.png"]];
                                            } else {
                                                if ([zodiac_Str isEqualToString:@"11"]) {
                                                    [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                                    [subview setImage:[UIImage imageNamed:@"starblue-36.png"]];
                                                } else {
                                                    if ([zodiac_Str isEqualToString:@"12"]) {
                                                        [cell.star_iconG.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                                        [subview setImage:[UIImage imageNamed:@"starblue-37.png"]];
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    [cell.star_iconG addSubview:subview];
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
