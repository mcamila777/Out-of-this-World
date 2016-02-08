//
//  OWSpaceDataViewController.m
//  Out of this World
//
//  Created by Maria Camila on 4/02/16.
//  Copyright © 2016 mindz. All rights reserved.
//

#import "OWSpaceDataViewController.h"

@interface OWSpaceDataViewController ()

@end

@implementation OWSpaceDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor =[UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSourse
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString static *CellIdentifier = @"DataCell";
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Nickame:";
            cell.detailTextLabel.text = _spaceObjetc.nickname;
            break;
        case 1:
            cell.textLabel.text = @"Diameter (km):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.02f", _spaceObjetc.diameter];
           break;
        case 2:
            cell.textLabel.text = @"Gravitational Force:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.02f", _spaceObjetc.gravitationalForce];
            break;
        case 3:
            cell.textLabel.text = @"Length of a year (days):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.02f", _spaceObjetc.yearLength];
            break;
        case 4:
            cell.textLabel.text = @"Length of a day (hours):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.02f", _spaceObjetc.dayLength];
            break;
        case 5:
            cell.textLabel.text = @"Temperature (celsius):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.02f", _spaceObjetc.temperature];
            break;
        case 6:
            cell.textLabel.text = @"Number of moons:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", _spaceObjetc.numberOfMoons];
            break;
        case 7:
            cell.textLabel.text = @"Interesting fact:";
            cell.detailTextLabel.text = _spaceObjetc.interestFact;
            break;
        default:
            break;
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
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
