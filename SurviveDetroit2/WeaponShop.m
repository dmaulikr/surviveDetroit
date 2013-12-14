//
//  WeaponShop.m
//  SurviveDetroit2
//
//  Created by Louis Tur on 12/9/13.
//  Copyright (c) 2013 Louis Tur. All rights reserved.
//

#import "WeaponShop.h"
#import "Sword.h"

@implementation WeaponShop

//@synthesize name = _name;

- (void) setName:(NSString *)shopName{
    if (!_name){
        _name = @"Default";
    }
    else
        _name = shopName;
}

- (NSMutableArray *)shopInventory{
    if (!_shopInventory) {
        _shopInventory = [NSMutableArray array];
    }
    return _shopInventory;
}

- (void) createShopWithInventory: (NSUInteger) stock{
    Sword * prototype = nil;
    
    for ( int i = 0; i < stock; i++){
        prototype = [[Sword alloc] init];
        [self.shopInventory addObject:prototype];
    }
}

- (NSMutableArray *) returnInventory{
    return self.shopInventory;
}

@end
