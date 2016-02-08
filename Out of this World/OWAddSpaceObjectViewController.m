//
//  OWAddSpaceObjectViewController.m
//  Out of this World
//
//  Created by Maria Camila on 7/02/16.
//  Copyright © 2016 mindz. All rights reserved.
//

#import "OWAddSpaceObjectViewController.h"

@interface OWAddSpaceObjectViewController ()

@end

@implementation OWAddSpaceObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *orionImage = [UIImage imageNamed:@"Orion.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:orionImage];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelButton:(UIButton *)sender {
    
    [self.delegate didCancel];
}

- (IBAction)addButton:(UIButton *)sender {
    
    OWSpaceObject *newSpaceObject = [self returnNewSpaceObject];
    [self.delegate addSpaceObject:newSpaceObject];
}


-(OWSpaceObject *)returnNewSpaceObject{
    
    OWSpaceObject *addedSpaceObject = [[OWSpaceObject alloc] init];
    addedSpaceObject.name = _nameTextField.text;
    addedSpaceObject.nickname = _nicknameTextField.text;
    addedSpaceObject.diameter = [_diameterTextField.text floatValue];
    addedSpaceObject.temperature = [_temperatureTextField.text floatValue];
    addedSpaceObject.numberOfMoons = [_numberOfMoonsTextField.text intValue];
    addedSpaceObject.interestFact = _interestingFactTextField.text;
    addedSpaceObject.spaceImage = [UIImage imageNamed:@"EinsteinRing.jpg"];
    
    return addedSpaceObject;
        
}
@end
