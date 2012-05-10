//
//  ViewController.h
//  DiabloCalc
//
//  Created by John Koerner on 5/9/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassViewController.h"
@interface ViewController : UIViewController {
   
}


@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;

@property (weak, nonatomic) IBOutlet UILabel *chooseClassLabel;

@property (weak, nonatomic) IBOutlet UILabel *barbLabel;
@property (weak, nonatomic) IBOutlet UILabel *dhLabel;
@property (weak, nonatomic) IBOutlet UILabel *monkLabel;
@property (weak, nonatomic) IBOutlet UILabel *wdLabel;
@property (weak, nonatomic) IBOutlet UILabel *wizLabel;








-(void)setLabelFonts;
-(IBAction)pushClassViewController:(id)sender;

@end
