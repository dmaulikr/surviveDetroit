//
//  Sword.h
//  SurviveText
//
//  Created by Louis Tur on 12/8/13.
//  Copyright (c) 2013 Louis Tur. All rights reserved.
//

#import "Item.h"

@interface Sword : Item

@property (nonatomic, strong) NSDictionary * stats;

- (NSString *) swordStats;
+(NSArray *) validStats;

@end
