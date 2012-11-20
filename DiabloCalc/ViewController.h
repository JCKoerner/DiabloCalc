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
@property (retain, nonatomic) IBOutlet UIScrollView *mainScrollView;

@property (retain, nonatomic) IBOutlet UILabel *chooseClassLabel;

@property (retain, nonatomic) IBOutlet UILabel *barbLabel;
@property (retain, nonatomic) IBOutlet UILabel *dhLabel;
@property (retain, nonatomic) IBOutlet UILabel *monkLabel;
@property (retain, nonatomic) IBOutlet UILabel *wdLabel;
@property (retain, nonatomic) IBOutlet UILabel *wizLabel;
@property (retain) MBProgressHUD *hud;









@end
