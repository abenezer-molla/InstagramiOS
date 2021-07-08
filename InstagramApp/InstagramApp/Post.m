//
//  Post.m
//  InstagramApp
//
//  Created by abenezermolla on 7/7/21.
//

#import "Post.h"
#import "Parse/Parse.h"

@implementation Post

    
@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic caption;
@dynamic image;
@dynamic likeCount;
@dynamic commentCount;

+ (nonnull NSString *)parseClassName {
    return @"Post";
}

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion {
    
    Post *newPost = [Post new];
    newPost.image = [self getPFFileFromImage:image];
    newPost.author = [PFUser currentUser];
    newPost.caption = caption;
    newPost.likeCount = @(0);
    newPost.commentCount = @(0);
    
    [newPost saveInBackgroundWithBlock: completion];

}

//
//- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
//    self = [super init];
//    if (self) {
//
//        // Is this a re-tweet?
//        NSDictionary *originalTweet = dictionary[@"retweeted_status"];
//        if(originalTweet != nil){
//            NSDictionary *userDictionary = dictionary[@"user"];
//            self.retweetedByUser = [[User alloc] initWithDictionary:userDictionary];
//
//            // Change tweet to original tweet
//            dictionary = originalTweet;
//        }
//        self.idStr = dictionary[@"id_str"];
//        self.text = dictionary[@"full_text"];
//        self.favoriteCount = [dictionary[@"favorite_count"] intValue];
//        self.favorited = [dictionary[@"favorited"] boolValue];
//        self.retweetCount = [dictionary[@"retweet_count"] intValue];
//        self.retweeted = [dictionary[@"retweeted"] boolValue];
//
//        // TODO: initialize user
//
//        NSDictionary *user = dictionary[@"user"];
//        self.user = [[User alloc] initWithDictionary:user];
//
//        // TODO: Format and set createdAtString
//
//        // Format createdAt date string
//        NSString *createdAtOriginalString = dictionary[@"created_at"];
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        // Configure the input format to parse the date string
//        formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
//        // Convert String to Date
//        NSDate *date = [formatter dateFromString:createdAtOriginalString];
//        // Configure output format
//        formatter.dateStyle = NSDateFormatterShortStyle;
//        formatter.timeStyle = NSDateFormatterNoStyle;
//        // Convert Date to String
//        self.createdAtString = [formatter stringFromDate:date];
//        self.originalDate =dictionary[@"created_at"];
//    }
//    return self;
//}





// resize image to less than 10MB before saving to Parse!



+ (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)newImage {
 
    // check if image is not nil
    if (!newImage) {
        return nil;
    }
    
    NSData *imageData = UIImagePNGRepresentation(newImage);
    // get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    
    return [PFFileObject fileObjectWithName:(@"image.png") data:imageData];
}


@end
