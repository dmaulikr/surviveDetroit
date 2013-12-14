//
//  Container.m
//  SurviveDetroit2
//
//  Created by Louis Tur on 12/13/13.
//  Copyright (c) 2013 Louis Tur. All rights reserved.
//

#import "Container.h"

/* I chose to make slotSize only accesible from within the object (and without a setter) because the slotSize should only ever be 1 value, set at instantiation.
 */
@interface Container()

@property (nonatomic, readwrite) NSUInteger slotSize;


@end

@implementation Container

- (NSUInteger)bagSize{
    return self.slotSize;
}

- (id)initBagWith:(NSUInteger)material withSlots:(NSUInteger)numOfSlots {

    self = [super init];
    if (self) {
        _slotSize = numOfSlots;
        _materialType = [[Container bagMaterials] objectAtIndex:material];
        _bagContents = [NSMutableDictionary dictionary];
        self.stackSize = 0;
    }
    return self;
}
- (id) init {
    return [self initBagWith:1 withSlots:6];
}

- (void)addItemToBag:(Item *)obj howMany:(NSUInteger)quantity{
    
    if ( [self.bagContents objectForKey:obj.name] ){
        NSNumber *myNum = [self.bagContents objectForKey:obj.name];
        int i = [myNum integerValue] + quantity;
        [self.bagContents setObject:[NSNumber numberWithInt:i] forKey:obj.name];
    }else{
        [self.bagContents setObject:@1 forKey:obj.name];
    }
}

-(void)addItemToBag:(Item *)item{
    [self addItemToBag:item howMany:1];
}

-(NSNumber *)removeItemFromBag:(NSString *)item{
    
    int stock;
    // this checks the # of a particular item in the dictionary
    if( (stock = [[self.bagContents objectForKey:item] integerValue]) ){
        if ( stock > 1 ){//not last one in stock, so must decrement
            NSNumber *newCount = [NSNumber numberWithInt:--stock];
            // newCount is one less of the stackable item object
            [self.bagContents setObject:newCount forKey:item];
            return newCount;
        }else{
            return @1;
        }
    }
                    
    return  @0;
}

@end
