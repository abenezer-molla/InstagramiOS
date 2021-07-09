//
//  DetailsViewController.m
//  InstagramApp
//
//  Created by abenezermolla on 7/9/21.
@import Parse;
#import "DetailsViewController.h"

#import "UIImageView+AFNetworking.h"



@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet PFImageView *detailsImageView;
@property (weak, nonatomic) IBOutlet PFImageView *detailsProfileView;

@property (weak, nonatomic) IBOutlet UILabel *detailsProfileName;

@property (weak, nonatomic) IBOutlet UILabel *detailsLikeCount;

@property (weak, nonatomic) IBOutlet UILabel *detailsUsername;

@property (weak, nonatomic) IBOutlet UILabel *detailsCaption;

@property (weak, nonatomic) IBOutlet UILabel *detailsDateStamp;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.photoImageView.file = post.image;
//    self.profilePictureTimeline.file = post.image;
    
    NSLog(@"Here Comes Aben");
    
    NSLog(@" This is instaDetails%@", self.instaDetails);
    
//
   // PFUser *user = self.postDict.author;
    
    
    self.detailsProfileName.text = self.postDict.author.username;
    
    self.detailsUsername.text = self.postDict.author.username;
    
    self.detailsCaption.text = self.postDict.caption;
    
    self.detailsProfileView.file = self.postDict.image;
    
    self.detailsImageView.file = self.postDict.image;
    
    self.detailsDateStamp.text = [NSDateFormatter localizedStringFromDate:self.postDict.createdAt dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
    
    
    
//    [self.photoImageView loadInBackground];

//    

//    self.profileNameTimeline.text = user.username;
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
