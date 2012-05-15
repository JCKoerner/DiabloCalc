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
@synthesize characterClass;
@synthesize classDict;
@synthesize spellPageViewsArray;
@synthesize activeSpellButtonsArray;
@synthesize passiveSpellButtonsArray;
@synthesize calculatorModelState;


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
        [label setFont:[UIFont fontWithName:@"ExocetLight" size:25.0]];
        [label setShadowColor:[UIColor colorWithWhite:0 alpha:.5]];
        [label setTextColor:[UIColor colorWithRed:1.0 green:.9098 blue:.6039 alpha:.8]];
        [label setText:NSLocalizedString(self.title, @"")];
        [self.navigationItem setTitleView:label];
        [label sizeToFit];
    }
    return self;
    
}


- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.spellPageViewsArray = [[NSMutableArray alloc] initWithCapacity:6];
    self.activeSpellButtonsArray = [[NSMutableArray alloc] initWithCapacity:25];
    self.passiveSpellButtonsArray = [[NSMutableArray alloc] initWithCapacity:16];
    

    
    [self.mainScrollView setContentSize:(CGSizeMake(self.mainScrollView.frame.size.width, 690))];
    [self.mainScrollView setClipsToBounds:YES];
    [self.mainScrollView setContentOffset:CGPointMake(0, 143) animated:YES];
    [self styleUIElements];
    [self loadPopupViews];
    [self loadPassivePopupView];
    [self loadClassData];
    [self loadActiveViewsInitialData];
    [self loadPassiveViewInitialData];
    [self initializeModel];
    self.selectedButtonTag = 0;
    [self initializeModel];
    [self updateMainUIElements];

    
    
    
    pageControlBeingUsed = NO;
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
    [requiredLevelLabel setAlpha:.9];
    [requiredLevelIntLabel setFont:[UIFont fontWithName:@"ExocetLight" size:15]];
    [requiredLevelIntLabel setAlpha:.9];
    
    
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
          
            [self.calculatorModelState addObject:spell];
            
        }
    } else {
        for (int i = 0; i < 9; i++) {
            ClassSpell *spell = [self.calculatorModelState objectAtIndex:i];
            [spell removeAllValues];
            
        }
    }
}


-(void)updateMainUIElements {
    NSString *emptyText = @"Tap to Choose";
    double emptyAlpha = .65;
    double normalAlpha = .9;
    for (int i = 0; i < 9; i++) {
        ClassSpell *spell = [self.calculatorModelState objectAtIndex:i];
        
        
        switch (i) {
            case 0: {
                [self.activeSpellImage1 setImage:[UIImage imageNamed:[spell icon]]];
                
               
                if ([[spell name] length]<1) {
                    [self.activeSpellLabel1 setTextColor:[UIColor colorWithWhite:.9 alpha:emptyAlpha]];
                    [self.activeSpellLabel1 setText:emptyText];
                } else {
                    [self.activeSpellLabel1 setTextColor:[UIColor colorWithWhite:.9 alpha:normalAlpha]];
                    [self.activeSpellLabel1 setText:[spell name]];
                }
                
                [self.runeImage1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"rune%@", [[spell rune] uppercaseString]  ]]];
                //NSLog(@"rune: %@", [NSString stringWithFormat:@"rune%@", [[spell rune] uppercaseString]]);

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
            }    
            default:
                break;
        }
        
        
    }
    
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
            currentPageIndex++;
            [currentType setString:itemType];
            SpellPageView *newPage = [spellPageViewsArray objectAtIndex:currentPageIndex];
            [[newPage topLabel] setText:[currentType uppercaseString]];
           // [newPage.skillButton1 setBackgroundImage:[UIImage imageNamed:[temp objectForKey:@"icon"]] forState:UIControlStateNormal];
            
            
            buttonCounter = 4*currentPageIndex;
            
        } else {
          
            buttonCounter++;
        }
        [[activeSpellButtonsArray objectAtIndex:buttonCounter] setBackgroundImage:[UIImage imageNamed:[temp objectForKey:@"icon"]] forState:UIControlStateNormal];
        [[activeSpellButtonsArray objectAtIndex:buttonCounter] setTag:skillArrayCounter];
        //NSLog(@"set button %d to : %@", (pageButtonCount+4*currentPageIndex), [temp objectForKey:@"icon"]);

    }
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
    
//    for (int i = 0; i < [passiveSkillArray count]; i++) {
//        
//    }
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
    
}

-(void)tableRowTapped:(int)row{
    //NSLog(@"tapped: %d, spellindex %d", row, self.activeSpellSelectedIndex);
    ClassSpell *spell =  [self.calculatorModelState objectAtIndex:(self.selectedButtonTag-1)];
    if (row ==0) {
        [spell setRune:nil];
        
    } else {
        NSArray *runes = [[[self.classDict objectForKey:@"active-skills"] objectAtIndex:self.activeSpellSelectedIndex] objectForKey:@"runes"];
        [spell setRune:[[runes objectAtIndex:row-1] objectForKey:@"runeClass"]];
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
            
        }
        
        
        
    }
    
    
    
    
    
//    for (int i = 0; i< self.spellPageViewsArray.count; i++) {
//        SpellPageView *page = [self.spellPageViewsArray objectAtIndex:pageIndex];
//        if (i == pageIndex+1) {
//            //  page that was interacted w/, show elements
//            [page.runesPlaceholderLabel setAlpha:0];
//            [page.runeTableView setAlpha:1];
//            [page.specialLabel setAlpha:0];
//            NSLog(@"page %d", i);
//            
//        } else {
//            // non interaction page, hide elements
//            
//            [page.topDescription setText:@"Tap a skill to view its description"];
//            [page.specialLabel setAlpha:0];
//            [page.cooldownLabel setAlpha:0];
//            [page.runeTableView setAlpha:0];
//            [page.runesPlaceholderLabel setAlpha:1];
//        }
//    }
    
    
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

}


-(void)updatePopupViewsForButtonPressed:(int)buttonTag {
    
    
}

-(IBAction)showPopup:(id)sender {
    //set animation for new view
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0;
    transition.type = kCATransitionFade ;
    [self.popupView.layer addAnimation:transition forKey:nil];
    
    [self.mainScrollView addSubview:self.popupView];
    self.selectedButtonTag = [sender tag];
    
    
    
    
    
}

-(IBAction)showPassivePopup:(id)sender {
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0;
    transition.type = kCATransitionFade ;
    [self.passivePopupView.layer addAnimation:transition forKey:nil];
    
    [self.mainScrollView addSubview:self.passivePopupView];
    self.selectedButtonTag = [sender tag];

}


-(IBAction)removePopup:(id)sender {

    [self.popupView removeFromSuperview];
    [self.passivePopupView removeFromSuperview];
    [self updateMainUIElements];
}

@end
