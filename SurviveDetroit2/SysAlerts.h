//
//  SysAlerts.h
//  SurviveDetroit2
//
//  Created by Louis Tur on 12/10/13.
//  Copyright (c) 2013 Louis Tur. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Player;

@interface SysAlerts : NSObject


+ (void) notEnoughGold: (NSInteger) playerGold forThis: (NSInteger) itemGold;
+ (void) validPurchase: (NSInteger) remainingGold;

@end
