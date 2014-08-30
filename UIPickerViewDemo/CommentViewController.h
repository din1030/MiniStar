
#import <UIKit/UIKit.h>
#define kPostURL @"http://140.119.19.34/din/tutorialTest.php"
#define kPostURLG @"http://140.119.19.34/din/tutorialTestG.php"

@interface CommentViewController : UIViewController {
    NSURLConnection* postConnection;
}

@property (weak) NSString *string1;
@property (weak) NSString *string2;
@property (weak) NSString *string3;
@property (weak) NSString *string4;

@property (strong, nonatomic) IBOutlet UIImageView *userstaricon;
@property (strong, nonatomic) IBOutlet UILabel *labela;
@property (strong, nonatomic) IBOutlet UILabel *labelb;
@property (strong) NSString *stringstar;
@property (strong) NSString *stringsex;

@property (strong, nonatomic) IBOutlet UILabel *test1;
@property (strong, nonatomic) IBOutlet UILabel *test2;

- (IBAction)sendClick:(id)sender;
- (IBAction)sendClickG:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *nameTF;
@property (strong, nonatomic) IBOutlet UITextField *contentTF;

@property (strong, nonatomic) IBOutlet UITextField *nameTF_G;
@property (strong, nonatomic) IBOutlet UITextField *contentTF_G;

@end