//
//  SpaceImageViewController.m
//  Out of this World
//
//  Created by Maria Camila on 29/01/16.
//  Copyright © 2016 mindz. All rights reserved.
//

#import "SpaceImageViewController.h"

@interface SpaceImageViewController ()

@end

//This class controls the second ViewController, which contains the scroll view... to navigate between the ViewControllers was used a Navigation Controller (Editor -> Embedde in -> )
//To navigate to a new page, on the storyboard select the top of the tableView, add a title (if want), and select the element that you want to transfer to the other view (the cell in this case), and pressing the Crt key drag to the other view, and select push segue

@implementation SpaceImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Assing a image to the property
//    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Jupiter.jpg"]];
    
    _imageView = [[UIImageView alloc] initWithImage:_spaceObject.spaceImage];

    
    //set the contentSize of the _scrollView and its image
    _scrollView.contentSize = _imageView.frame.size;
    [_scrollView addSubview:_imageView];
    
    //For zooming
    
    //register this viewController to be able to listen the events on the UIscrollView, for example for zooming, this allows the UIScrollViewDelegate to call the viewForZoomingInScrollView which is here.
    _scrollView.delegate = self;
    //Add the zoom's range
    _scrollView.maximumZoomScale = 5.0;
    _scrollView.minimumZoomScale = 0.1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//UIScrollViewDelegate allow respond to messages frome te UIscrollView and operations like zooming, scrolled content/animations... for example, the zooming method:

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
