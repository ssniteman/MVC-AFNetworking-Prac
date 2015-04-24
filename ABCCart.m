//
//  ABCCart.m
//  Salido Challenge
//
//  Created by Shane Sniteman on 3/6/15.
//  Copyright (c) 2015 Shane Sniteman. All rights reserved.
//

#import "ABCCart.h"

@implementation ABCCart

+(instancetype)sharedCart{

    static ABCCart * sharedInstance = nil;

    if (sharedInstance == nil) {
        sharedInstance = [[ABCCart alloc]init];
    }
    
    return sharedInstance;
}

- (NSMutableArray *)cartProducts
{
    if (!_cartProducts) {
        _cartProducts = [[NSMutableArray alloc]init];
  
    
    }
    

    return _cartProducts;


}

-(NSInteger)numProducts{

    return [self.cartProducts count];

    
}


-(void)addProduct:(ABCProduct *)product {


    [self.cartProducts addObject:product];


}

- (void)removeProduct:(ABCProduct *)product{
    [self.cartProducts removeObject:product];

}




@end
