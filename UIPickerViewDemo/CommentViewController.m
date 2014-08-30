#import "CommentViewController.h"


@interface CommentViewController ()

@end

@implementation CommentViewController

@synthesize nameTF = _nameTF;
@synthesize contentTF = _contentTF;
//@synthesize contentText = _contentText;


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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _labela.text = _string1;
    _labelb.text = _string2;
    _test1.text = _string3;
    _test2.text = _string4;
    
    NSString *star = _string3;
    NSString *sex = _string4;
    
    UIImageView *subview = [[UIImageView alloc] initWithFrame:
                            CGRectMake(0.0f, 0.0f, 62.0f, 62.0f)];
    
    [_userstaricon addSubview:subview];
    
    if ([sex isEqual: @"g"]) {
        if ([star isEqual: @"1"]) {
            [subview setImage:[UIImage imageNamed:@"starpink-32.png"]];
        } else {
            if ([star isEqual: @"2"]) {
                [subview setImage:[UIImage imageNamed:@"starpink-42.png"]];
            } else {
                if ([star isEqual: @"3"]) {
                    
                    [subview setImage:[UIImage imageNamed:@"starpink-43.png"]];
                } else {
                    if ([star isEqual: @"4"]) {
                        
                        [subview setImage:[UIImage imageNamed:@"starpink-33.png"]];
                    } else {
                        if ([star isEqual: @"5"]) {
                            
                            [subview setImage:[UIImage imageNamed:@"starpink-40.png"]];
                        } else {
                            if ([star isEqual: @"6"]) {
                                
                                [subview setImage:[UIImage imageNamed:@"starpink-41.png"]];
                            } else {
                                if ([star isEqual: @"7"]) {
                                    
                                    [subview setImage:[UIImage imageNamed:@"starpink-34.png"]];
                                } else {
                                    if ([star isEqual: @"8"]) {
                                        
                                        [subview setImage:[UIImage imageNamed:@"starpink-38.png"]];
                                    } else {
                                        if ([star isEqual: @"9"]) {
                                            
                                            [subview setImage:[UIImage imageNamed:@"starpink-39.png"]];
                                        } else {
                                            if ([star isEqual: @"10"]) {
                                                
                                                [subview setImage:[UIImage imageNamed:@"starpink-35.png"]];
                                            } else {
                                                if ([star isEqual: @"11"]) {
                                                    
                                                    [subview setImage:[UIImage imageNamed:@"starpink-36.png"]];
                                                } else {
                                                    if ([star isEqual: @"12"]) {
                                                        
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
    } else {
        if ([star isEqual: @"1"]) {
            [subview setImage:[UIImage imageNamed:@"starblue-32.png"]];
        } else {
            if ([star isEqual: @"2"]) {
                
                [subview setImage:[UIImage imageNamed:@"starblue-42.png"]];
            } else {
                if ([star isEqual: @"3"]) {
                    
                    [subview setImage:[UIImage imageNamed:@"starblue-43.png"]];
                } else {
                    if ([star isEqual: @"4"]) {
                        [subview setImage:[UIImage imageNamed:@"starblue-33.png"]];
                    } else {
                        if ([star isEqual: @"5"]) {
                            
                            [subview setImage:[UIImage imageNamed:@"starblue-40.png"]];
                        } else {
                            if ([star isEqual: @"6"]) {
                                
                                [subview setImage:[UIImage imageNamed:@"starblue-41.png"]];
                            } else {
                                if ([star isEqual: @"7"]) {
                                    
                                    [subview setImage:[UIImage imageNamed:@"starblue-34.png"]];
                                } else {
                                    if ([star isEqual: @"8"]) {
                                        
                                        [subview setImage:[UIImage imageNamed:@"starblue-38.png"]];
                                    } else {
                                        if ([star isEqual: @"9"]) {
                                            
                                            [subview setImage:[UIImage imageNamed:@"starblue-39.png"]];
                                        } else {
                                            if ([star isEqual: @"10"]) {
                                                
                                                [subview setImage:[UIImage imageNamed:@"starblue-35.png"]];
                                            } else {
                                                if ([star isEqual: @"11"]) {
                                                    
                                                    [subview setImage:[UIImage imageNamed:@"starblue-36.png"]];
                                                } else {
                                                    if ([star isEqual: @"12"]) {
                                                        
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
    [_userstaricon addSubview:subview];
}


-(void) postID:(NSString*) iden Name:(NSString *) name Sex:(NSString *) sex Zodiac:(NSString *) zodiac Content:(NSString *) content Count:(NSString *) count Date:(NSString *) date Url: (NSString*) url {
    
    NSMutableString *postString = [NSMutableString stringWithString:url];
    [postString appendString:[NSString stringWithFormat:@"?id=%@",iden]];
    [postString appendString:[NSString stringWithFormat:@"&name=%@",name]];
    [postString appendString:[NSString stringWithFormat:@"&sex=%@",sex]];
    [postString appendString:[NSString stringWithFormat:@"&zodiac=%@",zodiac]];
    [postString appendString:[NSString stringWithFormat:@"&content=%@",content]];
    [postString appendString:[NSString stringWithFormat:@"&count=%@",count]];
    [postString appendString:[NSString stringWithFormat:@"&date=%@",date]];
    
    [postString setString:[postString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:postString]];
    [request setHTTPMethod:@"POST"];
    postConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setUserstaricon:nil];
    [self setLabela:nil];
    [self setLabelb:nil];
    [self setTest2:nil];
    [self setTest1:nil];
    [self setNameTF:nil];
    [self setContentTF:nil];
    [super viewDidUnload];
}


- (IBAction)sendClick:(id)sender {
    [self postID:nil Name:_nameTF.text Sex:_string4 Zodiac:_string3 Content:_contentTF.text Count:nil Date:@"NOW()" Url:kPostURL ];
    NSLog(@"%@%@",_string3,_string4);
    
}

- (IBAction)sendClickG:(id)sender {
    [self postID:nil Name:_nameTF_G.text Sex:_string4 Zodiac:_string3 Content:_contentTF_G.text Count:nil Date:@"NOW()" Url:kPostURLG];
    NSLog(@"%@%@",_string3,_string4);
    
}

@end