//
//  OWSpaceObject.m
//  Out of this World
//
//  Created by Maria Camila on 29/01/16.
//  Copyright © 2016 mindz. All rights reserved.
//

#import "OWSpaceObject.h"
#import "AstronomicalData.h"

@implementation OWSpaceObject

-(id) init{
 
    self = [self initWithData:nil andImage:nil];
    return self;
}

//(id) retorna el tipo de dato
-(id) initWithData:(NSDictionary *)data andImage:(UIImage *)image{

    self = [super init];
    
    self.name = data[PLANET_NAME];
    
    //Get the number that comes as a NSNumber
    self.gravitationalForce = [data[PLANET_GRAVITY] floatValue];
    self.diameter = [data[PLANET_DIAMETER] floatValue];
    self.yearLength = [data[PLANET_YEAR_LENGTH] floatValue];
    self.dayLength = [data[PLANET_DAY_LENGTH] floatValue];
    self.temperature = [data[PLANET_TEMPERATURE] floatValue];
    self.numberOfMoons = [data[PLANET_NUMBER_OF_MOONS] intValue];
    self.nickname = data[PLANET_NICKNAME];
    self.interestFact = data[PLANET_INTERESTING_FACT];
    
    self.spaceImage = image;
    
    return self;
}

@end
