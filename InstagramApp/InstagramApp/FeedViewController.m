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

#import "LoginViewController.h"

@interface FeedViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *chats;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
//
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refreshData) userInfo:nil repeats:true];
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

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    FeedCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"FeedCell"];
    cell.feedCaptionLabel.text = self.chats[indexPath.row][@"text"];
//    if(self.chats[indexPath.row][@"user"] != nil){
//        cell.userText.text = self.chats[indexPath.row][@"user"][@"username"];
//    }else{
//        cell.userText.text = @"Anon";
//    }
    
    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
    
}

//- (void)refreshData{
//    // construct query
//    PFQuery *query = [PFQuery queryWithClassName:@"InstagramiOS"];
//    [query includeKey:@"user"];
//    query.limit = 20;
//    [query orderByDescending:@"createdAt"];
//    // fetch data asynchronously
//    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
//        if (posts != nil) {
//            // do something with the array of object returned by the call
//            self.chats = posts;
//            [self.tableView reloadData];
//        } else {
//            NSLog(@"%@", error.localizedDescription);
//        }
//    }];
//}



@end
