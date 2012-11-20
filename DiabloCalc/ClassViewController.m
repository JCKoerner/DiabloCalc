//
//  ClassViewController.m
//  DiabloCalc
//
//  Created by John Koerner on 5/9/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import "ClassViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ClassViewController ()

@end

@implementation ClassViewController
@synthesize activeSpellSelectedIndex;
@synthesize passiveViewTitle;
@synthesize passiveViewDescription;
@synthesize passiveViewUnlocked;
@synthesize passiveSkillsLabel;
@synthesize passiveButtonHighlightedCircleView;
@synthesize passiveSkillButton1;
@synthesize passiveSkillButton2;
@synthesize passiveSkillButton3;
@synthesize passiveSkillButton4;
@synthesize passiveSkillButton5;
@synthesize passiveSkillButton6;
@synthesize passiveSkillButton7;
@synthesize passiveSkillButton8;
@synthesize passiveSkillButton9;
@synthesize passiveSkillButton10;
@synthesize passiveSkillButton11;
@synthesize passiveSkillButton12;
@synthesize passiveSkillButton13;
@synthesize passiveSkillButton14;
@synthesize passiveSkillButton15;
@synthesize passiveSkillButton16;
@synthesize selectedButtonTag;
@synthesize isInitialized;
//f@synthesize passiveButtonHighlightedCircleView;
@synthesize descriptionTextView;
@synthesize requiredLevelLabel;
@synthesize requiredLevelIntLabel;
@synthesize classCrestImage;
@synthesize mainScrollView;
@synthesize popupView;
@synthesize passivePopupView;
@synthesize pageControlScrollView;
@synthesize popupPageControl;
@synthesize skillPageView;
@synthesize passiveSpellImage1;
@synthesize passiveSpellImage2;
@synthesize passiveSpellImage3;
@synthesize passiveSpellLabel1;
@synthesize passiveSpellLabel2;
@synthesize passiveSpellLabel3;
@synthesize activeSpellImage1;
@synthesize runeImage1;
@synthesize activeSpellLabel1;
@synthesize activeSpellImage2;
@synthesize activeSpellLabel2;
@synthesize runeImage2;
@synthesize activeSpellImage3;
@synthesize activeSpellLabel3;
@synthesize runeImage3;
@synthesize activeSpellImage4;
@synthesize activeSpellLabel4;
@synthesize runeImage4;
@synthesize activeSpellImage5;
@synthesize activeSpellLabel5;
@synthesize runeImage5;
@synthesize activeSpellImage6;
@synthesize activeSpellLabel6;
@synthesize runeImage6;
@synthesize activityIndicator1;
@synthesize activityIndicator2;
@synthesize activityIndicator3;
@synthesize activityIndicator4;
@synthesize activityIndicator5;
@synthesize activityIndicator6;
@synthesize characterClass;
@synthesize classDict;
@synthesize spellPageViewsArray;
@synthesize activeSpellButtonsArray;
@synthesize passiveSpellButtonsArray;
@synthesize calculatorModelState;
@synthesize pageIndexForSpellIndex;
@synthesize buttonIndexForSpellIndex;

@synthesize buildString;
@synthesize alertViewTextField;
#pragma mark Load/Unload Methods
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    
    return self;
}

-(id)initWithCharacterClass:(int)classInt {
    self = [super init];
    if (self) {
        // Custom initialization
        self.title = [self classNameForInt:classInt];
        self.characterClass = classInt;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setFont:[UIFont fontWithName:@"ExocetLight" size:23.0]];
        [label setShadowColor:[UIColor colorWithWhite:0 alpha:.5]];
        [label setTextColor:[UIColor colorWithRed:1.0 green:.9098 blue:.6039 alpha:.8]];
        [label setText:NSLocalizedString(self.title, @"")];
        [label setAdjustsFontSizeToFitWidth:YES];
        [self.navigationItem setTitleView:label];
        
        // add settings button to nav bar
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(showSettingsPopup)];
        [rightButton setStyle:UIBarButtonItemStyleDone];
        //[self.navigationItem.backBarButtonItem setStyle:UIBarButtonItemStyled];
        
        self.navigationItem.rightBarButtonItem = rightButton;
        self.navigationItem.title = @"Back";
        [label sizeToFit];
        self.isInitialized = NO;
    }
    return self;
    
}




-(void)backgroundLoad {
    [self loadPopupViews];
    [self loadPassivePopupView];
    //[self performSelectorInBackground:@selector(loadClassData) withObject:nil];
    [self loadClassData];
    [self loadActiveViewsInitialData];
    [self loadPassiveViewInitialData];
    [self initializeModel];

    
}

-(void)viewDidAppear:(BOOL)animated {
    if (!isInitialized) {
        [self.mainScrollView setContentSize:(CGSizeMake(self.mainScrollView.frame.size.width, 690))];
        [self.mainScrollView setClipsToBounds:YES];
        
        
        

        
        
        [self styleUIElements];
        [self backgroundLoad];
        //[self performSelectorInBackground:@selector(backgroundLoad) withObject:nil];
        
//        [self loadPopupViews];
//        [self loadPassivePopupView];
//        //[self performSelectorInBackground:@selector(loadClassData) withObject:nil];
//        [self loadClassData];
//        [self loadActiveViewsInitialData];
//        [self loadPassiveViewInitialData];
//        [self initializeModel];
        
        
        
        self.selectedButtonTag = 0;
        // [self initializeModel];
        [self updateMainUIElements];
        self.alertViewTextField = [[UITextField alloc] initWithFrame:CGRectMake(12, 45, 260, 25)];
        [self.alertViewTextField setBackgroundColor:[UIColor colorWithWhite:1 alpha:.8]];
        
        alertViewTextField.borderStyle = UITextBorderStyleBezel;
        
        alertViewTextField.textColor = [UIColor blackColor];
        
        alertViewTextField.textAlignment = UITextAlignmentCenter;
        
        alertViewTextField.font = [UIFont systemFontOfSize:14.0];
        
        alertViewTextField.placeholder = @"Enter a title for this build";
        
        
        alertViewTextField.backgroundColor = [UIColor whiteColor];
        
        alertViewTextField.autocorrectionType = UITextAutocorrectionTypeNo; // no auto correction support
        
        alertViewTextField.keyboardType = UIKeyboardTypeEmailAddress; // use the default type input method (entire keyboard)
        
        alertViewTextField.returnKeyType = UIReturnKeyDone;
        
        //alertViewTextField.delegate = self;
        
        alertViewTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        
        
        
        pageControlBeingUsed = NO;
        
        
        if (self.buildString) {
            [self loadNormalEncodedStringForDataModel:buildString];
            [[self.navigationController.view.window viewWithTag:25] removeFromSuperview];
        }

        self.popupView.alpha = 0;
        [self.mainScrollView addSubview:self.popupView];
        [self removePopup:nil];
        
        self.isInitialized = YES;
        
        [self.activityIndicator1 stopAnimating];
        [self.activityIndicator2 stopAnimating];
        [self.activityIndicator3 stopAnimating];
        [self.activityIndicator4 stopAnimating];
        [self.activityIndicator5 stopAnimating];
        [self.activityIndicator6 stopAnimating];
        
    }
    
    
    
    

}


- (void)viewWillAppear:(BOOL)animated {
    if (self.buildString) {
        [self.mainScrollView setContentOffset:CGPointMake(0, 143) animated:NO];
    } else {
        [self.mainScrollView setContentOffset:CGPointMake(0, 143) animated:YES];
    }
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
   // [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.spellPageViewsArray = [[NSMutableArray alloc] initWithCapacity:6];
    self.activeSpellButtonsArray = [[NSMutableArray alloc] initWithCapacity:25];
    self.passiveSpellButtonsArray = [[NSMutableArray alloc] initWithCapacity:16];
    self.pageIndexForSpellIndex = [[NSMutableDictionary alloc] initWithCapacity:24];
    self.buttonIndexForSpellIndex = [[NSMutableDictionary alloc] initWithCapacity:24];
    
    
    
    //[self.overlayView setAlpha:1];
    
    
       
}



