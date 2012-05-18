//
//  ViewController.h
//  DiabloCalc
//
//  Created by John Koerner on 5/9/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassViewController.h"
#import "MBProgressHUD.h"
@interface ViewController : UIViewController <MBProgressHUDDelegate>{
    MBProgressHUD *hud;
    ClassViewController *classView;
}



-(void)setLabelFonts;

- (void)dismissHUD:(id)arg;
//-(IBAction)callPushClassViewController:(id)sender;
//-(void)initializeClassViewController:(NSNumber *)number;

//-(void)pushClassViewController:(ClassViewController *)classViewController;

-(IBAction)pushViewControllerForClass:(id)sender;

@property(nonatomic, retain) ClassViewController *classView;
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;

@property (weak, nonatomic) IBOutlet UILabel *chooseClassLabel;

@property (weak, nonatomic) IBOutlet UILabel *barbLabel;
@property (weak, nonatomic) IBOutlet UILabel *dhLabel;
@property (weak, nonatomic) IBOutlet UILabel *monkLabel;
@property (weak, nonatomic) IBOutlet UILabel *wdLabel;
@property (weak, nonatomic) IBOutlet UILabel *wizLabel;
@property (retain) MBProgressHUD *hud;









@end
