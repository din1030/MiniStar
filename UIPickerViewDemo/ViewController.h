#import <UIKit/UIKit.h>



@interface ViewController : UIViewController<UIPickerViewDelegate> {
    NSMutableDictionary *data;
    NSArray *keys;
    NSString* t1;
    NSString* t2;
    IBOutlet UILabel *label;
    IBOutlet UILabel *label1;
    
    IBOutlet UIBarButtonItem *check;
}

@property (strong, nonatomic) IBOutlet UIImageView *imageoutcome;



@end
