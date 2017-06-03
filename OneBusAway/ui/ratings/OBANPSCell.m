//
//  OBANPSCell.m
//  org.onebusaway.iphone
//
//  Created by Aaron Brethorst on 6/1/17.
//  Copyright © 2017 OneBusAway. All rights reserved.
//

#import "OBANPSCell.h"
#import "OBANPSRow.h"
@import Masonry;
@import OBAKit;

@implementation OBANPSCell
@synthesize tableRow = _tableRow;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = OBATheme.calloutBackgroundColor;

        UIImageView *imageView = [self.class buildImageView];
        UILabel *label = [self.class buildLabel];
        UIStackView *buttonStack = [self.class buildButtonStack];

        UIStackView *rightStack = [[UIStackView alloc] initWithArrangedSubviews:@[label, buttonStack]];
        rightStack.axis = UILayoutConstraintAxisVertical;
        rightStack.spacing = OBATheme.defaultPadding;

        UIStackView *outerStack = [[UIStackView alloc] initWithArrangedSubviews:@[imageView, rightStack]];
        outerStack.axis = UILayoutConstraintAxisHorizontal;
        outerStack.alignment = UIStackViewAlignmentTop;
        outerStack.spacing = OBATheme.defaultPadding;
        [self.contentView addSubview:outerStack];

        [outerStack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(OBATheme.defaultEdgeInsets);
        }];
    }
    return self;
}

+ (UIImageView*)buildImageView {
    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    NSString *icon = [[infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = OBATheme.defaultCornerRadius;

    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@60).priorityMedium();
    }];

    return imageView;
}

+ (UILabel*)buildLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.numberOfLines = 0;
    label.text = @"How do you feel about OneBusAway? Will you give us some feedback?"; //I18N

    return label;
}

+ (UIStackView*)buildButtonStack {
    UIButton *notNowButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [notNowButton setTitle:@"Not Now" forState:UIControlStateNormal]; //I18N

    UIButton *giveFeedbackButton = [OBAUIBuilder borderedButtonWithTitle:@"Give Feedback"]; // I18N

    UIStackView *stack = [[UIStackView alloc] initWithArrangedSubviews:@[notNowButton, giveFeedbackButton]];
    stack.axis = UILayoutConstraintAxisHorizontal;
    stack.spacing = OBATheme.defaultPadding;

    return stack;
}

@end
