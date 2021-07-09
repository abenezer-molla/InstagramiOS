//
//  ProfileViewController.m
//  InstagramApp
//
//  Created by abenezermolla on 7/9/21.
//


@import Parse;
#import "ProfileViewController.h"

#import "FeedCell.h"

#import "FeedViewController.h"

#import "SceneDelegate.h"

#import "Parse/Parse.h"

#import "FeedCell.h"

#import "AppDelegate.h"

#import "Post.h"

#import "LoginViewController.h"

#import "UIImageView+AFNetworking.h"

#import "DetailsViewController.h"


@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet PFImageView *profilePageImage;
@property (weak, nonatomic) IBOutlet UILabel *ProfilePageUsername;

@property (strong, nonatomic) NSArray *feedDetail;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self refreshData2];
    
    

    // Do any additional setup after loading the view.
}



- (void)refreshData2{
    
    Post *newPost2 = [Post new];

    // get the current user and assign it to "author" field. "author" field is now of Pointer type
    newPost2.author = [PFUser currentUser];
        
    // construct query
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    
    [postQuery includeKey:@"objectId"];
    postQuery.limit = 20;

    // fetch data asynchronously
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            // do something with the data fetched
            self.feedDetail = posts;
            [self setSomePost];
            
           // [self.tableView insertSubview:self.refreshControl atIndex:0];
            NSLog(@" Self Detail is this -->%@", self.feedDetail);
            
        }
        else {
            // handle error
            
                        NSLog(@"%@", error.localizedDescription);
        }
    }];
    

    



}

- (void) setSomePost{
    
    Post *post = self.feedDetail.firstObject;

    self.ProfilePageUsername.text = post.author.username;
    self.profilePageImage.file = post.image;
    
    
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
