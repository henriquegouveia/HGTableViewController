//
//  HGViewController.m
//  HGFilteringEntities
//
//  Created by Henrique Gouveia on 2/13/14.
//  Copyright (c) 2014 Henrique Gouveia. All rights reserved.
//

#import "HGViewController.h"

#import "HGTableViewController.h"

#import "Customer.h"
#import "Sales.h"

@interface HGViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@property (strong, nonatomic) HGTableViewController *autoCompleteTableViewController;

@end

@implementation HGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.autoCompleteTableViewController.view removeFromSuperview];
    [self.searchTextField resignFirstResponder];
}

#pragma mark - Actions To Show Table View

- (IBAction)openAutoCompleteListOfSales:(id)sender
{
    [self.autoCompleteTableViewController.view removeFromSuperview];
    
    NSArray *lookingForParameters = @[@"customer.name", @"paymentMethod"];
    NSArray *textLabelParams = @[@"code", @"paymentMethod"];
    
    //imagine this coming of your database
    NSArray *sales = [self sales];
    
    self.autoCompleteTableViewController = [[HGTableViewController alloc] initWithDataSource:sales
                                                                                                  paramsToShow:textLabelParams
                                                                                                paramsToFilter:lookingForParameters
                                                                                                     textField:self.searchTextField
                                                                                                      viewSize:CGSizeMake(300.0f, 200.0f) completion:^(id object) {
                                                                                                          NSLog(@"%@", object);
                                                                                                          [self.autoCompleteTableViewController.view removeFromSuperview];
                                                                                                          [self.searchTextField resignFirstResponder];
                                                                                                      }];
    
    [self.view addSubview:self.autoCompleteTableViewController.view];
}

- (IBAction)openAutoCompleteListOfCustomers:(id)sender
{
    [self.autoCompleteTableViewController.view removeFromSuperview];
    
    NSArray *lookingForParameters = @[@"code", @"phoneNumber", @"name"];
    NSArray *textLabelParams = @[@"code", @"name"];
    
    //imagine this coming of your database
    NSArray *customers = [self customers];
    
    self.autoCompleteTableViewController = [[HGTableViewController alloc] initWithDataSource:customers
                                                                                paramsToShow:textLabelParams
                                                                              paramsToFilter:lookingForParameters
                                                                                   textField:self.searchTextField
                                                                                    viewSize:CGSizeMake(300.0f, 200.0f) completion:^(id object) {
                                                                                        NSLog(@"%@", object);
                                                                                        [self.autoCompleteTableViewController.view removeFromSuperview];
                                                                                        [self.searchTextField resignFirstResponder];
                                                                                    }];
    
    [self.view addSubview:self.autoCompleteTableViewController.view];

}

#pragma mark - Mock Entities

- (NSArray *)customers
{
    Customer *customer1 = [[Customer alloc] initWithName:@"First Customer"
                                                    code:@"102030"
                                             phoneNumber:@"(163) 835-3530"
                                                 address:@"Some Street Over There"
                                                 zipCode:@"54353"];
    
    Customer *customer2 = [[Customer alloc] initWithName:@"Second Customer"
                                                    code:@"232323"
                                             phoneNumber:@"(888) 435-3210"
                                                 address:@"Second Street"
                                                 zipCode:@"11111"];
    
    Customer *customer3 = [[Customer alloc] initWithName:@"Third Customer"
                                                    code:@"333333"
                                             phoneNumber:@"(111) 777-5530"
                                                 address:@"Street"
                                                 zipCode:@"99999"];
    
    return @[customer1, customer2, customer3];
}

- (NSArray *)sales
{
    Sales *sale1 = [[Sales alloc] initWithCustomer:[[self customers] objectAtIndex:0]
                                           station:@"First"
                                     paymentMethod:@"Cash"
                                     dateOfBilling:[NSDate date]
                                              code:@(1)];
    
    Sales *sale2 = [[Sales alloc] initWithCustomer:[[self customers] objectAtIndex:1]
                                           station:@"Second"
                                     paymentMethod:@"Credit Card"
                                     dateOfBilling:[NSDate date]
                                              code:@(2)];
    
    Sales *sale3 = [[Sales alloc] initWithCustomer:[[self customers] objectAtIndex:2]
                                           station:@"Third"
                                     paymentMethod:@"PayPal"
                                     dateOfBilling:[NSDate date]
                                              code:@(3)];
    
    return @[sale1, sale2, sale3];
}


@end
