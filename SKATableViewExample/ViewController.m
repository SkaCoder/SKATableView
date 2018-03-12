//
//  ViewController.m
//  SKATableViewExample
//
//  Created by Alok Singh on 12/03/18.
//  Copyright © 2018 Alok Singh. All rights reserved.
//

#import "ViewController.h"
#import "SKATableView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    nameArray=[[NSArray alloc]initWithObjects:@"Sachin",@"Abhi",@"Avinash",@"Rahul",@"Pratham",@"Sanjay",@"china",@"India",@"Malvan",@"Japan",@"Srilanka",@"Maharastra",@"Bihar",@"UP",@"Delhi",@"Mumbai",@"Pune",@"Nashik",@"Nagpur", nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btnShowPickerClick:(id)sender {
    
    SKATableView *objYHCPickerView = [[SKATableView alloc] initWithFrame:CGRectMake(112, 186, 200, 350) withNSArray:nameArray andHeadingText:@"Select Name"];
    
    objYHCPickerView.delegate = self;
    
    CGRect newFrame = objYHCPickerView.frame;
    
    objYHCPickerView.passRect=newFrame;
    
    [objYHCPickerView showTableView];
    
    [self.view addSubview:objYHCPickerView];
    
}

-(void)didSelectItem:(NSString *)item{
    main_label.text=item;
    NSLog(@"%@",item);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
