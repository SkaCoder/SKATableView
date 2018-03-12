//
//  ViewController.h
//  SKATableViewExample
//
//  Created by Alok Singh on 12/03/18.
//  Copyright © 2018 Alok Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKATableView.h"

@interface ViewController : UIViewController<SKATableViewDelegate>
{
    NSArray *nameArray;
    UITableView *newtable;
    IBOutlet UIButton *main_btn;
    
    IBOutlet UILabel *main_label;
    
}

@end

