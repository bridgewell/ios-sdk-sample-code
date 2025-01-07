//
//  InAppBackgroundView.h
//  BridgewellDemoObjectiveC
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InAppBackgroundView : UIView

@property (nonatomic, strong, readonly) UIView *contentView;
@property (nonatomic, strong) NSString *xibName;

- (instancetype)initWithFrame:(CGRect)frame xibName:(NSString *)xibName;

@end

NS_ASSUME_NONNULL_END
