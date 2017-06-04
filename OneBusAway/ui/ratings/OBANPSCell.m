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
        UIStackView *buttonStack = [self buildButtonStack];

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

- (UIStackView*)buildButtonStack {
    UIButton *notNowButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [notNowButton setTitle:@"Not Now" forState:UIControlStateNormal]; //I18N
    [notNowButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];

    // I18N
    BorderedButton *giveFeedbackButton = [[BorderedButton alloc] initWithBorderColor:OBATheme.OBAGreen title:@"Give Feedback"];
    [giveFeedbackButton addTarget:self action:@selector(giveFeedback) forControlEvents:UIControlEventTouchUpInside];
    giveFeedbackButton.titleLabel.font = notNowButton.titleLabel.font;
    [giveFeedbackButton setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];

    UIView *spacerView = [UIView new];
    [spacerView setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];

    UIStackView *stack = [[UIStackView alloc] initWithArrangedSubviews:@[spacerView, notNowButton, giveFeedbackButton]];
    stack.axis = UILayoutConstraintAxisHorizontal;
    stack.spacing = OBATheme.defaultPadding;


    return stack;
}

#pragma mark - Actions

- (void)dismiss {
    if (self.NPSRow.dismissRowBlock) {
        self.NPSRow.dismissRowBlock(self.NPSRow);
    }
}

- (void)giveFeedback {
    if (self.NPSRow.action) {
        self.NPSRow.action(self.NPSRow);
    }
}

#pragma mark - Table Data

- (OBANPSRow*)NPSRow {
    return (OBANPSRow*)self.tableRow;
}

@end
