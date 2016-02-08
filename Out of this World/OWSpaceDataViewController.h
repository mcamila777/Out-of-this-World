//
//  OWSpaceDataViewController.h
//  Out of this World
//
//  Created by Maria Camila on 4/02/16.
//  Copyright © 2016 mindz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWSpaceObject.h"

@interface OWSpaceDataViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property OWSpaceObject *spaceObjetc;
@end
