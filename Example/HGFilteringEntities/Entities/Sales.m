//
//  Sales.m
//  HGAutoCompleteList
//
//  Created by Henrique Gouveia on 2/13/14.
//  Copyright (c) 2014 Henrique Gouveia. All rights reserved.
//

#import "Sales.h"

@implementation Sales

- (instancetype)initWithCustomer:(Customer *)customer
                         station:(NSString *)station
                   paymentMethod:(NSString *)method
                   dateOfBilling:(NSDate *)date
                            code:(NSNumber *)code
{
    Sales *sale = [Sales new];
    sale.customer = customer;
    sale.code = code;
    sale.dateOfBilling = date;
    sale.station = station;
    sale.paymentMethod = method;
    
    return sale;
}

@end
