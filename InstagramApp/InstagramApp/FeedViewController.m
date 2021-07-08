//
//  FeedViewController.m
//  InstagramApp
//
//  Created by abenezermolla on 7/6/21.
//

#import "FeedViewController.h"

#import "SceneDelegate.h"

#import "Parse/Parse.h"

#import "FeedCell.h"

#import "Post.h"

#import "LoginViewController.h"

@interface FeedViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *feeds;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
//
    
    [self refreshData];
   //[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refreshData) userInfo:nil repeats:true];
    // Do any additional setup after loading the view.
}



- (IBAction)didTapLogout:(id)sender {
    
    
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
    }];
//    [self dismissViewControllerAnimated:YES completion:nil];
        SceneDelegate *myDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;
        // Logging out and swtiching to login view controller
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        myDelegate.window.rootViewController = loginViewController;
    
    
}



- (IBAction)didTapIcon:(id)sender {
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)refreshData{
    
    Post *newPost = [Post new];

    // get the current user and assign it to "author" field. "author" field is now of Pointer type
    newPost.author = [PFUser currentUser];
        
    // construct query
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = 20;

    // fetch data asynchronously
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            // do something with the data fetched
                        self.feeds = posts;
                        [self.tableView reloadData];
        }
        else {
            // handle error
            
                        NSLog(@"%@", error.localizedDescription);
        }
    }];
//
//    // construct query
//    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
//    [query includeKey:@"username"];
//    //[query whereKey:@"likesCount" greaterThanOrEqualTo:@0];
//    query.limit = 20;
//    [query orderByDescending:@"createdAt"];
//
//    // fetch data asynchronously
//    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
//        if (posts != nil) {
//

//            // do something with the array of object returned by the call
//        } else {

//        }
//    }];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    FeedCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"FeedCell"];
    //cell.feedCaptionLabel.text = self.feeds[indexPath.row][@"caption"];
 
    Post *post = self.feeds[indexPath.row];
    NSLog(@"%@", post);
    [cell setPost:post];
    
    
    
    
    
   // cell.feedCaptionLabel.text = self.feeds[self.feeds[indexPath.row][@"caption"]];

    
    
    
    //cell.feedImageView.image = 
    //cell.photoImageView.file = self.feeds[indexPath.row][@"image"];


    
    return cell;

    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.feeds.count;
    
    //return self.feeds.count;
}








@end
