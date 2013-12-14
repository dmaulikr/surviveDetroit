//
//  WeaponShop.h
//  SurviveDetroit2
//
//  Created by Louis Tur on 12/9/13.
//  Copyright (c) 2013 Louis Tur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeaponShop : NSObject

@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSMutableArray * shopInventory;

- (void) createShopWithInventory: (NSUInteger) stock;
- (NSMutableArray *) returnInventory;
@end
