#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "ORClient.h"
@interface ORChatViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UIActionSheetDelegate, UIAlertViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, MFMailComposeViewControllerDelegate, ORClientDelegate> {
    NSDictionary *contact; NSString *historyKey;
    UITableView *table; UIView *inputBar; UITextField *input; UIButton *sendButton; UIButton *cameraButton;
    UIImage *attachedImage; NSString *attachedBase64;   // attachedImage is only the 30 pt camera-button thumbnail
    NSCache *imageCache;               // ts -> UIImage downsampled to its bubble size, for rows near the screen; dropped on memory warnings and in the background
    NSMutableDictionary *imageSizes;   // ts -> NSValue CGSize, so row heights never need the decoded photo
    NSArray *visibleRows;              // [self visible], rebuilt on the next reload
    UIActivityIndicatorView *spinner;
    NSMutableArray *messages;    // dicts: role, content, ts, image?, hidden?, delivered?
    NSMutableString *pending;    // streaming assistant text not yet committed to a bubble
    NSMutableArray *burstQueue;  // paced mode: finished bursts waiting to be shown
    NSTimer *burstTimer; NSTimer *typingTimer; NSInteger typingPhase; BOOL typing; BOOL streamDone;
    ORClient *client;
    CGFloat keyboardHeight;
    NSUInteger replyStartCount;
    NSIndexPath *menuRow;
    NSString *unloadedDraft;           // the input field's text while the view is unloaded
    BOOL reconfigureOnForeground;
}
- (id)initWithContact:(NSDictionary *)contact;
- (void)sendHiddenPrompt:(NSString *)prompt;   // e.g. the daily text trigger
@end
