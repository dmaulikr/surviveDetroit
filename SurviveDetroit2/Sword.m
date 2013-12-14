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
        
        // This should call [Self validStats] to generate this list
        // In that manner, adding a string to the valid stats results in an additional stat
        // with minimal work
        self.stats = [NSDictionary dictionaryWithObjectsAndKeys:
                      [self randBase:4 withModifier:2], @"dmg",
                      [self randBase:25 withModifier:25], @"spd",
                      nil];
        
        self.sellPrice = [[self randBase:100 withModifier:75] longValue];
        //NSLog(@"In the Sword Generation. Price: %lu", (unsigned long)self.sellPrice);
        [self generateName];
    }
    return self;
}

- (NSNumber *) randBase: (NSUInteger) base withModifier: (NSUInteger) modifier {
    return [NSNumber numberWithUnsignedLong:(arc4random() % base + modifier) ];
}

+ (NSArray *)validStats {
    return @[@"dmg",@"spd"];
}

- (void) generateName {
    
    NSArray * myArr = [Item wordBank];
    NSString * newName = [myArr objectAtIndex:(arc4random() % [myArr count])];
    NSString * newerName = [newName stringByAppendingString:@" Sword"];
    
    [self uniqueName:newerName];
    
}

- (NSString *)swordStats {
    
    NSMutableArray * arr = [NSMutableArray arrayWithArray:[Sword validStats]];
    NSMutableString * final = [NSMutableString stringWithFormat:@"%@ \n-------------------\n", self.name];
    
    for (NSString * key in arr) {
        //NSLog(@"%@: %@", key, [self.stats objectForKey:key]);
        [final appendFormat:@"%@: %@\n", key, [self.stats objectForKey:key]];
        
    }
    
    return final;
}


@end
