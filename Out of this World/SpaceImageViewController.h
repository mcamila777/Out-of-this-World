//
//  SpaceImageViewController.h
//  Out of this World
//
//  Created by Maria Camila on 29/01/16.
//  Copyright © 2016 mindz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWSpaceObject.h"

// <protocol>, if it's made in the .h is public, while on the .m is private

@interface SpaceImageViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) OWSpaceObject *spaceObject;


@end
