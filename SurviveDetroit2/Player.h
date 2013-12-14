//
//  Player.h
//  SurviveText
//
//  Created by Louis Tur on 12/8/13.
//  Copyright (c) 2013 Louis Tur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Creature.h"
#import "Item.h"

@interface Player : Creature

@property (nonatomic) NSUInteger currentGold;
@property (strong, nonatomic) NSMutableDictionary *inventoryWithCount;

- (void)updateGold:(NSUInteger)value;
- (void)changeName:(NSString *)newName;
- (void)addToInventory: (Item *) obj forThisMany: (int) number;
- (NSString *) displayInventoryCounts;

@end
