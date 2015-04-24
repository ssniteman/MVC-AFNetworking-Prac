//
//  ProductDetailViewController.h
//  Salido Challenge
//
//  Created by Shane Sniteman on 3/6/15.
//  Copyright (c) 2015 Shane Sniteman. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ABCProduct;
@interface ProductDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;


@property (strong, nonatomic) IBOutlet UILabel *typeLabel;

@property (strong, nonatomic) ABCProduct * product;


@end
