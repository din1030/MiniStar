//
//  scorpionViewController.m
//  ConstellationDemo
//
//  Created by din1030 on 13/1/14.
//  Copyright (c) 2013年 EraSoft. All rights reserved.
//

#import "AppDelegate.h"
#import "scorpoinGirlViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface scorpoinGirlViewController () <FBLoginViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *fbButtonG;
@property (strong, nonatomic) id<FBGraphUser> loggedInUser;
@property (strong, nonatomic) IBOutlet UITextView *contentTextG;

@property (strong, nonatomic) IBOutlet UIButton *authButtonG;
- (IBAction)authButtonG:(UIButton *)sender;

- (IBAction)fbClickG:(UIButton *)sender;


@end

@implementation scorpoinGirlViewController

@synthesize fbButtonG = _fbButtonG;
@synthesize loggedInUser = _loggedInUser;
@synthesize contentTextG = _contentTextG;

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
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(sessionStateChanged:)
     name:FBSessionStateChangedNotification
     object:nil];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate openSessionWithAllowLoginUI:NO];
    
//    if (!FBSession.activeSession.isOpen) {
//        FBLoginView *loginview = [[FBLoginView alloc] init];
//        
//        loginview.frame = CGRectMake(233, 426, 30, 30);
//        for (id obj in loginview.subviews)
//        {
//            if ([obj isKindOfClass:[UIButton class]])
//            {
//                UIButton * loginButton =  obj;
//                UIImage *loginImage = [UIImage imageNamed:@"icon-fb.png"];
//                [loginButton setBackgroundImage:loginImage forState:UIControlStateNormal];
//                [loginButton setBackgroundImage:nil forState:UIControlStateSelected];
//                [loginButton setBackgroundImage:nil forState:UIControlStateHighlighted];
//                [loginButton sizeToFit];
//            }
//            if ([obj isKindOfClass:[UILabel class]])
//            {
//                UILabel * loginLabel =  obj;
//                loginLabel.text = nil;
//                //loginLabel.textAlignment = UITextAlignmentCenter;
//                //loginLabel.frame = CGRectMake(0, 0, 271, 37);
//                loginLabel.frame = CGRectZero;
//            }
//        }
//        
//        loginview.delegate = self;
//        [self.view addSubview:loginview];
//    }
    
}

- (void)viewDidUnload {
    self.fbButtonG = nil;
    self.loggedInUser = nil;
    [super viewDidUnload];
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    
    //loginView.hidden = YES;
    //self.buttonPostStatus.hidden = YES;
    self.fbButtonG.enabled = YES;
    // [self fbButtonClick:_buttonPostStatus];
    
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user {
    self.loggedInUser = user;
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    BOOL canShareAnyhow = [FBNativeDialogs canPresentShareDialogWithSession:nil];
    self.fbButtonG.enabled = canShareAnyhow;
    //loginView.hidden = YES;
    self.loggedInUser = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

// Convenience method to perform some action that requires the "publish_actions" permissions.
- (void) performPublishAction:(void (^)(void)) action {
    // we defer request for permission to post to the moment of post, then we check for the permission
    if ([FBSession.activeSession.permissions indexOfObject:@"publish_actions"] == NSNotFound) {
        // if we don't already have the permission, then we request it now
        [FBSession.activeSession reauthorizeWithPublishPermissions:[NSArray arrayWithObject:@"publish_actions"]
                                                   defaultAudience:FBSessionDefaultAudienceFriends
                                                 completionHandler:^(FBSession *session, NSError *error) {
                                                     if (!error) {
                                                         action();
                                                     }
                                                     //For this example, ignore errors (such as if user cancels).
                                                 }];
    } else {
        action();
    }
    
}



- (IBAction)fbClickG:(UIButton *)sender {
    // Post a status update to the user's feed via the Graph API, and display an alert view
    // with the results or an error.
    NSString *name = self.loggedInUser.first_name;
    NSString *message = [NSString stringWithFormat:@"你已經掌握了蠍女小星機：\r\n%@", //name != nil ? name : @"me" , 
                         self.contentTextG.text]; //送出的訊息
    
    // if it is available to us, we will post using the native dialog
    //    BOOL displayedNativeDialog = [FBNativeDialogs presentShareDialogModallyFrom:self
    //                                                                    initialText:nil
    //                                                                          image:nil
    //                                                                            url:nil
    //                                                                        handler:nil];
    if (FBSession.activeSession.isOpen) { // condition change from "name != nil"
        
        [self performPublishAction:^{
            // otherwise fall back on a request for permissions and a direct post
            [FBRequestConnection startForPostStatusUpdate:message
                                        completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                                            
                                            [self showAlert:message result:result error:error]; //跳出alert
                                            self.fbButtonG.enabled = YES;
                                        }];
            
            self.fbButtonG.enabled = NO;
        }];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"哇嗚～"
                              //上面是標題的設定
                                                        message:@"要先登入才能分享小星機唷！"  //警告訊息內文的設定
                                                       delegate:self // 叫出AlertView之後，要給該ViewController去處理
                              
                                              cancelButtonTitle:@"OK"  //cancel按鈕文字的設定
                                              otherButtonTitles: nil]; // 其他按鈕的設定
        // 如果要多個其他按鈕 >> otherButtonTitles: @"check1", @"check2", nil];
        
        [alert show];  // 把alert這個物件秀出來
        //        [alert release]; //釋放alert這個物件
    }
    
}

// UIAlertView helper for post buttons
- (void)showAlert:(NSString *)message
           result:(id)result
            error:(NSError *)error {
    
    NSString *alertMsg;
    NSString *alertTitle;
    if (error) {
        alertMsg = [NSString stringWithFormat:@"出錯了 QQ error:%@", error.localizedDescription ];
        alertTitle = @"哇～";
    } else {
        //NSDictionary *resultDict = (NSDictionary *)result;
        alertMsg = @"蠍女小星機已分享到你的塗鴉牆囉！";
        //[NSString stringWithFormat:@"%@，蠍女小星機已分享到你的塗鴉牆囉！",self.loggedInUser.first_name];
        alertTitle = @"恭喜！";
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertTitle
                                                        message:alertMsg
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

- (IBAction)authButtonG:(UIButton *)sender
{
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    // If the user is authenticated, log out when the button is clicked.
    // If the user is not authenticated, log in when the button is clicked.
    if (FBSession.activeSession.isOpen) {
        [appDelegate closeSession];
    } else {
        // The user has initiated a login, so call the openSession method
        // and show the login UX if necessary.
        [appDelegate openSessionWithAllowLoginUI:YES];
    }
}

- (void)sessionStateChanged:(NSNotification*)notification {
    if (FBSession.activeSession.isOpen) {
        [self.authButtonG setTitle:@"Logout" forState:UIControlStateNormal];
    } else {
        [self.authButtonG setTitle:@"Login" forState:UIControlStateNormal];
        //[self.authButtonG setBackgroundImage:[UIImage imageNamed:@"f_logo.png"]];
    }
}

@end