- (void)viewDidUnload
{
    [self setMainScrollView:nil];
    [self setDescriptionTextView:nil];
    [self setRequiredLevelLabel:nil];
    [self setRequiredLevelIntLabel:nil];
    [self setClassCrestImage:nil];
    [self setPopupView:nil];
    [self setPageControlScrollView:nil];
    [self setPopupPageControl:nil];
    [self setSkillPageView:nil];
    [self setPassivePopupView:nil];
    [self setPassiveViewTitle:nil];
    [self setPassiveViewDescription:nil];
    [self setPassiveSkillButton1:nil];

    
    [self setPassiveViewUnlocked:nil];
    [self setPassiveSkillButton2:nil];
    [self setPassiveSkillButton3:nil];
    [self setPassiveSkillButton4:nil];
    [self setPassiveSkillButton5:nil];
    [self setPassiveSkillButton6:nil];
    [self setPassiveSkillButton7:nil];
    [self setPassiveSkillButton8:nil];
    [self setPassiveSkillButton9:nil];
    [self setPassiveSkillButton10:nil];
    [self setPassiveSkillButton11:nil];
    [self setPassiveSkillButton12:nil];
    [self setPassiveSkillButton13:nil];
    [self setPassiveSkillButton14:nil];
    [self setPassiveSkillButton15:nil];
    [self setPassiveSkillButton16:nil];
    [self setPassiveSkillsLabel:nil];
    [self setPassiveButtonHighlightedCircleView:nil];
    [self setPassiveSpellImage1:nil];
    [self setPassiveSpellImage2:nil];
    [self setPassiveSpellImage3:nil];
    [self setActiveSpellImage1:nil];
    [self setRuneImage1:nil];
    [self setActiveSpellLabel1:nil];
    [self setActiveSpellImage2:nil];
    [self setActiveSpellLabel2:nil];
    [self setRuneImage2:nil];
    [self setActiveSpellImage3:nil];
    [self setActiveSpellLabel3:nil];
    [self setRuneImage3:nil];
    [self setActiveSpellImage4:nil];
    [self setActiveSpellLabel4:nil];
    [self setRuneImage4:nil];
    [self setActiveSpellImage5:nil];
    [self setActiveSpellLabel5:nil];
    [self setRuneImage5:nil];
    [self setActiveSpellImage6:nil];
    [self setActiveSpellLabel6:nil];
    [self setRuneImage6:nil];
    [self setPassiveSpellLabel1:nil];
    [self setPassiveSpellLabel2:nil];
    [self setPassiveSpellLabel3:nil];
    
    [self setActivityIndicator1:nil];
    [self setActivityIndicator2:nil];
    [self setActivityIndicator3:nil];
    [self setActivityIndicator4:nil];
    [self setActivityIndicator5:nil];
    [self setActivityIndicator6:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}





#pragma mark Aesthetic Customizations

-(void) styleUIElements {
    [descriptionTextView setFont:[UIFont fontWithName:@"FanwoodText" size:13]];
    [requiredLevelLabel setFont:[UIFont fontWithName:@"FanwoodText" size:13]];
    [requiredLevelLabel setAlpha:.7];
    [requiredLevelIntLabel setFont:[UIFont fontWithName:@"ExocetLight" size:15]];
    [requiredLevelIntLabel setAlpha:.7];
    
    
    int fontSize = 14;
    //double alpha = .9;
    
    [self.activeSpellLabel1 setFont:[UIFont fontWithName:@"FanwoodText" size:fontSize]];
    
    //[self.activeSpellLabel1 setAlpha:alpha];
    [self.activeSpellLabel2 setFont:[UIFont fontWithName:@"FanwoodText" size:fontSize]];
   // [self.activeSpellLabel2 setAlpha:alpha];
    [self.activeSpellLabel3 setFont:[UIFont fontWithName:@"FanwoodText" size:fontSize]];
   // [self.activeSpellLabel3 setAlpha:alpha];
    [self.activeSpellLabel4 setFont:[UIFont fontWithName:@"FanwoodText" size:fontSize]];
   // [self.activeSpellLabel4 setAlpha:alpha];
    [self.activeSpellLabel5 setFont:[UIFont fontWithName:@"FanwoodText" size:fontSize]];
   // [self.activeSpellLabel5 setAlpha:alpha];
    [self.activeSpellLabel6 setFont:[UIFont fontWithName:@"FanwoodText" size:fontSize]];
   // [self.activeSpellLabel6 setAlpha:alpha];
    [self.passiveSpellLabel1 setFont:[UIFont fontWithName:@"FanwoodText" size:fontSize]];
  //  [self.passiveSpellLabel1 setAlpha:alpha];
    [self.passiveSpellLabel2 setFont:[UIFont fontWithName:@"FanwoodText" size:fontSize]];
  //  [self.passiveSpellLabel2 setAlpha:alpha];
    [self.passiveSpellLabel3 setFont:[UIFont fontWithName:@"FanwoodText" size:fontSize]];
  //  [self.passiveSpellLabel3 setAlpha:alpha];
    [self.activeSpellLabel1 setShadowColor:[UIColor colorWithWhite:0 alpha:.5]];
    [self.activeSpellLabel2 setShadowColor:[UIColor colorWithWhite:0 alpha:.5]];
    [self.activeSpellLabel3 setShadowColor:[UIColor colorWithWhite:0 alpha:.5]];
    [self.activeSpellLabel4 setShadowColor:[UIColor colorWithWhite:0 alpha:.5]];
    [self.activeSpellLabel5 setShadowColor:[UIColor colorWithWhite:0 alpha:.5]];
    [self.activeSpellLabel6 setShadowColor:[UIColor colorWithWhite:0 alpha:.5]];
    [self.passiveSpellLabel1 setShadowColor:[UIColor colorWithWhite:0 alpha:.5]];
    [self.passiveSpellLabel2 setShadowColor:[UIColor colorWithWhite:0 alpha:.5]];
    [self.passiveSpellLabel3 setShadowColor:[UIColor colorWithWhite:0 alpha:.5]];
}

#pragma mark Class specific customizations

-(NSString *)classNameForInt:(int)classInt {
    switch (classInt) {
        case 1: {
            return @"Barbarian";
            break;
        }
        case 2: {
            return @"Demon Hunter";
            break;
        }
        case 3: {
            return @"Monk";
            break;
        }
        case 4: {
            return @"Witch Doctor";
            break;
        }
        case 5: {
            return @"Wizard";
            break;
        }
            
        default: {
            return @"Unknown";
            break;
        }
            
    }
    return @"Unknown";
}

-(void) loadClassData {
    NSString *file = [[NSBundle mainBundle] pathForResource:@"classData" ofType:@"plist"];
    [self setClassDict:[[[NSDictionary dictionaryWithContentsOfFile:file] objectForKey:@"Root"] objectForKey:[NSString stringWithFormat:@"%d",self.characterClass]]];

    [self.descriptionTextView setText:[self.classDict objectForKey:@"description"]];
    [classCrestImage setImage:[UIImage imageNamed:[self.classDict objectForKey:@"crest"]]];

}

-(void)initializeModel {
    if (!self.calculatorModelState) {
        self.calculatorModelState = [[NSMutableArray alloc] initWithCapacity:9];
        for (int i = 0; i < 9; i++) {
            ClassSpell *spell = [[ClassSpell alloc] init];
            // set passive vs active
            if (i <= 5) {
                [spell setType:@"active"];
            } else {
                [spell setType:@"passive"];
            }
            
            
            [self.calculatorModelState addObject:spell];
                        
        }
    } else {
        for (int i = 0; i < 9; i++) {
            ClassSpell *spell = [self.calculatorModelState objectAtIndex:i];
            [spell removeAllValues];
            if (i <= 5) {
                [spell setType:@"active"];
            } else {
                [spell setType:@"passive"];
            }
        }
    }
}


-(void)updateMainUIElements {
    NSString *emptyText = @"Tap to Choose";
    double emptyAlpha = .65;
    double normalAlpha = .9;
    int lvlReq = 1;
    for (int i = 0; i < 9; i++) {
        ClassSpell *spell = [self.calculatorModelState objectAtIndex:i];
        if ([spell lvlReq] > lvlReq) {
            lvlReq = [spell lvlReq];
        } 
        if ([spell runeLvlReq] > lvlReq) {
            lvlReq = [spell runeLvlReq];
        }
        

        
        switch (i) {
            case 0: {
                [self.activeSpellImage1 setImage:[UIImage imageNamed:[spell icon]]];
                
               
                if ([[spell name] length]<1) {
                    [self.activeSpellLabel1 setTextColor:[UIColor colorWithWhite:.9 alpha:emptyAlpha]];
                    [self.activeSpellLabel1 setText:emptyText];

                } else {
                    // spell is set for this index
                    [self.activeSpellLabel1 setTextColor:[UIColor colorWithWhite:.9 alpha:normalAlpha]];
                    [self.activeSpellLabel1 setText:[spell name]];
                    int buttonIndex = [[self.buttonIndexForSpellIndex objectForKey:[NSString stringWithFormat:@"%d", [spell spellIndex]]] intValue];
                    [[self.activeSpellButtonsArray objectAtIndex:buttonIndex] setEnabled:NO]; 
                   
                }
                
                [self.runeImage1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"rune%@", [[spell rune] uppercaseString]  ]]];
                //NSLog(@"rune: %@, index: %d", [NSString stringWithFormat:@"rune%@", [[spell rune] uppercaseString]], [spell runeIndex]);
                
                
                break;
            }    
            case 1: {
                [self.activeSpellImage2 setImage:[UIImage imageNamed:[spell icon]]];
                if ([[spell name] length]<1) {
                    [self.activeSpellLabel2 setTextColor:[UIColor colorWithWhite:.9 alpha:emptyAlpha]];
                    [self.activeSpellLabel2 setText:emptyText];
                } else {
                    [self.activeSpellLabel2 setTextColor:[UIColor colorWithWhite:.9 alpha:normalAlpha]];
                    [self.activeSpellLabel2 setText:[spell name]];
                    int buttonIndex = [[self.buttonIndexForSpellIndex objectForKey:[NSString stringWithFormat:@"%d", [spell spellIndex]]] intValue];
                    [[self.activeSpellButtonsArray objectAtIndex:buttonIndex] setEnabled:NO]; 
                }
                [self.runeImage2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"rune%@", [[spell rune] uppercaseString]  ]]];
                break;
            }    
            case 2: {
                [self.activeSpellImage3 setImage:[UIImage imageNamed:[spell icon]]];
                if ([[spell name] length]<1) {
                    [self.activeSpellLabel3 setTextColor:[UIColor colorWithWhite:.9 alpha:emptyAlpha]];
                    [self.activeSpellLabel3 setText:emptyText];
                } else {
                    [self.activeSpellLabel3 setTextColor:[UIColor colorWithWhite:.9 alpha:normalAlpha]];
                    [self.activeSpellLabel3 setText:[spell name]];
                    int buttonIndex = [[self.buttonIndexForSpellIndex objectForKey:[NSString stringWithFormat:@"%d", [spell spellIndex]]] intValue];
                    [[self.activeSpellButtonsArray objectAtIndex:buttonIndex] setEnabled:NO]; 
                }                
                [self.runeImage3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"rune%@", [[spell rune] uppercaseString]  ]]];
                break;
            }    
            case 3: {
                [self.activeSpellImage4 setImage:[UIImage imageNamed:[spell icon]]];
                if ([[spell name] length]<1) {
                    [self.activeSpellLabel4 setTextColor:[UIColor colorWithWhite:.9 alpha:emptyAlpha]];
                    [self.activeSpellLabel4 setText:emptyText];
                } else {
                    [self.activeSpellLabel4 setTextColor:[UIColor colorWithWhite:.9 alpha:normalAlpha]];
                    [self.activeSpellLabel4 setText:[spell name]];
                    int buttonIndex = [[self.buttonIndexForSpellIndex objectForKey:[NSString stringWithFormat:@"%d", [spell spellIndex]]] intValue];
                    [[self.activeSpellButtonsArray objectAtIndex:buttonIndex] setEnabled:NO]; 
                }
                
                [self.runeImage4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"rune%@", [[spell rune] uppercaseString]  ]]];
                break;
            }    
            case 4: {
                [self.activeSpellImage5 setImage:[UIImage imageNamed:[spell icon]]];
                if ([[spell name] length]<1) {
                    [self.activeSpellLabel5 setTextColor:[UIColor colorWithWhite:.9 alpha:emptyAlpha]];
                    [self.activeSpellLabel5 setText:emptyText];
                } else {
                    [self.activeSpellLabel5 setTextColor:[UIColor colorWithWhite:.9 alpha:normalAlpha]];
                    [self.activeSpellLabel5 setText:[spell name]];
                    int buttonIndex = [[self.buttonIndexForSpellIndex objectForKey:[NSString stringWithFormat:@"%d", [spell spellIndex]]] intValue];
                    [[self.activeSpellButtonsArray objectAtIndex:buttonIndex] setEnabled:NO]; 
                }
                [self.runeImage5 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"rune%@", [[spell rune] uppercaseString]  ]]];
                break;
            }    
            case 5: {
                [self.activeSpellImage6 setImage:[UIImage imageNamed:[spell icon]]];
                if ([[spell name] length]<1) {
                    [self.activeSpellLabel6 setTextColor:[UIColor colorWithWhite:.9 alpha:emptyAlpha]];
                    [self.activeSpellLabel6 setText:emptyText];
                } else {
                    [self.activeSpellLabel6 setTextColor:[UIColor colorWithWhite:.9 alpha:normalAlpha]];
                    [self.activeSpellLabel6 setText:[spell name]];
                    int buttonIndex = [[self.buttonIndexForSpellIndex objectForKey:[NSString stringWithFormat:@"%d", [spell spellIndex]]] intValue];
                    [[self.activeSpellButtonsArray objectAtIndex:buttonIndex] setEnabled:NO]; 
                }
                [self.runeImage6 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"rune%@", [[spell rune] uppercaseString]  ]]];
                break;
            }    
            case 6: {
                [self.passiveSpellImage1 setImage:[UIImage imageNamed:[spell icon]]];
//                if ([[spell name] length]<1) {
//                    [self.passiveSpellLabel1 setTextColor:[UIColor colorWithWhite:1 alpha:emptyAlpha]];
//                    [self.passiveSpellLabel1 setText:emptyText];
//                } else {
//                    [self.passiveSpellLabel1 setTextColor:[UIColor colorWithWhite:1 alpha:normalAlpha]];
//                    [self.passiveSpellLabel1 setText:[spell name]];
//                }
                
                //[self.passiveSpellLabel1 setText:[spell name]];
                
                if ([[spell name] length] > 0) {
                    UIButton *buttonPressed = [self.passiveSpellButtonsArray objectAtIndex:[spell spellIndex]];
                    [buttonPressed setEnabled:NO];
                }
                break;
            }    
            case 7: {
                [self.passiveSpellImage2 setImage:[UIImage imageNamed:[spell icon]]];
//                if ([[spell name] length]<1) {
//                    [self.passiveSpellLabel2 setTextColor:[UIColor colorWithWhite:1 alpha:emptyAlpha]];
//                    [self.passiveSpellLabel2 setText:emptyText];
//                } else {
//                    [self.passiveSpellLabel2 setTextColor:[UIColor colorWithWhite:1 alpha:normalAlpha]];
//                    [self.passiveSpellLabel2 setText:[spell name]];
//                }
                
                //[self.passiveSpellLabel2 setText:[spell name]];
                if ([[spell name] length] > 0) {
                    UIButton *buttonPressed = [self.passiveSpellButtonsArray objectAtIndex:[spell spellIndex]];
                    [buttonPressed setEnabled:NO];
                }
                break;
            }    
            case 8: {
                [self.passiveSpellImage3 setImage:[UIImage imageNamed:[spell icon]]];
//                if ([[spell name] length]<1) {
//                    [self.passiveSpellLabel3 setTextColor:[UIColor colorWithWhite:1 alpha:emptyAlpha]];
//                    [self.passiveSpellLabel3 setText:emptyText];
//                } else {
//                    [self.passiveSpellLabel3 setTextColor:[UIColor colorWithWhite:1 alpha:normalAlpha]];
//                    [self.passiveSpellLabel3 setText:[spell name]];
//                }
                //[self.passiveSpellLabel3 setText:[spell name]];
                if ([[spell name] length] > 0) {
                    UIButton *buttonPressed = [self.passiveSpellButtonsArray objectAtIndex:[spell spellIndex]];
                    [buttonPressed setEnabled:NO];
                }
                break;
            }    
            default:
                break;
        }
        
        
    }
    
    [self.requiredLevelIntLabel setText:[NSString stringWithFormat:@"%d", lvlReq]];
    
}




