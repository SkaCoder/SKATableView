# SKATableView


Tableview with Search Bar


SKATableView


Tableview with Search Bar


###Installation
	
  
  •	import in your project the folder "SKATableView"


###How to use
	
  
  •	in your code import SKATableView.h in both interface(.h) and implementation file(.m)
        
        #import "SKATableView.h"
	
  •	implement delegate in your class
        
        @interface className : UIViewController<SKATableViewDelegate>
	
  •	add delegate methods
         
         -(void)didSelectItem:(NSString *)item; //to select table view cell
	
  
  •	in your code add follow code when you need show the SKATableView
         
  
    SKATableView *objYHCPickerView = [[SKATableView alloc]initWithFrame:CGRectMake(112, 186, 200, 350) withNSArray:nameArray andHeadingText:@"Select Name"];

    objYHCPickerView.delegate = self;

    CGRect newFrame = objYHCPickerView.frame;

    objYHCPickerView.passRect=newFrame;

    [objYHCPickerView showTableView];

    [self.view addSubview:objYHCPickerView];


####feedback?
	
  •	mail: sachinandre06@gmail.com
