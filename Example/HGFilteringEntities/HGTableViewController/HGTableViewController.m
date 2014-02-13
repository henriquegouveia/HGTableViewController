//
//  HGTableViewController.m
//  HGFilteringEntities
//
//  Created by Henrique Gouveia on 2/13/14.
//  Copyright (c) 2014 Henrique Gouveia. All rights reserved.
//

#import "HGTableViewController.h"

@interface HGTableViewController () <UITextFieldDelegate>

@property (strong, nonatomic) NSArray *propertiesToSearchFor;
@property (strong, nonatomic) NSArray *paramsToShowOnTheCellText;
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) NSArray *dataSource;
@property (strong, nonatomic) NSArray *searchResult;

@property (assign, nonatomic) CGSize size;

@property (copy, nonatomic) HGTableViewControllerDidSelectedItemBlock didSelectedItemBlock;

@end

@implementation HGTableViewController

- (id)initWithDataSource:(NSArray *)dataSource
            paramsToShow:(NSArray *)textParams
          paramsToFilter:(NSArray *)paramsForFilter
               textField:(UITextField *)textField
                viewSize:(CGSize)size
              completion:(HGTableViewControllerDidSelectedItemBlock)block
{
    self = [super init];
    if (self)
    {
        self.view.frame = CGRectMake(0.0f, 0.0f, size.width, size.height);
        
        _dataSource = dataSource;
        _searchResult = dataSource;
        
        _propertiesToSearchFor = paramsForFilter;
        _paramsToShowOnTheCellText = textParams;
        
        _textField = textField;
        _textField.delegate = self;
        
        _didSelectedItemBlock = block;
        
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        self.tableView.dataSource = self;
    }
    
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self searchResult] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    id object = [[self searchResult] objectAtIndex:indexPath.row];
    
    NSString *textToShow = [NSString new];
    for (NSString *text in self.paramsToShowOnTheCellText)
    {
        textToShow = [textToShow stringByAppendingFormat:@"%@ ", [object valueForKeyPath:text]];
    }
    
    cell.textLabel.text = textToShow;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.didSelectedItemBlock([self.searchResult objectAtIndex:indexPath.row]);
}

#pragma mark - UITextField Delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    self.searchResult = [self filterDatasourceParameters:[NSString stringWithFormat:@"%@%@", textField.text, string]];
    [self.tableView reloadData];
    
    return YES;
}

#pragma mark - Filter DataSource Array

- (NSArray *)filterDatasourceParameters:(NSString *)value
{
    NSMutableArray *predicates = [NSMutableArray new];
    
    for (NSString *param in self.propertiesToSearchFor)
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@", param, value];
        [predicates addObject:predicate];
    }
    
    NSPredicate *compoundPredicate = [NSCompoundPredicate orPredicateWithSubpredicates:predicates];
    NSArray *searchResult = [self.dataSource filteredArrayUsingPredicate:compoundPredicate];
    
    return searchResult;
}

@end
