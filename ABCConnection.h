//
//  ABCConnection.h
//  Salido Challenge
//
//  Created by Shane Sniteman on 3/6/15.
//  Copyright (c) 2015 Shane Sniteman. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ABCProduct;

@interface ABCConnection : NSObject


@property (nonatomic, strong) NSMutableArray * productsList;


- (void)getDataWithSuccess:(void (^)(NSArray *dataArray))success failure:(void (^)(NSError *error)) failure;






@end
