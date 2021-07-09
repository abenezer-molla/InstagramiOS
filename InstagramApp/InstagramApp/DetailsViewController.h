//
//  DetailsViewController.h
//  InstagramApp
//
//  Created by abenezermolla on 7/9/21.
//

#import <UIKit/UIKit.h>

#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property(strong, nonatomic) NSDictionary * instaDetails;

@property (nonatomic, strong) Post *postDict;

@end

NS_ASSUME_NONNULL_END