-(void)loadActiveViewsInitialData {
    
    NSArray *activeSkillArray = [self.classDict objectForKey:@"active-skills"];
    int currentPageIndex = 0;
    int buttonCounter = -1;
    int skillArrayCounter = -1;
    NSMutableString *currentType = [[NSMutableString alloc] initWithString:@"Primary"];
    for (NSDictionary *temp in activeSkillArray) {
        skillArrayCounter++;
        NSString *itemType = [temp objectForKey:@"type"];
        //check if new page encountered
        if(![[currentType lowercaseString] isEqualToString:[itemType lowercaseString]]) {
            //new page found
            
            currentPageIndex++;
            [currentType setString:itemType];
            SpellPageView *newPage = [spellPageViewsArray objectAtIndex:currentPageIndex];
            [[newPage topLabel] setText:[currentType uppercaseString]];
          
            int newPageIndex = 4*currentPageIndex;
            for (int i = buttonCounter+1; i < newPageIndex; i++) {
                [[activeSpellButtonsArray objectAtIndex:i] setEnabled:NO];
                //[[activeSpellButtonsArray objectAtIndex:i] setAlpha:.5];
            }
            
            
            buttonCounter = newPageIndex;
            
        } else {
          
            buttonCounter++;
        }
        [[activeSpellButtonsArray objectAtIndex:buttonCounter] setBackgroundImage:[UIImage imageNamed:[temp objectForKey:@"icon"]] forState:UIControlStateNormal];
        [[activeSpellButtonsArray objectAtIndex:buttonCounter] setTag:skillArrayCounter];
        [[activeSpellButtonsArray objectAtIndex:buttonCounter] setEnabled:YES];
        //[[activeSpellButtonsArray objectAtIndex:buttonCounter] setAlpha:1];
        
        
        //NSLog(@"set button %d to : %@", (pageButtonCount+4*currentPageIndex), [temp objectForKey:@"icon"]);
        [self.pageIndexForSpellIndex setObject:[NSString stringWithFormat:@"%d",currentPageIndex] forKey:[NSString stringWithFormat:@"%d", skillArrayCounter]];
        [self.buttonIndexForSpellIndex setObject:[NSString stringWithFormat:@"%d", buttonCounter] forKey:[NSString stringWithFormat:@"%d", skillArrayCounter]];
    }
    if (buttonCounter < 23) {
        [[activeSpellButtonsArray objectAtIndex:23] setEnabled:NO];
    }
   // NSLog(@"b counter: %d", buttonCounter);

}

