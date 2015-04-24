//
//  ProductsTVC.m
//  Salido Challenge
//
//  Created by Shane Sniteman on 3/6/15.
//  Copyright (c) 2015 Shane Sniteman. All rights reserved.
//

#import "ProductsTVC.h"
#import "ABCConnection.h"
#import "ABCProduct.h"
#import "ProductDetailViewController.h"
#import "CartViewController.h"
@implementation ProductsTVC


-(void)viewDidLoad{

    ABCConnection * connection = [[ABCConnection alloc]init];

    [connection getDataWithSuccess:^(NSArray *dataArray) {
        self.arrayofProducts = [NSArray arrayWithArray:dataArray];
        [self.tableView reloadData];
    } failure:^(NSError *error) {

        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"OH NO" message:@"There is a problem connecting" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        
        [alert show];
        
        NSLog(@"There was an error in Connection");
        
        
    }];


}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return self.arrayofProducts.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *CellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (self.arrayofProducts.count > 0) {
        ABCProduct * product = self.arrayofProducts[indexPath.row];
        cell.textLabel.text = product.name;
        return cell;
    
    }
    return cell;
    
    
}
#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        ProductDetailViewController * controller = [segue destinationViewController];
        
        NSIndexPath * indexPath = [self.tableView indexPathForCell:sender];
        
        
        controller.product = [self.arrayofProducts objectAtIndex:indexPath.row];
        
    };

    
}






@end
