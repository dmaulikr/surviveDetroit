//
//  ShopsViewController.m
//  SurviveDetroit2
//
//  Created by Louis Tur on 12/8/13.
//  Copyright (c) 2013 Louis Tur. All rights reserved.
//
/*--------------- Edits for Saturday, Dec 14th ------------------
    
    ChangeLog:
    - Mainly focused on the inventory mechanic and how items are stored
 
         Player inventory is now stored by a single NSMutable array where the 
        key is the [Item name] and the object is an NSNumber representing the
        count of that object
         Re-worked [Player addToInventory: withThisMany:] to accept another number variable to show bulk purchases
         Changed inspection buttons and changed inspection text info
 
    To Do:
    - Would like to make shop code work with a dynamic number (can create 4 objects, maybe only displays 2 at a time, randomly).
    - Turn player inventory into an object (Super Class: Container, SubClass: Bag, _type (for example, cloth) and number of slots... which is based on type). Adding to inventory should have a check againt array count and purchase should be rejected.
    - Can't have the same sword listed twice
    - items are sorted by price, ascing
    - change sort method, re-list items
    - add visual/audio signifier of purchase/not purchase
    - change WeaponShop class to store an NSDictionary so that multiple of each item can be stored (this is probably easier after implementing a container class)
    - Make it so that the sword objects with the overall higher stats cost more (this still matters because trash loot will have to follow this model of cost)
    
    Future Considerations:
    - Consider pre-fabricating sword objects to be ready. Perhaps an array of 'Rare' swords with special stats that is pre-generated and a character can win. This would require a new subclass of 'Container' called 'Loot', and loot would be init'd with the encounter type and player level and that would randomly generate some loot based on those values. A player would get gold based on their level, and perhaps a 50% chance of getting the rare loot
    - Add an 'equip' ability (would require an 'equipment' submethod for populating a Dictionary with Head Slot, body slot, etc. information. Method would add object to player's equipmetn forthat slot, it would read the stats modifications on the item and properly update current player health/mana/dmg/etc. totals.
 
 ---------------------------------------------------------------*/

#import "ShopsViewController.h"
#import <Foundation/Foundation.h>
#import "Player.h"
#import "Sword.h"
#import "WeaponShop.h"
#import "SysAlerts.h"

@interface ShopsViewController ()
@property (strong, nonatomic) IBOutlet UITextField *shopText;
@property (strong, nonatomic) IBOutlet UIView *background;
@property (strong, nonatomic) IBOutlet UITextField *shopSlot1Text;
@property (strong, nonatomic) IBOutlet UITextField *shopSlot2Text;
@property (strong, nonatomic) IBOutlet UIButton *shopSlot1Price;
@property (strong, nonatomic) IBOutlet UIButton *shopSlot2Price;
@property (strong, nonatomic) IBOutlet UITextField *playerGold;
@property (strong, nonatomic) IBOutlet UIButton *shopSlot1Inspector;
@property (strong, nonatomic) IBOutlet UIButton *shopSlot2Inspector;


@property (strong, nonatomic) Player * player1;
@property (strong, nonatomic) WeaponShop * weapShop;
@property (strong, nonatomic) SysAlerts * shopAlerts;

@property (strong, nonatomic) IBOutlet UITextView *statsBox;
@property (strong, nonatomic) IBOutlet UITextView *playerInventoryBox;
@property (strong, nonatomic) IBOutlet UIScrollView *playerInventoryScroll;
@end

@implementation ShopsViewController

- (WeaponShop *) weapShop {
    if ( !_weapShop ){
        _weapShop = [[WeaponShop alloc] init];
    }
    return _weapShop;
}
- (Player *) player1 {
    if (!_player1){
        _player1 = [[Player alloc] init];
    }
    return _player1;
}
- (SysAlerts *)shopAlerts {
    if (!_shopAlerts) {
        _shopAlerts = [[SysAlerts alloc] init];
    }
    return _shopAlerts;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self letsBegin];

}

