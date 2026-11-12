#import <UIKit/UIKit.h>
@interface ORContactsViewController : UITableViewController {
    NSDateFormatter *timeFormatter, *weekdayFormatter, *dateFormatter;   // built on first use, dropped in the background
    CGPoint scrollOffset, savedOffset; BOOL hasSavedOffset;               // restores the list after its view is unloaded
}
- (void)openContact:(NSDictionary *)contact animated:(BOOL)animated;
@end
