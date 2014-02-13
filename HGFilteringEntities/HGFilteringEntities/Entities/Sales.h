//
//  Sales.h
//  HGAutoCompleteList
//
//  Created by Henrique Gouveia on 2/13/14.
//  Copyright (c) 2014 Henrique Gouveia. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Customer.h"

@interface Sales : NSObject

@property (strong, nonatomic) NSNumber *code;
@property (strong, nonatomic) Customer *customer;
@property (strong, nonatomic) NSString *station;
@property (strong, nonatomic) NSString *paymentMethod;
@property (strong, nonatomic) NSDate *dateOfBilling;

- (instancetype)initWithCustomer:(Customer *)customer station:(NSString *)station
                 paymentMethod:(NSString *)method dateOfBilling:(NSDate *)date
                     code:(NSNumber *)code;

@end
