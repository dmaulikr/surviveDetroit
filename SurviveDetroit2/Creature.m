//
//  Creature.m
//  SurviveDetroit2
//
//  Created by Louis Tur on 12/8/13.
//  Copyright (c) 2013 Louis Tur. All rights reserved.
//

#import "Creature.h"

@implementation Creature

- (id)init
{
    self = [super init];
    if (self) {
        _name = @"Default Name";
        _type = @"Humaniod";
    }
    return self;
}

@end
