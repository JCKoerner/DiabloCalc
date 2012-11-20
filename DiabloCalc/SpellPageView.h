//
//  SpellPageView.h
//  DiabloCalc
//
//  Created by John Koerner on 5/10/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "RuneTableViewCell.h"
@class SpellPageView;
@protocol SpellPageViewDelegate <NSObject>
@required
-(void)buttonPressed:(int)tag inSuperview:(int)superViewTag;
-(void)tableRowTapped:(int)row;
@end

@interface SpellPageView : UIView <UITableViewDelegate, UITableViewDataSource> {
    UIView *view;
    UILabel *topLabel;
    UITextView *topDescription;
    
    
    id <SpellPageViewDelegate> delegate;
    
    UITableView *runeTableView;
    NSMutableArray *runeTableViewCells;
   
}


-(IBAction)buttonWasPressed:(id)sender;



@property (retain, nonatomic) IBOutlet UIView *activeButtonHighlightedSquareView;
@property (nonatomic, retain) IBOutlet UITableView *runeTableView;
@property (nonatomic, retain) NSMutableArray *runeTableViewCells;
@property (nonatomic, retain) IBOutlet UIView *view;
@property (nonatomic, retain) IBOutlet UILabel *topLabel;
@property (retain, nonatomic) IBOutlet UILabel *skillRunesLabel;
@property (retain, nonatomic) IBOutlet UILabel *runesPlaceholderLabel;

@property (retain, nonatomic) IBOutlet UILabel *specialLabel;
@property (retain, nonatomic) IBOutlet UILabel *cooldownLabel;
@property (retain, nonatomic) IBOutlet UILabel *unlockedLabel;
@property (nonatomic, retain) IBOutlet UITextView *topDescription;
@property (retain, nonatomic) IBOutlet UILabel *activeSpellTitle;

@property (retain, nonatomic) IBOutlet UIButton *skillButton1;
@property (retain, nonatomic) IBOutlet UIButton *skillButton2;
@property (retain, nonatomic) IBOutlet UIButton *skillButton3;
@property (retain, nonatomic) IBOutlet UIButton *skillButton4;

@property (nonatomic, assign) id <SpellPageViewDelegate> delegate;
@end
