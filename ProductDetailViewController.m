//
//  ProductDetailViewController.m
//  Salido Challenge
//
//  Created by Shane Sniteman on 3/6/15.
//  Copyright (c) 2015 Shane Sniteman. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "ABCProduct.h"
#import "ABCCart.h"
#import "CartViewController.h"
@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"this is my product info selectected %@", self.product.name);
    
    self.nameLabel.text = self.product.name;
    self.priceLabel.text = self.product.price;
    self.ratingLabel.text = self.product.rating;
    self.typeLabel.text = self.product.varietalDictionary[@"Name"];
    

}

- (IBAction)addProduct{

    
    [[ABCCart sharedCart] addProduct:self.product];

    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Item Added" message:@"You have added an item" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];

    [alert show];


    
}

//
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
// 
//    CartViewController * cartVC = (CartViewController *)[segue destinationViewController];
//    
//    
//    
//    
//}



@end
