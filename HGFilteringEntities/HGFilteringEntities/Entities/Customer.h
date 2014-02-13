//
//  Customer.h
//  HGAutoCompleteList
//
//  Created by Henrique Gouveia on 2/13/14.
//  Copyright (c) 2014 Henrique Gouveia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customer : NSObject

@property (strong, nonatomic) NSString *code;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *zipCode;

- (instancetype)initWithName:(NSString *)name code:(NSString *)code
                 phoneNumber:(NSString *)phone address:(NSString *)address
                     zipCode:(NSString *)zip;

@end
