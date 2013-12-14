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


- (id)init{
    self = [super init];
    if (self) {
        _currentGold = 1000;
        _inventoryWithCount = [NSMutableDictionary dictionary];
        self.type = @"Human";
    }
    return self;
}
- (void)changeName:(NSString *)newName {
    
    self.name = [NSString stringWithString:newName];
}
- (void)updateGold:(NSUInteger)value {
    
    self.currentGold += value;
}
- (void) addToInventory:(Item *)obj forThisMany: (int) number{
    
    //for the dictionary, the key ends up being the item name (unique), and the object paired is an NSNumber representing how many of each item you have
    
    //If statement checks for the existnace of a given item.name, returns nil if not found or if the dictionary is empty
    if ( [self.inventoryWithCount objectForKey:obj.name] ){
        NSNumber *myNum = [self.inventoryWithCount objectForKey:obj.name];
        int i = [myNum integerValue]+ number;
        [self.inventoryWithCount setObject:[NSNumber numberWithInt:i] forKey:obj.name];//obj.name
    }else{
        [self.inventoryWithCount setObject:@1 forKey:obj.name];
    }
}
- (NSMutableString *)displayInventoryCounts {
    
    if( self.inventoryWithCount ){
        //displays the player's inventory
        NSMutableString * inventoryList = [NSMutableString string];
        [inventoryList appendFormat:@"Your Bag: \n--------------------\n"];
        
        for ( NSString * key in self.inventoryWithCount ){
            [inventoryList appendFormat:@"%@.......X %@\n", key, [self.inventoryWithCount objectForKey:key] ];
        }
        return inventoryList;
    }else
        return nil;
    
}



@end
