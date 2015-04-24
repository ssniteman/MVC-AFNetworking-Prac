//
//  CartViewController.m
//  Salido Challenge
//
//  Created by Shane Sniteman on 3/6/15.
//  Copyright (c) 2015 Shane Sniteman. All rights reserved.
//

#import "CartViewController.h"
#import "ABCCart.h"
#import "ABCProduct.h"

@interface CartViewController ()
@property (nonatomic, strong) ABCProduct * product;

@end

@implementation CartViewController 
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [ABCCart sharedCart].cartProducts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    self.product = [ABCCart sharedCart].cartProducts[indexPath.row];
    
    cell.textLabel.text = self.product.name;
    
    return cell;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        [[ABCCart sharedCart].cartProducts removeObject:self.product];
        
        
        [self.tableview deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
        
        [self.tableview reloadData];
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        
        
    }
}

- (IBAction)checkOutbuttonpressed:(id)sender {
    
    NSLog(@"checkout button pressed");
    
    UIAlertView  * alertView = [[UIAlertView alloc]initWithTitle:@"Checkout" message:[NSString stringWithFormat:@"You have %lu items in your cart",[ABCCart sharedCart].cartProducts.count] delegate:self cancelButtonTitle:@"great" otherButtonTitles: nil];
    
    [alertView show];
    
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
