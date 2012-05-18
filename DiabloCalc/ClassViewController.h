//
//  ClassViewController.h
//  DiabloCalc
//
//  Created by John Koerner on 5/9/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpellPageView.h"
#import "ClassSpell.h"
#import "MBProgressHUD.h"
#import "SavedViewController.h"
#define decode_string @"aZbYcXdWeVfUgThSiRjQkPlOmNnMoLpK"

@interface ClassViewController : UIViewController <UIScrollViewDelegate, SpellPageViewDelegate, UIActionSheetDelegate, UIAlertViewDelegate, MBProgressHUDDelegate>{
    int characterClass;
    NSDictionary *classDict;
    BOOL pageControlBeingUsed;
    NSMutableArray *spellPageViewsArray;
    NSMutableArray *activeSpellButtonsArray; 
    NSMutableArray *passiveSpellButtonsArray;

    NSMutableArray *calculatorModelState;
    //IBOutlet UIView *passiveButtonHighlightedCircleView;
    NSMutableDictionary *pageIndexForSpellIndex;
    NSMutableDictionary *buttonIndexForSpellIndex;
    int selectedButtonTag;
    int activeSpellSelectedIndex;
    MBProgressHUD *HUD;
    NSString *buildString;
}




-(id)initWithCharacterClass:(int)classInt;
-(NSString *)classNameForInt:(int)classInt;

-(void)showHudWithCheckmark;
-(IBAction)showPopup:(id)sender;
-(IBAction)showPassivePopup:(id)sender;
-(void)styleUIElements;
-(void)loadClassData;
-(void)loadActiveViewsInitialData;
-(void)loadPassiveViewInitialData;
-(void)setImageForSpellPageViewButton:(SpellPageView *)pageView withTag:(int)tag withImageNamed:(NSString *)imageString;

-(void)updatePopupViewsForButtonPressed:(int)buttonTag;

-(void)loadPopupViews;
-(void)loadPassivePopupView;
-(IBAction)passiveSpellButtonPressed:(id)sender;
-(void)updateActiveSpellDescriptionText:(int)spellIndex forPage:(int)pageIndex;
-(void)updateUITransparenciesForButtonTappedOnPage:(int)pageIndex;

-(void)showSettingsPopup;

-(IBAction)removePopup:(id)sender;
-(IBAction)changePage:(id)sender;
-(void)scrollToPage:(int)pageIndex;
-(void)initializeModel;
-(void)updateMainUIElements;
-(void)resetButtonAlphas;


-(IBAction)resetCalculator;


//save load builds


-(void)saveBuildToFileFromNormalEncodedString:(NSString *)normalString withTitle:(NSString *)title;
-(NSMutableDictionary *)loadSavedBuilds;
-(NSString *)dataFilePath;
-(int)decodeIndexForLetter:(NSString *)letter;
-(NSString *)encodeStringForIndex:(int)index;
-(int)spellIndexForCodedLetter:(NSString *)letter;
-(NSString *)codedLetterForSpellIndex:(int)index;

-(NSString *)blizzEncodedStringForDataModel;
-(NSString *)stringWithTrimmedDots:(NSString *)input;
-(NSString *)blizzFullURLStringForDataModel;

-(NSString *)normalEncodedStringForDataModel;

-(void)loadNormalEncodedStringForDataModel:(NSString *)encodedString;
//-(void)loadBlizzEncodedStringForDataMode;

@property (assign) int selectedButtonTag;





@property (nonatomic, retain) NSString *buildString;


