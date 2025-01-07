//
//  InAppBackgroundView.m
//  BridgewellDemoObjectiveC
//
//

#import "InAppBackgroundView.h"
#import <UIKit/UIKit.h>

@interface UIView (Inspectable)

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

@end

@implementation UIView (Inspectable)

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.clipsToBounds = YES;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

@end

@implementation InAppBackgroundView

@synthesize contentView = _contentView;

- (instancetype)initWithFrame:(CGRect)frame xibName:(NSString *)xibName {
    self = [super initWithFrame:frame];
    if (self) {
        self.xibName = xibName;
        [self xibSetup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self xibSetup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self xibSetup];
    }
    return self;
}

- (void)xibSetup {
    self.backgroundColor = [UIColor clearColor];
    _contentView = [self loadViewFromNib];
    _contentView.frame = self.bounds;
    [self addSubview:_contentView];
    _contentView.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[
        [_contentView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [_contentView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
        [_contentView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [_contentView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor]
    ]];

    self.translatesAutoresizingMaskIntoConstraints = NO;
}

- (UIView *)loadViewFromNib {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *name = self.xibName != nil ? self.xibName : NSStringFromClass([self class]);
    return [[bundle loadNibNamed:name owner:self options:nil] firstObject];
}

@end
