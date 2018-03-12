//
//  SATableView.m
//
//  Created by Sachin Andre on 10/03/18.
//  Copyright © 2018 Sachin Andre. All rights reserved.
//

#import "SKATableView.h"

@implementation SKATableView


@synthesize arrRecords,delegate;


-(id)initWithFrame:(CGRect)frame withNSArray:(NSArray *)arrValues andHeadingText:(NSString *)headingText{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.headingText=headingText;
        self.arrRecords = arrValues;
    }
    return self;
}

-(void)showTableView{
    
    tbleView = [[UITableView alloc] initWithFrame:CGRectMake(_passRect.origin.x-_passRect.origin.x, _passRect.origin.y-_passRect.origin.y, _passRect.size.width, _passRect.size.height)];
    
    //_passRect.origin.x,
    
    tbleView.delegate = self;
    tbleView.dataSource = self;
    tbleView.layer.cornerRadius=8.0;
    tbleView.clipsToBounds=YES;
    tbleView.layer.borderWidth = 1.0;
    tbleView.layer.borderColor = [UIColor colorWithRed:17.0f/255.0f green:190.0f/255.0f blue:227.0f/255.0f alpha:1.0].CGColor;
    
    [self addSubview:tbleView];
    
    searchBar_new = [[UISearchBar alloc] initWithFrame:CGRectMake(tbleView.frame.origin.x, tbleView.frame.origin.y, tbleView.frame.size.width, 75)];
        searchBar_new.delegate=self;
    
        searchBar_new.barTintColor=[UIColor colorWithRed:17.0f/255.0f green:190.0f/255.0f blue:227.0f/255.0f alpha:1.0];
    
    
    searchBar_new.prompt=@"            ";
    
    NSString *str = _headingText;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    
    // Set font, notice the range is for the whole string
    UIFont *font = [UIFont boldSystemFontOfSize:18];
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, [attributedString length])];
    
    // Set background color, again for entire range
    [attributedString addAttribute:NSBackgroundColorAttributeName
                             value:[UIColor colorWithRed:17.0f/255.0f green:190.0f/255.0f blue:227.0f/255.0f alpha:1.0]
                             range:NSMakeRange(0, [attributedString length])];
    // Define label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((searchBar_new.frame.size.width/2)-50, searchBar_new.frame.origin.y-20, searchBar_new.frame.size.width, 80)];
    
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    [label setTextColor:[UIColor whiteColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextAlignment:NSTextAlignmentLeft];
    
    // Set label text to attributed string
    [label setAttributedText:attributedString];
    
    tbleView.tableHeaderView = searchBar_new;
    
    [tbleView addSubview:label];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (searchEnabled) {
        return [self.searchResult count];
    }
    else{
        return [self.arrRecords count];
    }
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    
    
        static NSString *CellIdentifier1 = @"cellForTable1";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
        
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
        }
    
    
    if (searchEnabled){
        
        cell.textLabel.text = [self.searchResult objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text = [self.arrRecords objectAtIndex:indexPath.row];
    }
    
        return cell;
  }
    
- (void)tableView:(UITableView *)tableview didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (searchEnabled){
        
        [self.delegate didSelectItem:self.searchResult[indexPath.row]];
    }
    else
    {
        [self.delegate didSelectItem:self.arrRecords[indexPath.row]];
    }
    
    tbleView.hidden=YES;
}

#pragma mark - Search delegate methods

- (void)filterContentForSearchText:(NSString*)searchText
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF CONTAINS %@",
                                    searchText];
    
    _searchResult = [arrRecords filteredArrayUsingPredicate:resultPredicate];
    [tbleView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchBar.text.length == 0) {
        searchEnabled = NO;
        [tbleView reloadData];
    }
    else {
        searchEnabled = YES;
        [self filterContentForSearchText:searchBar.text];
        
        if (_searchResult.count==0) {
            _lblHeader=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, tbleView.bounds.size.width, tbleView.bounds.size.height)];
            _lblHeader.text = @"No Result Found";
            _lblHeader.textColor = [UIColor blackColor];
            _lblHeader.textAlignment = NSTextAlignmentCenter;
            tbleView.backgroundView = _lblHeader;
            tbleView.separatorStyle = UITableViewCellSeparatorStyleNone;
            [tbleView reloadData];
            _lblHeader.hidden=NO;
        }else{
            _lblHeader.hidden=YES;
        }
    }
    
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    searchEnabled = YES;
    [self filterContentForSearchText:searchBar.text];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [searchBar setText:@""];
    searchEnabled = NO;
    [tbleView reloadData];
}

@end
