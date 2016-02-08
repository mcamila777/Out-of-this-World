//
//  OWAddSpaceObjectViewController.h
//  Out of this World
//
//  Created by Maria Camila on 7/02/16.
//  Copyright © 2016 mindz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWSpaceObject.h"

// Create a protocol
@protocol OWAddSpaceObjectViewControllerDelegate <NSObject>

//Is requiered to implemet both methos, else the app while crash
@required //@optional
-(void)addSpaceObject:(OWSpaceObject *)spaceObject;
-(void)didCancel;

@end

@interface OWAddSpaceObjectViewController : UIViewController


//Delegates has to be weak
@property (weak, nonatomic) id <OWAddSpaceObjectViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *diameterTextField;
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberOfMoonsTextField;
@property (strong, nonatomic) IBOutlet UITextField *interestingFactTextField;
- (IBAction)cancelButton:(UIButton *)sender;
- (IBAction)addButton:(UIButton *)sender;


@end
