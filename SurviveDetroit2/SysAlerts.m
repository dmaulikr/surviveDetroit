//
//  SysAlerts.m
//  SurviveDetroit2
//
//  Created by Louis Tur on 12/10/13.
//  Copyright (c) 2013 Louis Tur. All rights reserved.
//

#import "SysAlerts.h"

@implementation SysAlerts

+(void)notEnoughGold:(NSInteger)playerGold forThis:(NSInteger)itemGold{
    
    NSLog(@"Sorry, you do not have enough gold!");
    NSLog(@"Your Gold: %ld            Item's Cost:%ld", (long)
          playerGold, (long)itemGold);
}
+(void)validPurchase:(NSInteger)remainingGold{
    NSLog(@"Thank you for your purchase");
    NSLog(@"Gold: %ld", (long)remainingGold);
}
@end
