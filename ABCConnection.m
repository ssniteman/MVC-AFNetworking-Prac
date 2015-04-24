//
//  ABCConnection.m
//  Salido Challenge
//
//  Created by Shane Sniteman on 3/6/15.
//  Copyright (c) 2015 Shane Sniteman. All rights reserved.
//

//Connecting into ABC wine API to retrieve JSON data.

#import "ABCConnection.h"
#import  "ABCProduct.h"
#import <AFNetworking/AFNetworking.h>

@implementation ABCConnection


- (NSMutableArray *)productsList
{
    if (!_productsList) {
        _productsList = [[NSMutableArray alloc]init];
    }
    return _productsList;
}

- (void)getDataWithSuccess:(void (^)(NSArray *dataArray))success failure:(void (^)(NSError *error)) failure{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:@"http://services.wine.com/api/beta2/service.svc/JSON/catalog?apikey=fef43870a382c05704451addbdb482bb&size=50" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@",[responseObject objectForKey:@"Products"]);
        
        NSDictionary *responseDict = [responseObject objectForKey:@"Products"];
        
        NSMutableArray *dataArray = [NSMutableArray array];
        NSArray *productsArray = [NSArray arrayWithArray:[responseDict objectForKey:@"List"]];
        for (NSDictionary *productdic in productsArray) {
            
            ABCProduct *product = [[ABCProduct alloc] initWithRecord:productdic];
            [dataArray addObject:product];
        }
        success([NSArray arrayWithArray:dataArray]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        failure(error);
    }];
}











@end
