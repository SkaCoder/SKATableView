//
//  SATableView.h
//
//  Created by Sachin Andre on 10/03/18.
//  Copyright © 2018 Sachin Andre. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>

@protocol SKATableViewDelegate <NSObject>

-(void)didSelectItem:(NSString *)item;

@end

@interface SKATableView : UIView <UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchBarDelegate>
{
    UIView *tableviewlyer;
    UITableView *tbleView;
    UISearchBar *searchBar_new;
    NSArray *arrRecords;
    id <SKATableViewDelegate> delegate;
    BOOL searchEnabled;
}

@property (nonatomic, retain) NSArray *arrRecords;
@property (nonatomic, retain) id <SKATableViewDelegate> delegate;
//@property (nonatomic,strong) UIView *tblSuperView;
@property (nonatomic, strong) NSMutableArray *searchResult;

-(id)initWithFrame:(CGRect)frame withNSArray:(NSArray *)arrValues andHeadingText:(NSString *)headingText;

-(void)showTableView;
@property (nonatomic,strong) NSString *headingText;
@property (nonatomic,strong) UILabel *lblHeader;

@property (nonatomic, assign) CGRect passRect;


@end
