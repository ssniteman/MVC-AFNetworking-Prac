//
//  ABCProduct.h
//  Salido Challenge
//
//  Created by Shane Sniteman on 3/6/15.
//  Copyright (c) 2015 Shane Sniteman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABCProduct : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSString * rating;
@property (nonatomic) NSString * price;
@property (nonatomic) NSDictionary * varietalDictionary;


-(instancetype)initWithRecord:(NSDictionary *)record;
@end
