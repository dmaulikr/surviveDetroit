//
//  Player.h
//  SurviveText
//
//  Created by Louis Tur on 12/8/13.
//  Copyright (c) 2013 Louis Tur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic) NSUInteger currentGold;
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSMutableArray *ownedItems;

- (void)updateGold:(NSUInteger)price;


@end
