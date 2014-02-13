//
//  HGTableViewController.h
//  HGFilteringEntities
//
//  Created by Henrique Gouveia on 2/13/14.
//  Copyright (c) 2014 Henrique Gouveia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void (^HGTableViewControllerDidSelectedItemBlock)(id object);

@interface HGTableViewController : UITableViewController

- (id)initWithDataSource:(NSArray *)dataSource
            paramsToShow:(NSArray *)textParams
          paramsToFilter:(NSArray *)paramsForFilter
               textField:(UITextField *)textField
                viewSize:(CGSize)size
              completion:(HGTableViewControllerDidSelectedItemBlock)block;

@end