-(void)loadPassiveViewInitialData {
    NSArray *passiveSkillArray = [self.classDict objectForKey:@"passive-skills"];
    
    //NSLog(@"passive count: %d", [self.passiveSpellButtonsArray count]);
    int i = -1;
    for (UIButton *button in self.passiveSpellButtonsArray) {
        i++;
        @try {
            NSDictionary *skillDict = [passiveSkillArray objectAtIndex:i];
            [button setBackgroundImage:[UIImage imageNamed:[skillDict objectForKey:@"icon"]] forState:UIControlStateNormal];
            [button setAlpha:1];
           
        }
        @catch (NSException *exception) {
            [button setAlpha:0];
        }

    }
    
    [self.passiveViewDescription setText:@"\n\n      Tap a skill to view its description"];
    [self.passiveViewTitle setText:@""];
}






//doesn't work....... 
-(void)setImageForSpellPageViewButton:(SpellPageView *)pageView withTag:(int)tag withImageNamed:(NSString *)imageString {
    NSLog(@"called");
    for (UIView *subview in [pageView subviews]) {
        NSLog(@"%d", [subview tag]);
        if ([subview tag]==1 ) {
            NSLog(@"yes");
            [(UIButton *)subview setBackgroundImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
            break;
        }
    }
}



#pragma mark Scrollview delegate methods

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // Update the page when more than 50% of the previous/next page is visible
    if(!pageControlBeingUsed) {
        CGFloat pageWidth = self.pageControlScrollView.frame.size.width;
        int page = floor((self.pageControlScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        self.popupPageControl.currentPage = page;
        
        
    }

}

- (IBAction)changePage:(id)sender {
    // update the scroll view to the appropriate page
    
    CGRect frame;
    frame.origin.x = self.pageControlScrollView.frame.size.width * self.popupPageControl.currentPage;
    frame.origin.y = 0;
    frame.size = self.pageControlScrollView.frame.size;
    [self.pageControlScrollView scrollRectToVisible:frame animated:YES];
    pageControlBeingUsed = YES;
}

- (void)scrollToPage:(int)pageIndex {
    // update the scroll view to the appropriate page
    
    CGRect frame;
    frame.origin.x = self.pageControlScrollView.frame.size.width * pageIndex;
    frame.origin.y = 0;
    frame.size = self.pageControlScrollView.frame.size;
    [self.pageControlScrollView scrollRectToVisible:frame animated:NO];
    [self.popupPageControl setCurrentPage:pageIndex];
    pageControlBeingUsed = YES;
}





- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    pageControlBeingUsed = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlBeingUsed = NO;
}


#pragma mark delegate methods

-(void)buttonPressed:(int)tag inSuperview:(int)superViewTag {
    [self updateActiveSpellDescriptionText:tag forPage:superViewTag];
    [self updateUITransparenciesForButtonTappedOnPage:superViewTag];
    
    [self setActiveSpellSelectedIndex:tag];
    
    
    
   //NSLog(@"button tag: %d, superview tag: %d", tag, superViewTag);
    
    
    //NSLog(@"%@", self.buttonIndexForSpellIndex);
    
}

-(void)tableRowTapped:(int)row{
    //NSLog(@"tapped: %d, spellindex %d", row, self.activeSpellSelectedIndex);
    ClassSpell *spell =  [self.calculatorModelState objectAtIndex:(self.selectedButtonTag-1)];
    [spell setRuneIndex:row];
    if (row ==0) {
        [spell setRune:nil];
        
        
    } else {
        NSArray *runes = [[[self.classDict objectForKey:@"active-skills"] objectAtIndex:self.activeSpellSelectedIndex] objectForKey:@"runes"];
        [spell setRune:[[runes objectAtIndex:row-1] objectForKey:@"runeClass"]];
        [spell setRuneLvlReq:[[[runes objectAtIndex:row-1] objectForKey:@"lvlReq"] intValue]];
    }
    
    [self removePopup:nil];
}


-(void)updateActiveSpellDescriptionText:(int)spellIndex forPage:(int)pageIndex {
    
    // update active spell data
    
    SpellPageView *page = [self.spellPageViewsArray objectAtIndex:pageIndex];
    NSDictionary *selectedSkillDict = [[self.classDict objectForKey:@"active-skills"] objectAtIndex:spellIndex];
    [[page topDescription] setText:[selectedSkillDict objectForKey:@"description"]];
    [[page activeSpellTitle] setText:[selectedSkillDict objectForKey:@"name"]];

    [[page unlockedLabel] setText:[NSString stringWithFormat:@"Unlocked at level %d",  [[selectedSkillDict objectForKey:@"lvlReq"] intValue]]];
    [[page specialLabel] setText:[selectedSkillDict objectForKey:@"special"]];
    [[page specialLabel] setNumberOfLines:0];
    [[page specialLabel] setFrame:CGRectMake(11, 110, 197, 30)];
    [[page specialLabel] sizeToFit];
    
    
    
    //update calculator model objects
    ClassSpell *spell = [self.calculatorModelState objectAtIndex:selectedButtonTag-1];
    [spell setName:[selectedSkillDict objectForKey:@"name"]];
    [spell setIcon:[selectedSkillDict objectForKey:@"icon"]];
    [spell setRune:@""];
    [spell setLvlReq:[[selectedSkillDict objectForKey:@"lvlReq"] intValue]];
    [spell setRuneIndex:0];
    [spell setSpellIndex:spellIndex];
    
    
    //update highlighted view
    //NSLog(@"%@, %d %d", sender, [sender tag], [[sender superview] tag]);
    [page.activeButtonHighlightedSquareView setAlpha:1];
    UIButton *buttonPressed = [self.activeSpellButtonsArray objectAtIndex:[[self.buttonIndexForSpellIndex objectForKey:[NSString stringWithFormat:@"%d",spellIndex]] intValue]];
    CGRect buttonFrame = CGRectMake([buttonPressed frame].origin.x-1, [buttonPressed frame].origin.y-1, page.activeButtonHighlightedSquareView.frame.size.width, page.activeButtonHighlightedSquareView.frame.size.height);
    [page.activeButtonHighlightedSquareView setFrame:buttonFrame];
    
    
    if([[selectedSkillDict objectForKey:@"cooldown"] length]>1 || page.specialLabel.frame.size.height > 22) {
        [[page cooldownLabel] setText:[selectedSkillDict objectForKey:@"cooldown"]];
        [[page cooldownLabel] sizeToFit];
        [[page topDescription] setFrame:CGRectMake(2, 135, 211, 77)];
        
    } else {
        [[page cooldownLabel] setText:[selectedSkillDict objectForKey:@"cooldown"]];
        [[page topDescription] setFrame:CGRectMake(2, 122, 211, 90)];
    }
    
    // update rune cell data
    NSArray *runeArray = [selectedSkillDict objectForKey:@"runes"];
    int counter = 0;
    for (NSDictionary *runeDict in runeArray) {
        counter++;
        RuneTableViewCell *cell = [page.runeTableViewCells objectAtIndex:counter];
        cell.textLabel.text = [runeDict objectForKey:@"name"];
        cell.unlockedLabel.text = [NSString stringWithFormat:@"Unlocked at level %d", [[runeDict objectForKey:@"lvlReq"] intValue]];
        cell.runeDescription.text =[runeDict objectForKey:@"description"];
        NSString *runeImageString = [NSString stringWithFormat:@"rune%@", [[runeDict objectForKey:@"runeClass"] uppercaseString]];
        //NSLog(@"%@", runeImageString);
        cell.runeImageView.image = [UIImage imageNamed:runeImageString];
    }
    [page.runeTableView reloadData];
    
    
}


-(void)updateUITransparenciesForButtonTappedOnPage:(int)pageIndex {
    
    
    //[[[self.spellPageViewsArray objectAtIndex:pageIndex] topDescription] setAlpha:0];
    
    //NSLog(@"pageIndex: %d", pageIndex);
    int i =-1;
    for(SpellPageView *page in self.spellPageViewsArray) {
        i++;
        if (i==pageIndex) {
            // active page, show elements
            page.runesPlaceholderLabel.alpha = 0;
            page.runeTableView.alpha = 1;
            [page.runeTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
            //page.activeButtonHighlightedSquareView.alpha = 1;
            
        } else {
            // non interaction page, reset elements
            page.topDescription.text = @"       Tap a skill to view its description";
            page.activeSpellTitle.text = @"";
            page.unlockedLabel.text = @"";
            page.specialLabel.text = @"";
            page.unlockedLabel.text = @"";
            page.cooldownLabel.text = @"";
            page.runesPlaceholderLabel.alpha = 1;
            page.runeTableView.alpha = 0;
            page.activeButtonHighlightedSquareView.alpha = 0;
            [[page topDescription] setFrame:CGRectMake(2, 122, 211, 90)];
            
        }
        
        
        
    }
    
    
    
}


#pragma mark Calculator logic

-(void)loadPopupViews {
    self.popupView.frame = CGRectMake(38, 152, popupView.frame.size.width, popupView.frame.size.height);
    for (int i = 0; i<6; i++) {
        CGRect frame;
        frame.origin.x = self.pageControlScrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.pageControlScrollView.frame.size;
        
        //UIView *subview = [[UIView alloc] initWithFrame:frame];
        SpellPageView *page = [[SpellPageView alloc] initWithFrame:frame];
        //UIView *subview = [[[NSBundle mainBundle] loadNibNamed:@"spellPageView" owner:self options:nil] objectAtIndex:0];
        [page setDelegate:self];
        page.tag = i;
        page.view.tag = i;
        
        
        //customize ui elements
        [page.topLabel setText:@"PRIMARY"];

        [page.topLabel setTextColor:[UIColor colorWithRed:.4 green:0 blue:0 alpha:.8]];
        [page.skillRunesLabel  setTextColor:[UIColor colorWithRed:.4 green:0 blue:0 alpha:.8]];
        [page.topDescription setFont:[UIFont fontWithName:@"FanwoodText" size:12.0]];
        [page.topDescription setTextColor:[UIColor colorWithRed:.1333 green:.0667 blue:.012 alpha:.85]];
        [page.activeSpellTitle setFont:[UIFont fontWithName:@"FanwoodText" size:16.0]];
        [page.activeSpellTitle setTextColor:[UIColor colorWithRed:.3 green:0 blue:0 alpha:.9]];
        //[page.specialLabel setFont:[UIFont fontWithName:@"FanwoodText" size:11.0]];
        [page.specialLabel setTextColor:[UIColor colorWithRed:.1 green:0 blue:0 alpha:.9]];
        //[page.cooldownLabel setFont:[UIFont fontWithName:@"FanwoodText" size:11.0]];
        [page.cooldownLabel setTextColor:[UIColor colorWithRed:.5 green:0 blue:0 alpha:.8]];
        [page.runesPlaceholderLabel setFont:[UIFont fontWithName:@"FanwoodText" size:12.0]];
        [page.runesPlaceholderLabel setTextColor:[UIColor colorWithRed:.1333 green:.0667 blue:.012 alpha:.85]];
        


        [page.runeTableView setAlpha:0];
        
        page.frame = CGRectMake(self.pageControlScrollView.frame.size.width*i, 0, page.frame.size.width, page.frame.size.height);
        
        [self.pageControlScrollView addSubview:page];
        [self.spellPageViewsArray addObject:page];
        
        
        
        [self.activeSpellButtonsArray addObjectsFromArray:[NSArray arrayWithObjects:page.skillButton1, page.skillButton2, page.skillButton3, page.skillButton4,  nil]];
    }
    
    [self.pageControlScrollView setContentSize:CGSizeMake(self.pageControlScrollView.frame.size.width*[self.popupPageControl numberOfPages], self.pageControlScrollView.frame.size.height-1)];
    [self.pageControlScrollView setClipsToBounds:YES];
    

     
}

-(void)loadPassivePopupView {
    self.passivePopupView.frame = CGRectMake(38, 152, popupView.frame.size.width, popupView.frame.size.height);
    [self.passiveViewTitle setTextColor:[UIColor colorWithRed:.4 green:0 blue:0 alpha:.8]];
    [self.passiveViewDescription setFont:[UIFont fontWithName:@"FanwoodText" size:12.0]];
    [self.passiveViewDescription setTextColor:[UIColor colorWithRed:.1333 green:.0667 blue:.012 alpha:.85]];
    [self.passiveSkillsLabel  setTextColor:[UIColor colorWithRed:.4 green:0 blue:0 alpha:.8]];

   [self.passiveSpellButtonsArray addObjectsFromArray:[NSArray arrayWithObjects:self.passiveSkillButton1, self.passiveSkillButton2, self.passiveSkillButton3, self.passiveSkillButton4, self.passiveSkillButton5, self.passiveSkillButton6, self.passiveSkillButton7, self.passiveSkillButton8, self.passiveSkillButton9, self.passiveSkillButton10, self.passiveSkillButton11, self.passiveSkillButton12, self.passiveSkillButton13, self.passiveSkillButton14, self.passiveSkillButton15, self.passiveSkillButton16, nil]];
    self.passiveButtonHighlightedCircleView.alpha = 0;
    self.passiveButtonHighlightedCircleView.layer.cornerRadius = 22;
    self.passiveButtonHighlightedCircleView.layer.masksToBounds = NO;
    self.passiveButtonHighlightedCircleView.layer.shadowOffset = CGSizeMake(1, 1);
    self.passiveButtonHighlightedCircleView.layer.shadowRadius = 4;
    self.passiveButtonHighlightedCircleView.layer.shadowOpacity = .6;
}


-(IBAction)passiveSpellButtonPressed:(id)sender {
    int tag = [sender tag];
    CGRect senderFrame = [sender frame];
    //UIButton *buttonPressed = [self.passiveSpellButtonsArray objectAtIndex:tag-1];
    self.passiveButtonHighlightedCircleView.alpha = .95;
    [self.passiveButtonHighlightedCircleView setFrame:CGRectMake(senderFrame.origin.x-2, senderFrame.origin.y-2, self.passiveButtonHighlightedCircleView.frame.size.width, self.passiveButtonHighlightedCircleView.frame.size.height)];
    NSDictionary *selectedDict = [[self.classDict objectForKey:@"passive-skills"] objectAtIndex:tag-1];
    [self.passiveViewTitle setText:[selectedDict objectForKey:@"name"]];
    [self.passiveViewUnlocked setText:[NSString stringWithFormat:@"Unlocked at level %d", [[selectedDict objectForKey:@"lvlReq"] intValue]]];
    [self.passiveViewDescription setText:[selectedDict objectForKey:@"description"]];
    
    
    
    ClassSpell *spell = [self.calculatorModelState objectAtIndex:(self.selectedButtonTag-1)];
    [spell setIcon:[selectedDict objectForKey:@"icon"]];
    [spell setName:[selectedDict objectForKey:@"name"]];
    [spell setLvlReq:[[selectedDict objectForKey:@"lvlReq"] intValue]];
    [spell setSpellIndex:(tag-1)];
}


-(void)updatePopupViewsForButtonPressed:(int)buttonTag {
    ClassSpell *spell = [self.calculatorModelState objectAtIndex:(buttonTag-1)];

    NSString *rune = [spell rune];
    int runeIndex = [spell runeIndex];
    if ([spell name] && [[spell name] length]>0) {
        // button is populated set popupviews to display populated data
        
        //check for active/passive
        if ([[spell type] isEqualToString:@"active"]) {
            //active spell used
            //scroll to correct page
            int page = [[self.pageIndexForSpellIndex objectForKey:[NSString stringWithFormat:@"%d", [spell spellIndex]]] intValue];
            [self scrollToPage:page];
            
            //update selected spell text
            [self buttonPressed:[spell spellIndex] inSuperview:page];
            
            //update highlighted rune selection
            [spell setRune:rune];
            [spell setRuneIndex:runeIndex];
            SpellPageView *pageView = [spellPageViewsArray objectAtIndex:page];
            [pageView.runeTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:runeIndex inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
            [pageView.runeTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:runeIndex inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
            
            //re-enable spell button
            int buttonIndex = [[self.buttonIndexForSpellIndex objectForKey:[NSString stringWithFormat:@"%d", [spell spellIndex]]] intValue];
            [[self.activeSpellButtonsArray objectAtIndex:buttonIndex] setEnabled:YES];
            
            
        } else {
            //passive spell used
            //NSLog(@"%d", [spell spellIndex]);
            UIButton *buttonPressed = [self.passiveSpellButtonsArray objectAtIndex:[spell spellIndex]];
            [buttonPressed setEnabled:YES];
            [buttonPressed sendActionsForControlEvents:UIControlEventTouchUpInside];
            
        }
        
        
        
        
        
        
        
    } else {
        //empty button, reset popup views
        
        //reset active popup
        [self updateUITransparenciesForButtonTappedOnPage:-1];
        //reset passive popup
        [self.passiveViewDescription setText:@"\n\n      Tap a skill to view its description"];
        [self.passiveViewTitle setText:@""];
        [self.passiveButtonHighlightedCircleView setAlpha:0];
        [self.passiveViewUnlocked setText:@""];
        
    }
    
}

-(IBAction)showPopup:(id)sender {
    //set animation for new view
//    CATransition *transition = [CATransition animation];
//    transition.duration = 1.0;
//    transition.type = kCATransitionFade ;
//    [self.popupView.layer addAnimation:transition forKey:nil];
    if (sender) {
        [self.mainScrollView addSubview:self.popupView];
        self.selectedButtonTag = [sender tag];
        
        [self updatePopupViewsForButtonPressed:self.selectedButtonTag]; 
        
    } else {
        [self.mainScrollView addSubview:self.popupView];
        self.selectedButtonTag = 0;
        
        [self updatePopupViewsForButtonPressed:1];
        
    }
    
}
    
   
    


-(IBAction)showPassivePopup:(id)sender {
//    CATransition *transition = [CATransition animation];
//    transition.duration = 1.0;
//    transition.type = kCATransitionFade ;
//    [self.passivePopupView.layer addAnimation:transition forKey:nil];
    
    [self.mainScrollView addSubview:self.passivePopupView];
    self.selectedButtonTag = [sender tag];
    [self updatePopupViewsForButtonPressed:[sender tag]];
    //NSLog(@"%d", [self.calculatorModelState count]);

}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self.popupView removeFromSuperview];
    [self.passivePopupView removeFromSuperview];
    //    [UIView commitAnimations];
    
    
    //[self resetButtonAlphas];
    self.popupView.alpha = 1;
    self.passivePopupView.alpha = 1;
    
}

-(IBAction)removePopup:(id)sender {
//   CATransition *transition = [CATransition animation];
//    transition.duration = 1.0;
//    transition.type = kCATransitionFade ;
//    [self.passivePopupView.layer addAnimation:transition forKey:nil];
//    [self.popupView.layer addAnimation:transition forKey:nil];
    
//    [UIView beginAnimations:@"curldown" context:nil];
//    [UIView setAnimationDelegate:self];
//    [UIView setAnimationDuration:.5];
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
    //[self.view removeFromSuperview];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    // set the final position of the bar
    self.popupView.alpha = 0;
    self.passivePopupView.alpha = 0;
    [UIView commitAnimations];
    
//    
//    [self.popupView removeFromSuperview];
//    [self.passivePopupView removeFromSuperview];
////    [UIView commitAnimations];
//
//
//    [self resetButtonAlphas];
//    [self updateMainUIElements];
//    
//    
//    [self.popupView removeFromSuperview];
//    [self.passivePopupView removeFromSuperview];
    [self updateMainUIElements];
    
}

-(void)resetButtonAlphas {
    for (UIButton *button in self.activeSpellButtonsArray) {
        [button setEnabled:YES];
    }
    
    
}

-(IBAction)resetCalculator {
//    for (ClassSpell *spell in self.calculatorModelState) {
//        [spell resetAllValues];
//    }
    [self loadActiveViewsInitialData];
    [self loadPassiveViewInitialData];
    [self initializeModel];
    self.selectedButtonTag = 0;
    //[self initializeModel];
    [self updateMainUIElements];
    for (UIButton *button in self.passiveSpellButtonsArray) {
        [button setEnabled:YES];
    }
   // NSLog(@"index: %d",[self decodeIndexForLetter:@"Z"]);
    //NSLog(@"index: %@",[self encodeStringForIndex:1]);

}



#pragma mark save/load logic

- (NSString *)dataFilePath {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:@"saved_builds.plist"];
}


// takes in encoded model string, loads existing saved data, writes saved data dict
-(void)saveBuildToFileFromNormalEncodedString:(NSString *)normalString withTitle:(NSString *)title {
    
    NSMutableDictionary *saves = [NSKeyedUnarchiver unarchiveObjectWithFile:[self dataFilePath]];
    if (!saves || saves==nil) {
        // no saved builds, initialize new dict     
        NSLog(@"no saves found");
        saves = [[NSMutableDictionary alloc] initWithCapacity:5];
        for (int i = 1; i < 6; i++) {
            NSMutableArray *array = [[NSMutableArray alloc] init];
            NSString *key = [NSString stringWithFormat:@"%d", i];
            [saves setObject:array forKey:key];
        }
    } 
    
    
    NSString *classNumberString = [NSString stringWithFormat:@"%d", self.characterClass];
    NSMutableArray *buildsArray = [saves objectForKey:classNumberString];
    
    //construct new build dictionary
    NSDate *date=[NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    NSString *dateString = [formatter stringFromDate:date];
    
    //NSString *buildString = [self normalEncodedStringForDataModel];
    NSDictionary *buildDict = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:normalString, dateString, title,nil] forKeys:[NSArray arrayWithObjects:@"build_string", @"timestamp", @"title", nil]];
    [buildsArray addObject:buildDict];
    [saves setObject:buildsArray forKey:classNumberString];


    //write back to file
    NSString *archivePath = [self dataFilePath];
   [NSKeyedArchiver archiveRootObject:saves toFile:archivePath];
   
    //save completed, show hud
    [self showHudWithCheckmark];
    
}

