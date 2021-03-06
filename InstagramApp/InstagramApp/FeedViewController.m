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

#import "AppDelegate.h"

#import "Post.h"

#import "LoginViewController.h"

#import "UIImageView+AFNetworking.h"

#import "DetailsViewController.h"


@interface FeedViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(copy, readonly) NSURLRequest *request;
@property (strong, nonatomic) NSArray *feeds;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.refreshControl = [[UIRefreshControl alloc] init];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    [self.refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];

//
    
    [self refreshData];
   //[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refreshData) userInfo:nil repeats:true];
    // Do any additional setup after loading the view.
}

- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    
    [self refreshData];


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
    
    NSLog(@"ICON");
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"detailsSegue"]) {
        
        UITableViewCell *tappedCell = sender;
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:tappedCell];
        Post *insta = self.feeds[indexPath.row];
        
        DetailsViewController *detailsViewController = [segue destinationViewController];
        
        
        detailsViewController.postDict = insta;
    }

    
    
    
    
    
    
    
    
    NSLog(@"Tapping on Insta");
    

    
}



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
    [self.tableView reloadData];
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            // do something with the data fetched
                        self.feeds = posts;
                        [self.tableView reloadData];
                        [self.refreshControl endRefreshing];
        }
        else {
            // handle error
            
                        NSLog(@"%@", error.localizedDescription);
        }
    }];
    [self.tableView reloadData];

}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    FeedCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"FeedCell"];
    //cell.feedCaptionLabel.text = self.feeds[indexPath.row][@"caption"];
 
    Post *post = self.feeds[indexPath.row];
    //NSLog(@"%@", post);
    [cell setPost:post];
   // [self.tableView reloadData];
    
    
    
    
    
    
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