// INSPECTION BUTTONS -------------------------------------
- (IBAction)shopSlot1Inspect:(UIButton *)sender {
    
    NSMutableArray * myArr = [self.weapShop returnInventory];
    NSString * stats = [[myArr objectAtIndex:0] swordStats];
    self.statsBox.text = stats;
    
}
- (IBAction)shopSlot2Inspect:(UIButton *)sender {
    NSMutableArray * myArr = [self.weapShop returnInventory];
    NSString * stats = [[myArr objectAtIndex:1] swordStats];
    self.statsBox.text = stats;
}
// INSPECTION BUTTONS -------------------------------------^


//OTHER BUTTONS -----------------------
- (IBAction)shopSlot1PriceButton:(UIButton *)sender {
    
    NSMutableArray * myArr = [self.weapShop returnInventory];
    long price = [[myArr objectAtIndex:0] sellPrice];
    
    // defines action based on if the player has enough gold. If they do not have enough
    // the purchase is not allowed
    NSLog(@"A new change");
    if ( self.player1.currentGold < price ){
        [SysAlerts notEnoughGold:self.player1.currentGold forThis:price];
    }else{
        [self.player1 addToInventory:[myArr objectAtIndex:0] forThisMany:1];
        [self.player1 updateGold:-price];
        [SysAlerts validPurchase:self.player1.currentGold];
        
    }
    
    [self refreshView];
    
}
- (IBAction)shopSlot2PriceButton:(UIButton *)sender {
    
    NSMutableArray * myArr = [self.weapShop returnInventory];
    long price = [[myArr objectAtIndex:1] sellPrice];
    
    // defines action based on if the player has enough gold. If they do not have enough
    // the purchase is not allowed
    if ( self.player1.currentGold < price ){
        [SysAlerts notEnoughGold:self.player1.currentGold forThis:price];
    }else{
        [self.player1 addToInventory:[myArr objectAtIndex:1] forThisMany:1 ];
        [self.player1 updateGold:-price];
        [SysAlerts validPurchase:self.player1.currentGold];
        
    }
    
    [self refreshView];

}

/* --------------------------------------------------------
 
                    FIGHT!
 
 --------------------------------------------------------*/
- (void)letsBegin{

    [self.player1 changeName:@"Louis"];
    self.shopText.text = [NSString stringWithFormat:@"Welcome to the Shop, %@", self.player1.name];
    [self.weapShop createShopWithInventory:2]; //creates the shop with 2 sword objects
    [self.statsBox setAllowsEditingTextAttributes:0];
    [self.statsBox setUserInteractionEnabled:1];
    [self.statsBox setAlwaysBounceHorizontal:0];
    //edits text field to reflect sword names
    //self.shopSlot1Text.text = [[self.weapShop.shopInventory objectAtIndex:0] name];
    //self.shopSlot2Text.text = [[self.weapShop.shopInventory objectAtIndex:1] name];
    [self.shopSlot1Inspector setTitle:[[self.weapShop.shopInventory objectAtIndex:0] name] forState:UIControlStateNormal];
    [self.shopSlot2Inspector setTitle:[[self.weapShop.shopInventory objectAtIndex:1] name] forState:UIControlStateNormal];
    
    //edits button's title to match the gold cost of the sword
    [self.shopSlot1Price setTitle:[NSString stringWithFormat:@"%lu gp", (unsigned long)[[self.weapShop.shopInventory objectAtIndex:0] sellPrice] ] forState:UIControlStateNormal];
    
    [self.shopSlot2Price setTitle:[NSString stringWithFormat:@"%lu gp", (unsigned long)[[self.weapShop.shopInventory objectAtIndex:1] sellPrice] ] forState:UIControlStateNormal];
    
}

//just to refresh the gold count and inventory fields
- (void) refreshView{
    
    self.playerGold.text = [NSString stringWithFormat:@"%lu gp", (unsigned long)self.player1.currentGold];
    
    // calls for a print out of player inventory
    NSMutableString * inventoryList = [NSMutableString stringWithString:[self.player1 displayInventoryCounts]];
    [self.playerInventoryBox setUserInteractionEnabled:TRUE];
    [self.playerInventoryBox setAllowsEditingTextAttributes:FALSE  ];
    [self.playerInventoryBox setAlwaysBounceHorizontal:FALSE];
    self.playerInventoryBox.text = inventoryList;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
