//
//  scorpionViewController.m
//  ConstellationDemo
//
//  Created by din1030 on 13/1/14.
//  Copyright (c) 2013年 EraSoft. All rights reserved.
//

#import "AppDelegate.h"
#import "scorpionViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface scorpionViewController () <FBLoginViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *fbButton;
@property (strong, nonatomic) id<FBGraphUser> loggedInUser;
@property (strong, nonatomic) IBOutlet UITextView *contentText;

@property (strong, nonatomic) IBOutlet UIButton *authButton;
- (IBAction)authButton:(UIButton *)sender;

- (IBAction)fbClick:(UIButton *)sender;


@end

@implementation scorpionViewController

@synthesize fbButton = _fbButton;
@synthesize loggedInUser = _loggedInUser;
@synthesize contentText = _contentText;

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
    
    if (FBSession.activeSession.isOpen) { // 抓使用者資訊
        
    }
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(sessionStateChanged:)
     name:FBSessionStateChangedNotification
     object:nil];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate openSessionWithAllowLoginUI:NO];
    
//    if (!FBSession.activeSession.isOpen) {
//        FBLoginView *loginview = [[FBLoginView alloc] initWithPublishPermissions:
//                                  [NSArray arrayWithObject:@"publish_actions"] defaultAudience:20];
//        
//        loginview.frame = CGRectMake(233, 430, 30, 30);
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
//        loginview.hidden = YES;
//    }
}

- (void)viewDidUnload {
    self.fbButton = nil;
    self.loggedInUser = nil;
    [super viewDidUnload];
}

//- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
//    
//    //loginView.hidden = YES;
//    //self.buttonPostStatus.hidden = YES;
//    self.fbButton.enabled = YES;
//    // [self fbButtonClick:_buttonPostStatus];
//    
//}
//
- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user {
    self.loggedInUser = user;
}
//
//- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
//    BOOL canShareAnyhow = [FBNativeDialogs canPresentShareDialogWithSession:nil];
//    self.fbButton.enabled = canShareAnyhow;
//    //loginView.hidden = YES;
//    self.loggedInUser = nil;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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



- (IBAction)fbClick:(UIButton *)sender {
    // Post a status update to the user's feed via the Graph API, and display an alert view
    // with the results or an error.
    NSString *name = self.loggedInUser.name;
    NSString *message = [NSString stringWithFormat:@"你已經掌握了蠍男小星機：\r\n%@", //name != nil ? name : @"me"
                           self.contentText.text]; //送出的訊息
    
    // if it is available to us, we will post using the native dialog
    //    BOOL displayedNativeDialog = [FBNativeDialogs presentShareDialogModallyFrom:self
    //                                                                    initialText:@"HI!"
    //                                                                          image:nil
    //                                                                            url:[NSURL URLWithString:@""]
    //                                                                        handler:nil];
    if (FBSession.activeSession.isOpen) { //name!=nil , FBSession.activeSession.isOpen
        NSMutableDictionary* params = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                       [NSString stringWithFormat:@"%@骨子裡其實是個%@", name,
                                        @"法國人"],@"message",@"法國人",@"name", @" " ,@"caption",
                                       @"Hi～～～",@"description",
                                       @"https://www.parse.com/docs/cloud_code_guide", @"link",
                                       @"http://big5.gmw.cn/images/2009-07/30/xin_1207063003540622341025.jpg", @"picture",
                                       nil];
        
        [self performPublishAction:^{
            // otherwise fall back on a request for permissions and a direct post
            [FBRequestConnection startWithGraphPath:@"me/feed"
                                        parameters:params HTTPMethod:@"POST"
                                        completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                                            
                                            [self showAlert:message result:result error:error]; //跳出alert
                                            self.fbButton.enabled = YES;
                                        }];
            
            self.fbButton.enabled = NO;
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
        alertMsg = @"蠍男小星機已分享到你的塗鴉牆囉！";
        //[NSString stringWithFormat:@"%@，蠍男小星機已分享到你的塗鴉牆囉！",self.loggedInUser.first_name];
        alertTitle = @"恭喜！";
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertTitle
                                                        message:alertMsg
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

- (IBAction)authButton:(UIButton *)sender
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
        [self.authButton setTitle:@"Logout" forState:UIControlStateNormal];
    } else {
        [self.authButton setTitle:@"Login" forState:UIControlStateNormal];
    }
}

@end