// main view
@property (assign) int activeSpellSelectedIndex;
@property (weak, nonatomic) IBOutlet UIImageView *activeSpellImage1;
@property (weak, nonatomic) IBOutlet UIImageView *runeImage1;
@property (weak, nonatomic) IBOutlet UILabel *activeSpellLabel1;
@property (weak, nonatomic) IBOutlet UIImageView *activeSpellImage2;
@property (weak, nonatomic) IBOutlet UILabel *activeSpellLabel2;
@property (weak, nonatomic) IBOutlet UIImageView *runeImage2;
@property (weak, nonatomic) IBOutlet UIImageView *activeSpellImage3;
@property (weak, nonatomic) IBOutlet UILabel *activeSpellLabel3;
@property (weak, nonatomic) IBOutlet UIImageView *runeImage3;
@property (weak, nonatomic) IBOutlet UIImageView *activeSpellImage4;
@property (weak, nonatomic) IBOutlet UILabel *activeSpellLabel4;
@property (weak, nonatomic) IBOutlet UIImageView *runeImage4;
@property (weak, nonatomic) IBOutlet UIImageView *activeSpellImage5;
@property (weak, nonatomic) IBOutlet UILabel *activeSpellLabel5;
@property (weak, nonatomic) IBOutlet UIImageView *runeImage5;
@property (weak, nonatomic) IBOutlet UIImageView *activeSpellImage6;
@property (weak, nonatomic) IBOutlet UILabel *activeSpellLabel6;
@property (weak, nonatomic) IBOutlet UIImageView *runeImage6;
@property (weak, nonatomic) IBOutlet UIImageView *passiveSpellImage1;
@property (weak, nonatomic) IBOutlet UIImageView *passiveSpellImage2;
@property (weak, nonatomic) IBOutlet UIImageView *passiveSpellImage3;
@property (weak, nonatomic) IBOutlet UILabel *passiveSpellLabel1;
@property (weak, nonatomic) IBOutlet UILabel *passiveSpellLabel2;
@property (weak, nonatomic) IBOutlet UILabel *passiveSpellLabel3;






@property (assign) int characterClass;
@property (retain, nonatomic) NSDictionary *classDict;
@property (retain, nonatomic) NSMutableArray *spellPageViewsArray;
@property (retain, nonatomic) NSMutableArray *activeSpellButtonsArray;
@property (retain, nonatomic) NSMutableArray *passiveSpellButtonsArray;
@property (retain, nonatomic) NSMutableArray *calculatorModelState;
@property (retain, nonatomic) NSMutableDictionary *pageIndexForSpellIndex;
@property (retain, nonatomic) NSMutableDictionary *buttonIndexForSpellIndex;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UILabel *requiredLevelLabel;
@property (weak, nonatomic) IBOutlet UILabel *requiredLevelIntLabel;
@property (weak, nonatomic) IBOutlet UIImageView *classCrestImage;

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;



//passive view
@property (weak, nonatomic) IBOutlet UILabel *passiveViewTitle;
@property (weak, nonatomic) IBOutlet UITextView *passiveViewDescription;
@property (weak, nonatomic) IBOutlet UILabel *passiveViewUnlocked;
@property (weak, nonatomic) IBOutlet UILabel *passiveSkillsLabel;
//@property (retain, nonatomic) IBOutlet UIView *passiveButtonHighlightedCircleView;
@property (weak, nonatomic) IBOutlet UIView *passiveButtonHighlightedCircleView;

@property (weak, nonatomic) IBOutlet UIButton *passiveSkillButton1;
@property (weak, nonatomic) IBOutlet UIButton *passiveSkillButton2;
@property (weak, nonatomic) IBOutlet UIButton *passiveSkillButton3;
@property (weak, nonatomic) IBOutlet UIButton *passiveSkillButton4;
@property (weak, nonatomic) IBOutlet UIButton *passiveSkillButton5;
@property (weak, nonatomic) IBOutlet UIButton *passiveSkillButton6;
@property (weak, nonatomic) IBOutlet UIButton *passiveSkillButton7;
@property (weak, nonatomic) IBOutlet UIButton *passiveSkillButton8;
@property (weak, nonatomic) IBOutlet UIButton *passiveSkillButton9;
@property (weak, nonatomic) IBOutlet UIButton *passiveSkillButton10;
@property (weak, nonatomic) IBOutlet UIButton *passiveSkillButton11;
@property (weak, nonatomic) IBOutlet UIButton *passiveSkillButton12;
@property (weak, nonatomic) IBOutlet UIButton *passiveSkillButton13;
@property (weak, nonatomic) IBOutlet UIButton *passiveSkillButton14;
@property (weak, nonatomic) IBOutlet UIButton *passiveSkillButton15;
@property (weak, nonatomic) IBOutlet UIButton *passiveSkillButton16;






//page control
@property (strong, nonatomic) IBOutlet UIView *popupView;
@property (strong, nonatomic) IBOutlet UIView *passivePopupView;
@property (retain, nonatomic) IBOutlet UIScrollView *pageControlScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *popupPageControl;
@property (strong, nonatomic) IBOutlet UIView *skillPageView;



@end
