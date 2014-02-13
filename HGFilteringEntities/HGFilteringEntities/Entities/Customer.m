//
//  Customer.m
//  HGAutoCompleteList
//
//  Created by Henrique Gouveia on 2/13/14.
//  Copyright (c) 2014 Henrique Gouveia. All rights reserved.
//

#import "Customer.h"

@implementation Customer

- (instancetype)initWithName:(NSString *)name code:(NSString *)code
                 phoneNumber:(NSString *)phone address:(NSString *)address
                     zipCode:(NSString *)zip
{
    Customer *customer = [Customer new];
    customer.code = code;
    customer.name = name;
    customer.phoneNumber = phone;
    customer.address = address;
    customer.zipCode = zip;
    
    return customer;
}

@end
