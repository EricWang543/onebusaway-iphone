//
//  OBANPSCell.m
//  org.onebusaway.iphone
//
//  Created by Aaron Brethorst on 6/1/17.
//  Copyright © 2017 OneBusAway. All rights reserved.
//

#import "OBANPSCell.h"
#import "OBANPSRow.h"

@implementation OBANPSCell
@synthesize tableRow = _tableRow;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

@end
