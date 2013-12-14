//
//  Container.h
//  SurviveDetroit2
//
//  Created by Louis Tur on 12/13/13.
//  Copyright (c) 2013 Louis Tur. All rights reserved.
//

#import "Item.h"

@interface Container : Item
@property (nonatomic, readonly) NSUInteger slotSize;
@property (nonatomic, strong) NSString * materialType;
@property (nonatomic, strong) NSMutableDictionary *bagContents;

- (NSUInteger) bagSize;
- (id) initBagWith: (NSUInteger) material withSlots: (NSUInteger) numOfSlots;
- (NSNumber *) removeItemFromBag: (NSString *) item;
- (void) addItemToBag: (Item *) item howMany: (NSUInteger) quantity;
- (void) addItemToBag: (Item *) item;

@end
