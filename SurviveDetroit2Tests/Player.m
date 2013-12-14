//
//  Player.m
//  SurviveText
//
//  Created by Louis Tur on 12/8/13.
//  Copyright (c) 2013 Louis Tur. All rights reserved.
//

#import "Player.h"
@interface Player()

- (void) changeName: (NSString *) newName;

@end

@implementation Player

- (id)init
{
    self = [super init];
    if (self) {
        _currentGold = 1000;
        _ownedItems = [NSMutableArray array];
    }
    return self;
}

- (void)changeName:(NSString *)newName {
    
    _name = [NSString stringWithString:newName];
}

- (void)updateGold:(NSUInteger)price {
    
    self.currentGold += price;
}

@end
