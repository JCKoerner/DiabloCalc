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
    NSMutableArray *activeSpellButtonsArray;
}


-(id)initWithCharacterClass:(int)classInt;
-(NSString *)classNameForInt:(int)classInt;


-(IBAction)showPopup:(id)sender;

-(void)styleUIElements;
-(void)loadClassData;
-(void)loadViewsInitialData;
-(void)setImageForSpellPageViewButton:(SpellPageView *)pageView withTag:(int)tag withImageNamed:(NSString *)imageString;



-(void)loadPopupViews;
-(void)updateActiveSpellDescriptionText:(int)spellIndex forPage:(int)pageIndex;
-(void)updateUITransparenciesForButtonTappedOnPage:(int)pageIndex;

-(void)setInitialUIState;

-(IBAction)removePopup:(id)sender;
-(IBAction)changePage:(id)sender;

//-(void)buttonPressed:(int)tag;


@property (assign) int characterClass;
@property (retain, nonatomic) NSDictionary *classDict;
@property (retain, nonatomic) NSMutableArray *spellPageViewsArray;
@property (retain, nonatomic) NSMutableArray *activeSpellButtonsArray;
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
