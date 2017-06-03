//
//  OBANPSRow.h
//  org.onebusaway.iphone
//
//  Created by Aaron Brethorst on 6/1/17.
//  Copyright © 2017 OneBusAway. All rights reserved.
//

@import UIKit;
#import "OBABaseRow.h"

NS_ASSUME_NONNULL_BEGIN

@interface OBANPSRow : OBABaseRow
@property(nonatomic,copy) void (^dismissRowBlock)(OBANPSRow *row);
@end

NS_ASSUME_NONNULL_END
