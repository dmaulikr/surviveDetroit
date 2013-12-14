//
//  Item.h
//  SurviveText
//
//  Created by Louis Tur on 12/8/13.
//  Copyright (c) 2013 Louis Tur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic) NSUInteger sellPrice;
@property (nonatomic) NSUInteger resellPrice;
@property (nonatomic) NSUInteger stackSize;//set to 0 no stack

@property (nonatomic, strong, setter = uniqueName:) NSString * name;

+ (NSArray *)wordBank;
+ (NSArray *) bagMaterials;

@end
