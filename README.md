HGTableViewController
=====================

##Description

Too many functions to make your life more easy when need to make a auto complete filter by many parameters. 
This contains:

1. Auto complete function
2. Response blocks
3. Datasource manager
4. Properties mapped by KVC

##How To Use

Just copy these files `HGTableViewController.h` and `HGTableViewController.m` and instantiate them in your classes like the example below.

```
#import HGTableViewController.h

NSArray *propertiesOfMyObjectToShowOnTheCellText = @[@"firstName", @"lastName"];
NSArray *propertiesToSearchFor = @[@"firstName", @"email", @"phoneNumber", @"zipCode"];
    
HGTableViewController *autoCompleteContactsViewController = [[HGTableViewController alloc]
                                                              initWithDataSource:dataSourceArray
                                                              paramsToShow:propertiesOfMyObjectToShowOnTheCellText 
                                                              paramsToFilter:propertiesToSearchFor 
                                                              textField:searchTextField 
                                                              completion:^(id object) {
                                                                  //On this block will be returned the clicked object
                                                              }];
```