-(NSMutableDictionary *)loadSavedBuilds {
    NSMutableDictionary *outDict = [NSKeyedUnarchiver unarchiveObjectWithFile:@"saved_builds.plist"];
    //NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] init
   // NSLog(@"%@",[[NSKeyedUnarchiver unarchiveObjectWithFile:@"saved_builds"] retain] );
    return outDict;
}

-(void)showHudWithCheckmark {

        
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    

    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Checkmark.png"]];
    
    // Set custom view mode
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.dimBackground = YES;
    HUD.delegate = self;
    HUD.labelText = @"Build Saved";
    
    [HUD show:YES];
    [HUD hide:YES afterDelay:2];
    
}



- (void)hudWasHidden:(MBProgressHUD *)hud {
	// Remove HUD from screen when the HUD was hidded
    NSLog(@"called");
	[hud removeFromSuperview];
	//[HUD release];
	hud = nil;
}




#pragma mark action sheet methods
// settings popup action sheet
-(void)showSettingsPopup {
    //UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Select the Desired Operation" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:NSLocalizedString("Save Build", @""),NSLocalizedString("Load Build", @""), nil];
    
        UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Skill Calculator" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Save Build", @"Load Build", nil];
    popup.actionSheetStyle = UIBarStyleBlackTranslucent;
    [popup showInView:self.view];
    
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex==0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Save Build" message:@" " delegate:self cancelButtonTitle:@"Save" otherButtonTitles:@"Cancel",nil];
        //[alert setFrame:CGRectMake(12, 45, 300, 100)];
