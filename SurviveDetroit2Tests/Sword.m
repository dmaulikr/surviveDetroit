//
//  Sword.m
//  SurviveText
//
//  Created by Louis Tur on 12/8/13.
//  Copyright (c) 2013 Louis Tur. All rights reserved.
//

#import "Sword.h"

@implementation Sword

- (id)init
{
    self = [super init];
    if (self) {
        
        self.stats = [NSDictionary dictionaryWithObjectsAndKeys:
                      @"dmg",[self randBase:4 withModifier:2],
                      @"spd", [self randBase:25 withModifier:25],
                      nil];
        
        self.sellPrice = [[self randBase:100 withModifier:75] integerValue];
    }
    return self;
}

- (NSNumber *) randBase: (NSUInteger) base withModifier: (NSUInteger) modifier {
    return [NSNumber numberWithUnsignedLong:(arc4random() % base + modifier) ];
}


@end
