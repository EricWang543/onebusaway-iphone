//
//  OBANPSRow.m
//  org.onebusaway.iphone
//
//  Created by Aaron Brethorst on 6/1/17.
//  Copyright © 2017 OneBusAway. All rights reserved.
//

#import "OBANPSRow.h"
#import "OBAViewModelRegistry.h"
#import "OBANPSCell.h"

@implementation OBANPSRow

- (id)copyWithZone:(NSZone *)zone {
    OBANPSRow *newRow = [super copyWithZone:zone];

    return newRow;
}

+ (void)load {
    [OBAViewModelRegistry registerClass:self.class];
}

+ (void)registerViewsWithTableView:(UITableView *)tableView {
    [tableView registerClass:[OBANPSCell class] forCellReuseIdentifier:[self cellReuseIdentifier]];
}

- (NSString*)cellReuseIdentifier {
    return NSStringFromClass(self.class);
}

@end
