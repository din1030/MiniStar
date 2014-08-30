#import "ViewController.h"


@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void) prepareData {
    data = [[NSMutableDictionary alloc] init];
    [data setValue:[NSArray arrayWithObjects:@"牡羊",@"金牛",@"雙子",@"巨蟹",@"獅子",@"處女",@"天秤",@"天蠍",@"射手",@"摩羯",@"水瓶",@"雙魚",nil] forKey:@"女"];
    [data setValue:[NSArray arrayWithObjects:@"牡羊",@"金牛",@"雙子",@"巨蟹",@"獅子",@"處女",@"天秤",@"天蠍",@"射手",@"摩羯",@"水瓶",@"雙魚",nil] forKey:@"男"];
    //keys =[data allKeys];
    keys =[[data allKeys]
           sortedArrayUsingComparator:(NSComparator)^(id obj1,id obj2){
               return [obj1 caseInsensitiveCompare:obj2];
           }];
}

//當使用者選中某個 component 內的某筆資料時
-(void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSString *key = [keys objectAtIndex:[thePickerView selectedRowInComponent:0]];
    NSArray *array = [data objectForKey:key];
    NSString *labelstar = [array objectAtIndex:[thePickerView selectedRowInComponent:1]];
    NSString *labelsex = key;
    label.text = labelstar;
    label1.text = labelsex;
    
    UIImageView *subview = [[UIImageView alloc] initWithFrame:
                            CGRectMake(0.0f, 0.0f, 88.0f, 88.0f)];
    
    
    if ([labelsex isEqual: @"女"]) {
        if ([labelstar isEqual: @"牡羊"]) {
            [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
            [subview setImage:[UIImage imageNamed:@"starpink-32.png"]];
            t1 = @"1";
            t2 = @"g";
        } else {
            if ([labelstar isEqual: @"金牛"]) {
                [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                [subview setImage:[UIImage imageNamed:@"starpink-42.png"]];
                t1 = @"2";
                t2 = @"g";
            } else {
                if ([labelstar isEqual: @"雙子"]) {
                    [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                    [subview setImage:[UIImage imageNamed:@"starpink-43.png"]];
                    t1 = @"3";
                    t2 = @"g";
                } else {
                    if ([labelstar isEqual: @"巨蟹"]) {
                        [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                        [subview setImage:[UIImage imageNamed:@"starpink-33.png"]];
                        t1 = @"4";
                        t2 = @"g";
                    } else {
                        if ([labelstar isEqual: @"獅子"]) {
                            [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                            [subview setImage:[UIImage imageNamed:@"starpink-40.png"]];
                            t1 = @"5";
                            t2 = @"g";
                        } else {
                            if ([labelstar isEqual: @"處女"]) {
                                [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                [subview setImage:[UIImage imageNamed:@"starpink-41.png"]];
                                t1 = @"6";
                                t2 = @"g";
                            } else {
                                if ([labelstar isEqual: @"天秤"]) {
                                    [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                    [subview setImage:[UIImage imageNamed:@"starpink-34.png"]];
                                    t1 = @"7";
                                    t2 = @"g";
                                } else {
                                    if ([labelstar isEqual: @"天蠍"]) {
                                        [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                        [subview setImage:[UIImage imageNamed:@"starpink-38.png"]];
                                        t1 = @"8";
                                        t2 = @"g";
                                    } else {
                                        if ([labelstar isEqual: @"射手"]) {
                                            [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                            [subview setImage:[UIImage imageNamed:@"starpink-39.png"]];
                                            t1 = @"9";
                                            t2 = @"g";
                                        } else {
                                            if ([labelstar isEqual: @"摩羯"]) {
                                                [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                                [subview setImage:[UIImage imageNamed:@"starpink-35.png"]];
                                                t1 = @"10";
                                                t2 = @"g";
                                            } else {
                                                if ([labelstar isEqual: @"水瓶"]) {
                                                    [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                                    [subview setImage:[UIImage imageNamed:@"starpink-36.png"]];
                                                    t1 = @"11";
                                                    t2 = @"g";
                                                } else {
                                                    if ([labelstar isEqual: @"雙魚"]) {
                                                        [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                                        [subview setImage:[UIImage imageNamed:@"starpink-37.png"]];
                                                        t1 = @"12";
                                                        t2 = @"g";
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
        if ([labelstar isEqual: @"牡羊"]) {
            [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
            [subview setImage:[UIImage imageNamed:@"starblue-32.png"]];
            t1 = @"1";
            t2 = @"b";
        } else {
            if ([labelstar isEqual: @"金牛"]) {
                [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                [subview setImage:[UIImage imageNamed:@"starblue-42.png"]];
                t1 = @"2";
                t2 = @"b";
            } else {
                if ([labelstar isEqual: @"雙子"]) {
                    [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                    [subview setImage:[UIImage imageNamed:@"starblue-43.png"]];
                    t1 = @"3";
                    t2 = @"b";
                } else {
                    if ([labelstar isEqual: @"巨蟹"]) {
                        [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                        [subview setImage:[UIImage imageNamed:@"starblue-33.png"]];
                        t1 = @"4";
                        t2 = @"b";
                    } else {
                        if ([labelstar isEqual: @"獅子"]) {
                            [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                            [subview setImage:[UIImage imageNamed:@"starblue-40.png"]];
                            t1 = @"5";
                            t2 = @"b";
                        } else {
                            if ([labelstar isEqual: @"處女"]) {
                                [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                [subview setImage:[UIImage imageNamed:@"starblue-41.png"]];
                                t1 = @"6";
                                t2 = @"b";
                            } else {
                                if ([labelstar isEqual: @"天秤"]) {
                                    [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                    [subview setImage:[UIImage imageNamed:@"starblue-34.png"]];
                                    t1 = @"7";
                                    t2 = @"b";
                                } else {
                                    if ([labelstar isEqual: @"天蠍"]) {
                                        [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                        [subview setImage:[UIImage imageNamed:@"starblue-38.png"]];
                                        t1 = @"8";
                                        t2 = @"b";
                                    } else {
                                        if ([labelstar isEqual: @"射手"]) {
                                            [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                            [subview setImage:[UIImage imageNamed:@"starblue-39.png"]];
                                            t1 = @"9";
                                            t2 = @"b";
                                        } else {
                                            if ([labelstar isEqual: @"摩羯" ]) {
                                                [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                                [subview setImage:[UIImage imageNamed:@"starblue-35.png"]];
                                                t1 = @"10";
                                                t2 = @"b";
                                            } else {
                                                if ([labelstar isEqual: @"水瓶"]) {
                                                    [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                                    [subview setImage:[UIImage imageNamed:@"starblue-36.png"]];
                                                    t1 = @"11";
                                                    t2 = @"b";
                                                } else {
                                                    if ([labelstar isEqual: @"雙魚"]) {
                                                        [_imageoutcome.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                                        [subview setImage:[UIImage imageNamed:@"starblue-37.png"]];
                                                        t1 = @"12";
                                                        t2 = @"b";
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
    [_imageoutcome addSubview:subview];
    
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //将page2设定成Storyboard Segue的目标UIViewController
    
    id page2 = segue.destinationViewController; // 這樣回前一頁也會送
    //id page2 = check.target;
    
    //将值透过Storyboard Segue带给页面2的string变数
    [page2 setValue:label.text forKey:@"string1"];
    [page2 setValue:label1.text forKey:@"string2"];
    [page2 setValue:t1 forKey:@"string3"];
    [page2 setValue:t2 forKey:@"string4"];
    
}


//設定滾輪總共有幾個欄位
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 2;
}

//設定滾輪總共有幾個項目
- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    if (component==0) {
        return [keys count];
    }else{
        NSString *key = [keys objectAtIndex:[thePickerView selectedRowInComponent:0]]; // 飲料或甜點
        NSArray *array = [data objectForKey:key];
        return [array count];
    }
}

//設定滾輪顯示的文字
- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component==0) {
        return[keys objectAtIndex:row];
    }else{
        NSString *key = [keys objectAtIndex:[thePickerView selectedRowInComponent:0]]; // 飲料或甜點
        NSArray *array = [data objectForKey:key];
        return [array objectAtIndex:row];
    }
}






#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prepareData];
    UIPickerView *picker = [[UIPickerView alloc]initWithFrame:CGRectZero];
    picker.transform = CGAffineTransformMakeTranslation(0, 40);
    picker.delegate = self;
    picker.showsSelectionIndicator = YES;
    [picker selectRow:0 inComponent:0 animated:YES];
    [picker selectRow:0 inComponent:1 animated:YES];
    [self.view addSubview:picker];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    label = nil;
    label1 = nil;
    [self setImageoutcome:nil];
    check = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
