/**
 * Copyright (C) 2009-2016 bdferris <bdferris@onebusaway.org>, University of Washington
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <OBAKit/OBAKit.h>
#import "OBAModalActivityIndicator.h"
#import "OBATextEditViewController.h"
#import "OBAListSelectionViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OBAReportProblemWithTripViewController : UITableViewController <UITextFieldDelegate, OBATextEditViewControllerDelegate, OBAListSelectionViewControllerDelegate> {
    OBATripInstanceRef *_tripInstance;
    OBATripV2 *_trip;
    NSMutableArray *_problemIds;
    NSMutableArray *_problemNames;
    NSUInteger _problemIndex;
    NSString *_comment;
    BOOL _onVehicle;
    NSString *_vehicleNumber;
    NSString *_vehicleType;

    OBAModalActivityIndicator *_activityIndicatorView;
}

- (id)initWithTripInstance:(OBATripInstanceRef *)tripInstance trip:(OBATripV2 *)trip;

@property (nonatomic, strong) NSString *currentStopId;

@end

NS_ASSUME_NONNULL_END
