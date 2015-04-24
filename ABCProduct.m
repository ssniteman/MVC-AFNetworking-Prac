//
//  ABCProduct.m
//  Salido Challenge
//
//  Created by Shane Sniteman on 3/6/15.
//  Copyright (c) 2015 Shane Sniteman. All rights reserved.
//

#import "ABCProduct.h"

@implementation ABCProduct

- (instancetype)initWithRecord:(NSDictionary *)record
{
    self = [super init];
    
    
    
    if ([record isKindOfClass:[NSDictionary class]]) {

        self.name = record[@"Name"];
        NSDictionary * ratingDict = [record objectForKey:@"Ratings"];
        self.rating = [ratingDict[@"HighestScore"]stringValue];
        self.price = [record[@"PriceRetail"]stringValue];
        //points to product type
        self.varietalDictionary = [record objectForKey:@"Varietal"];
                
    }else {
    
        NSLog(@"some field was null");
    
    }
    
    return self;
}



@end