//        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
//        alert.alertViewStyle = UIBarStyleBlackTranslucent;
//        CGAffineTransform myTransform = CGAffineTransformMakeTranslation(0, 60);
//        [alert setTransform:myTransform];

        [alert addSubview:self.alertViewTextField];
        alert.tag = 1;
        [alert show];
        //NSLog(@"%@", [self normalEncodedStringForDataModel]);
    } else if (buttonIndex==1) {
        // load build tapped
        SavedViewController *savedViewController = [[SavedViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:savedViewController animated:YES];
        
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag==1) {
        if (buttonIndex==0) {
            //NSLog(@"%@", [[alertView textFieldAtIndex:0] text]);
            //NSLog(@"save");
            //[self saveCalculatorStateToFile:self.calculatorModelState];
            //NSLog(@"%@", [self blizzEncodedStringForDataModel]);
            //NSLog(@"%@", [self blizzFullURLStringForDataModel]);
            //NSLog(@"%@", [self normalEncodedStringForDataModel]);
            //NSLog(@"%@",  [self stringWithTrimmedDots:[alertView textFieldAtIndex:0].text]);
            //[self loadNormalEncodedStringForDataModel:[self normalEncodedStringForDataModel]];
            
            //NSString *text = [[alertView textFieldAtIndex:0] text];
            NSString *text = [self.alertViewTextField text];
            if ([text length]>0) {
                [self saveBuildToFileFromNormalEncodedString:[self normalEncodedStringForDataModel] withTitle:text];
                [self.alertViewTextField setText:@""];
            } else {
                UIAlertView *newAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You must include a title to save a build" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                newAlertView.tag = 2;
                
                [newAlertView show];                
                
            }
            
            
        }
    } 

        
}


