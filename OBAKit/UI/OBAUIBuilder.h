//
//  OBAUIBuilder.h
//  org.onebusaway.iphone
//
//  Created by Aaron Brethorst on 3/12/16.
//  Copyright © 2016 OneBusAway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OBATableFooterLabelView.h"

@interface OBAUIBuilder : NSObject
+ (UILabel*)label;
+ (OBATableFooterLabelView*)footerLabelWithText:(NSString*)text tableView:(UITableView*)tableView;
@end
