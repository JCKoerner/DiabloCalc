//
//  ClassViewController.h
//  DiabloCalc
//
//  Created by John Koerner on 5/9/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpellPageView.h"
@interface ClassViewController : UIViewController <UIScrollViewDelegate, SpellPageViewDelegate>{
    int characterClass;
    NSDictionary *classDict;
    BOOL pageControlBeingUsed;
    NSMutableArray *spellPageViewsArray;
}


-(id)initWithCharacterClass:(int)classInt;
-(NSString *)classNameForInt:(int)classInt;


-(IBAction)showPopup:(id)sender;

-(void)styleUIElements;
-(void)loadClassData;
-(void)loadPopupViews;
-(IBAction)removePopup:(id)sender;
-(IBAction)changePage:(id)sender;

-(IBAction)updateLabelText:(id)sender;



@property (assign) int characterClass;
@property (retain, nonatomic) NSDictionary *classDict;
@property (retain, nonatomic) NSMutableArray *spellPageViewsArray;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UILabel *requiredLevelLabel;
@property (weak, nonatomic) IBOutlet UILabel *requiredLevelIntLabel;
@property (weak, nonatomic) IBOutlet UIImageView *classCrestImage;

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;






//page control
@property (strong, nonatomic) IBOutlet UIView *popupView;
@property (retain, nonatomic) IBOutlet UIScrollView *pageControlScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *popupPageControl;
@property (strong, nonatomic) IBOutlet UIView *skillPageView;



@end