-(int)decodeIndexForLetter:(NSString *)letter {
    NSString *decodeString = decode_string;
    return [decodeString rangeOfString:letter].location;
    
}

-(NSString *)encodeStringForIndex:(int)index {
    NSString *decodeString = decode_string;
    return [decodeString substringWithRange:NSMakeRange(index, 1)];
}

-(int)spellIndexForCodedLetter:(NSString *)letter {
    NSMutableArray *spellArray = [[NSMutableArray alloc] initWithArray:[self.classDict objectForKey:@"active-skills"]];
    [spellArray sortUsingComparator: 
     ^(id obj1, id obj2) 
     {
         NSNumber* key1 = [obj1 objectForKey: @"lvlReq"];
         NSNumber* key2 = [obj2 objectForKey: @"lvlReq"];

         if([key1 compare:key2]!=NSOrderedSame) {
            // NSLog(@"not same");
            return [key1 compare: key2]; 
         } else {
             //NSLog(@"%@", 1);
             NSString *stringKey1 = [obj1 objectForKey:@"name"];
             NSString *stringKey2 = [obj2 objectForKey:@"name"];
             //NSLog(@"same %@, %@", stringKey1, stringKey2);
             return [stringKey1 caseInsensitiveCompare:stringKey2];
         }
         
     }];
    NSDictionary *item = [spellArray objectAtIndex:[self decodeIndexForLetter:letter]];
    NSString *name = [item objectForKey:@"name"];
    int count = -1;
    for (NSDictionary *dict in [self.classDict objectForKey:@"active-skills"]) {
        count++;
        if ([[dict objectForKey:@"name"] isEqualToString:name]) {
            break;
        }
    }
    return count;
 
}

-(NSString *)codedLetterForSpellIndex:(int)index {
    NSMutableArray *spellArray = [[NSMutableArray alloc] initWithArray:[self.classDict objectForKey:@"active-skills"]];
    [spellArray sortUsingComparator: 
     ^(id obj1, id obj2) 
     {
         NSNumber* key1 = [obj1 objectForKey: @"lvlReq"];
         NSNumber* key2 = [obj2 objectForKey: @"lvlReq"];
         if([key1 compare:key2]!=NSOrderedSame) {
     
             return [key1 compare: key2]; 
         } else {
             NSString *stringKey1 = [obj1 objectForKey:@"name"];
             NSString *stringKey2 = [obj2 objectForKey:@"name"];
             return [stringKey1 caseInsensitiveCompare:stringKey2];
         }
         //return [key1 compare: key2];
     }];

    NSArray *spellModelArray = [self.classDict objectForKey:@"active-skills"];
    NSString *name = [[spellModelArray objectAtIndex:index] objectForKey:@"name"];
    int count = -1;
    for (NSDictionary *dict in spellArray) {
        count++;
        if ([[dict objectForKey:@"name"] isEqualToString:name]) {
            break;
        }
    }
                          
    return [self encodeStringForIndex:count];
    
}



-(NSString *)blizzEncodedStringForDataModel {
    NSMutableArray *activeSpellArray = [[NSMutableArray alloc] initWithCapacity:6];
    NSMutableArray *passiveSpellArray = [[NSMutableArray alloc] initWithCapacity:3];
    NSMutableArray *runeArray = [[NSMutableArray alloc] initWithCapacity:6];
    int counter = 0;
    for (ClassSpell *spell in self.calculatorModelState) {
        counter++;
        if (counter <= 6) {
            // active spells
            NSString *spellLetter;
            NSString *runeLetter;
            if ([[spell name] length] > 0) {
                spellLetter = [self codedLetterForSpellIndex:[spell spellIndex]];
                if ([spell runeIndex]==0) {
                    runeLetter = @".";
                } else {
                    runeLetter = [self encodeStringForIndex:[spell runeIndex]-1];
                }
                
            } else {
                spellLetter = @".";
                runeLetter = @".";
            }
            [activeSpellArray addObject:spellLetter];
            [runeArray addObject:runeLetter];
        } else {
            //passive spells
            NSString *spellLetter;
            if ([[spell name] length] > 0) {
                spellLetter = [self encodeStringForIndex:[spell spellIndex]];
            
            }else {
                spellLetter = @".";
            }
            [passiveSpellArray addObject:spellLetter];
        }
        
    }
    
    
    
    NSString *outString = [NSString stringWithFormat:@"%@!%@!%@",[self stringWithTrimmedDots:[activeSpellArray componentsJoinedByString:@""]], [self stringWithTrimmedDots:[passiveSpellArray componentsJoinedByString:@""]], [self stringWithTrimmedDots:[runeArray componentsJoinedByString:@""]]];
    return outString;
}


