//
//  SavedViewController.h
//  DiabloCalc
//
//  Created by John Koerner on 5/16/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ClassViewController.h"
#import "MBProgressHUD.h"
@interface SavedViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MBProgressHUDDelegate> {
    NSMutableDictionary *buildsDictionary;
    NSMutableArray *nonEmptySectionArray;
    BOOL isEditing;
    MBProgressHUD *hud;
}


@property (weak, nonatomic) IBOutlet UITableView *saveTableView;
@property (retain, nonatomic) NSMutableDictionary *buildsDictionary;
@property (retain, nonatomic) NSMutableArray *nonEmptySectionArray;
@property (nonatomic, retain) MBProgressHUD *hud;
-(NSString *)dataFilePath;
-(NSString *)classNameForInt:(int)classInt;
-(void)toggleEdit;
-(void)initializeData;
-(void)pushVCWithBuildArray:(NSArray *)buildArray;

- (void)dismissHUD:(id)arg;
@end
