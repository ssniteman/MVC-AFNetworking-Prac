//
//  ABCCart.h
//  Salido Challenge
//
//  Created by Shane Sniteman on 3/6/15.
//  Copyright (c) 2015 Shane Sniteman. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ABCProduct;
@interface ABCCart : NSObject

@property(nonatomic) NSMutableArray * cartProducts;

+(instancetype)sharedCart;
- (NSInteger)numProducts;

- (void)addProduct:(ABCProduct *)product;

- (void)removeProduct:(ABCProduct *)product;


@end