-(NSString *)normalEncodedStringForDataModel {
    NSMutableArray *activeSpellArray = [[NSMutableArray alloc] initWithCapacity:6];
    NSMutableArray *passiveSpellArray = [[NSMutableArray alloc] initWithCapacity:3];
    NSMutableArray *runeArray = [[NSMutableArray alloc] initWithCapacity:6];
    int counter = 0;
    for (ClassSpell *spell in self.calculatorModelState) {
        counter++;
        
        if (counter <= 6) {
            // active spells
            if ([[spell name] length] > 0) {
                [activeSpellArray addObject:[NSString stringWithFormat:@"%d", [spell spellIndex]]];
                if ([spell runeIndex]>0) {
                    [runeArray addObject:[NSString stringWithFormat:@"%d", [spell runeIndex]]]; 
                } else {
                    [runeArray addObject:@"."];
                }
                
            } else {
                [activeSpellArray addObject:@"."];
                [runeArray addObject:@"."];
            }

        } else {
            //passive spells
            if ([[spell name] length] > 0) {
                [passiveSpellArray addObject:[NSString stringWithFormat:@"%d", [spell spellIndex]]];
            } else {
                [passiveSpellArray addObject:@"."];
            }
        }
        
    }
    NSString *outString = [NSString stringWithFormat:@"%@!%@!%@", [activeSpellArray componentsJoinedByString:@"-"], [passiveSpellArray componentsJoinedByString:@"-"], [runeArray componentsJoinedByString:@"-"]];    
    return outString;
}

-(void)loadNormalEncodedStringForDataModel:(NSString *)normalString {
    @autoreleasepool {
        [self resetCalculator];
        NSArray *parts = [normalString componentsSeparatedByString:@"!"];
        NSString *activeSpellString = [parts objectAtIndex:0];
        NSString *passiveSpellString = [parts objectAtIndex:1];
        NSString *runeString = [parts objectAtIndex:2];
        NSArray *activeSpellArray = [activeSpellString componentsSeparatedByString:@"-"];
        NSArray *passiveSpellArray = [passiveSpellString componentsSeparatedByString:@"-"];
        NSArray *runeArray = [runeString componentsSeparatedByString:@"-"];
        
        
        
        //loop through active spells
        
        //NSLog(@"%@, %@, %@", activeSpellString, runeString, passiveSpellString);
        
        NSArray *activeArray = [self.classDict objectForKey:@"active-skills"];
        for (int i = 0; i < [activeSpellArray count]; i++) {
            //reset calculator
            
            NSString *activeCharString = [activeSpellArray objectAtIndex:i];
            NSString *runeCharString = [runeArray objectAtIndex:i];
            if (![activeCharString isEqualToString:@"."]) {
                //ignore empty spell slots
                
                ClassSpell *spell = [self.calculatorModelState objectAtIndex:i];
                
                NSDictionary *selectedSpell = [activeArray objectAtIndex:[activeCharString intValue]];
                
                // initialize vars
                int localCharacterClass;
                int lvlReq;
                NSString *icon;
                NSString *type;
                NSString *name;
                NSString *description;

                int spellIndex;
                int runeIndex;
                int runeLvlReq;
                NSString *rune;
                
                //set local vars, one by one
                
                localCharacterClass = self.characterClass;
                lvlReq = [[selectedSpell objectForKey:@"lvlReq"] intValue];
                icon = [selectedSpell objectForKey:@"icon"];
                type = @"active";
                name = [selectedSpell objectForKey:@"name"];
                description = [selectedSpell objectForKey:@"description"];
                spellIndex = [activeCharString intValue];
                
                //update spell
                
                [spell setCharacterClass:localCharacterClass];
                [spell setLvlReq:lvlReq];
                [spell setIcon:icon];
                [spell setType:type];
                [spell setName:name];
                [spell setDescription:description];
                [spell setSpellIndex:spellIndex];
                //NSLog(@"runecharestring: %@\n ", runeCharString );
                // set/update rune data
                if(![runeCharString isEqualToString:@"."] && ![runeCharString intValue]==0) {
                    //ignore empty runes
                    NSArray *selectedSpellRuneArray = [selectedSpell objectForKey:@"runes"];
                    runeIndex = [runeCharString intValue];
                    NSDictionary *runeDict = [selectedSpellRuneArray objectAtIndex:runeIndex-1];
                    runeLvlReq = [[runeDict objectForKey:@"lvlReq"] intValue];
                    rune = [runeDict objectForKey:@"runeClass"];
                    
                    
                    // set data
                    [spell setRune:rune];
                    [spell setRuneIndex:runeIndex];
                    [spell setRuneLvlReq:runeLvlReq];
                
                }
            } 
        }
        //loop through passive spells
        NSArray *passiveArray = [self.classDict objectForKey:@"passive-skills"];
        for (int i = 0; i < [passiveSpellArray count]; i++) {
            NSString *passiveCharString = [passiveSpellArray objectAtIndex:i];
            ClassSpell *spell = [self.calculatorModelState objectAtIndex:(i+6)];
            //ignore empty spells
            if (![passiveCharString isEqualToString:@"."]) {
                
                
                //NSLog(@"%@", spell);
                NSDictionary *spellDict = [passiveArray objectAtIndex:[passiveCharString intValue]];
                [spell setDescription:[spellDict objectForKey:@"description"]];
                [spell setIcon:[spellDict objectForKey:@"icon"]];
                [spell setLvlReq:[[spellDict objectForKey:@"lvlReq"] intValue]];
                [spell setName:[spellDict objectForKey:@"name"]];  
                [spell setType:@"passive"];
                [spell setSpellIndex:[passiveCharString intValue]];
   
            }
        }
    }
    //NSLog(@"loaded");
    //NSLog(@"%@", normalString);
    [self performSelectorOnMainThread:@selector(removePopup:) withObject:nil waitUntilDone:NO];
   // [self performSelectorOnMainThread:@selector(updateMainUIElements) withObject:nil waitUntilDone:NO];
    
}



-(NSString *)blizzFullURLStringForDataModel {
    NSString *urlSuffix = [self blizzEncodedStringForDataModel];
    NSString *urlPrefix = @"http://us.battle.net/d3/en/calculator/";
    NSString *rawClassString = [self classNameForInt:self.characterClass];
    NSArray *parts = [[rawClassString lowercaseString] componentsSeparatedByString:@" "];
    return [NSString stringWithFormat:@"%@%@#%@", urlPrefix, [parts componentsJoinedByString:@"-"], urlSuffix];
}








-(NSString *)stringWithTrimmedDots:(NSString *)input {
    NSString *stripped = [input stringByReplacingOccurrencesOfString:@"." withString:@""];
    if ([stripped length]==0 || [stripped length]==[input length]) {
        // check if string consists only of periods
        return stripped;
    } else {
        NSMutableArray *characterArray = [[NSMutableArray alloc] initWithCapacity:[input length]];
        for (int i = 0; i < [input length]; i++) {
            [characterArray addObject:[input substringWithRange:NSMakeRange(i, 1)]];
        }
        NSArray *reversed = [[characterArray reverseObjectEnumerator] allObjects];
        int count = -1;
        for (NSString *character in reversed) {
            count++;
            if(![character isEqualToString:@"."]) {
                break;
            }
        }
        NSArray *temp = [reversed subarrayWithRange:NSMakeRange(count, [input length]-count)];
        return [[[temp reverseObjectEnumerator] allObjects] componentsJoinedByString:@""];  
        
    }

    
}





@end
