//
//  OuterSpaceTableViewController.m
//  Out of this World
//
//  Created by Maria Camila on 28/01/16.
//  Copyright © 2016 mindz. All rights reserved.
//

#import "OuterSpaceTableViewController.h"
#import "AstronomicalData.h"
#import "OWSpaceObject.h"
#import "SpaceImageViewController.h"
#import "OWSpaceDataViewController.h"

@interface OuterSpaceTableViewController ()

@end

@implementation OuterSpaceTableViewController

#pragma mark - Lazy Instantiation of properties

//si aún no existe el arreglo, este es alocado en memoria e inicializado
-(NSMutableArray *)planets{
    if (!_planets) {
        _planets = [[NSMutableArray alloc] init];
    }
    return _planets;
}

-(NSMutableArray *)addedSpaceObjects{
    if (!_addedSpaceObjects) {
        _addedSpaceObjects = [[NSMutableArray alloc] init];
    }
    return _addedSpaceObjects;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//-------------------------------------------------------------------------------------------------

    //Create the _planets array, which will content the OWSpaceObject objects, one object for each planet
    
    //_planets = [[NSMutableArray alloc] init];
    
    //The method [AstronomicalData allKnownPlanets] returns an array of dictionaries, with the information of each planet on each dictionary
    //the for loop "recorre" all the array passing through each planet dictionary
    
    for (NSDictionary *planetData in [AstronomicalData allKnownPlanets]) {
        // The image name is the only information that is not on the dictionary
        NSString *imageName =[ NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        
//No entiendo: en que punto se invoca el init de OWSpaceObject que envia nill al initWithData-----------------------------------------------------------------
        
        // Create an object named planet (type:OWSpaceObject) which has all properties needed to store the information that comes from the dictionary
        // The initWithData method is in charge of assign the dictionary/image information to the OWSpaceObject preperties
        
        OWSpaceObject *planet = [[OWSpaceObject alloc] initWithData:planetData andImage:[UIImage imageNamed:imageName]];
        
        //add this planet to the planets array
        [self.planets addObject:planet];
    }
    
    
    
    
//    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
//    NSString *firtsColor =@"red";
//    [myDictionary setObject:firtsColor forKey:@"firetruck color"];
//    [myDictionary setObject:@"blue" forKey:@"ocean color"];
//    [myDictionary setObject:@"yellow" forKey:@"star color"];
//    
//    NSLog(@"%@", myDictionary);
//    
//    NSString *blueString =[myDictionary objectForKey:@"ocean color"];
//    NSLog(@"%@", blueString);
    
//    NSNumber *myNumber =[NSNumber numberWithInt:5];
//    NSLog(@"%@", myNumber);
//    
//    NSArray *myArray = [NSArray arrayWithObjects: @"a", @"fo", nil];
//    NSLog(@"%@", myArray);
    
//    NSDictionary *myDictionary = @{@"Mindz" : @"juan"} ;
//    NSMutableArray *arrayTest = [@[] mutableCopy]; //Se genera un arreglo mutable vacío

    

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([sender isKindOfClass:[UITableViewCell class]]){
        
        if ([segue.destinationViewController isKindOfClass:[SpaceImageViewController class]]) {
            
            SpaceImageViewController *nextViewController = segue.destinationViewController;
            //get the current IndexPath
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            OWSpaceObject *selectedObject ;
            
            if (path.section==0) {
                selectedObject =_planets[path.row];
            }else if (path.section ==1){
                selectedObject = _addedSpaceObjects[path.row];
            }
//            nextViewController.imageView.image = selectedObject.spaceImage; //Doesnt works
            nextViewController.spaceObject = selectedObject;
            
            
        }
    }
    
    if ([sender isKindOfClass:[NSIndexPath class]]) {
        
        if ([segue.destinationViewController isKindOfClass:[OWSpaceDataViewController class]]) {
            OWSpaceDataViewController *targetViewController = segue.destinationViewController;
            NSIndexPath *path = sender;
            OWSpaceObject *selectedObject ;
            
            if (path.section==0) {
                selectedObject =_planets[path.row];
            }else if (path.section ==1){
                selectedObject = _addedSpaceObjects[path.row];
            }
            
            targetViewController.spaceObjetc = selectedObject;
            
        }
    }
    
    if ([segue.destinationViewController isKindOfClass:[OWAddSpaceObjectViewController class]]) {
        
        OWAddSpaceObjectViewController *addSpaceObjectVC = segue.destinationViewController;
        addSpaceObjectVC.delegate = self;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - OWAddSpaceObjectViewController Delegate

-(void)didCancel {
    
    NSLog(@"did Cancel");
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(void)addSpaceObject:(OWSpaceObject *)spaceObject{
    
//    //si aún no existe el arreglo, este es alocado en memoria e inicializado
//    if (!self.addedSpaceObjects) {
//        self.addedSpaceObjects = [[NSMutableArray alloc] init];
//    }
    [self.addedSpaceObjects addObject:spaceObject];
    NSLog(@"add object");
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    if ([_addedSpaceObjects count]) {
        return 2;
    }else{
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    if (section ==1) {
        return [_addedSpaceObjects count];
    }else{
        return [_planets count];
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //The name "Cell" has to be the same of the given to the identifier box on the "Attributes inspector" on the storyboard
    
    static NSString *CellIdentifier=@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //Configre cell ...
    
    if (indexPath.section ==1) {
        //Use New Space Object to customize our cell
        OWSpaceObject *planet = [self.addedSpaceObjects objectAtIndex:indexPath.row];
        
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;

        
    }else{
    
        // Take the planet object that is on the position of the current row (indexPath.row) and asign it to a new object of the same type (OWSpaceObject)
        OWSpaceObject *planet = _planets[indexPath.row];//[_planets objectAtIndex:indexPath.row];

        //Use the planet information stored on the object properties to fill the fields textLabel.text and detailTextLabel.text. Besides, asign its own image to the default image of the table on iOS
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
    }
    // After of give a black color to the TableView's background on the storyBoard, are assigned the colors for each cell
    //clearColor to the cell's backgroud to visualize the color (black) of the tableView's background
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    //detailTextLabel is like the subtitle
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    return cell;

}

#pragma mark UITableViewDelegate

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
//    NSLog(@"Accesory button is working properly %li", (long)indexPath.row);
    [self performSegueWithIdentifier:@"push to space data" sender:indexPath];


}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
