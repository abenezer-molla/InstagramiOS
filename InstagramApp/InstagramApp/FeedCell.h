//
//  FeedCell.h
//  InstagramApp
//
//  Created by abenezermolla on 7/6/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FeedCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *feedImageView;
@property (weak, nonatomic) IBOutlet UILabel *feedCaptionLabel;

@end

NS_ASSUME_NONNULL_END
