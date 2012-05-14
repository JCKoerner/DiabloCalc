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
@synthesize descriptionTextView;
@synthesize requiredLevelLabel;
@synthesize requiredLevelIntLabel;
@synthesize classCrestImage;
@synthesize mainScrollView;
@synthesize popupView;
@synthesize pageControlScrollView;
@synthesize popupPageControl;
@synthesize skillPageView;
@synthesize characterClass;
@synthesize classDict;
@synthesize spellPageViewsArray;
@synthesize activeSpellButtonsArray;

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
    [self.mainScrollView setContentSize:(CGSizeMake(self.mainScrollView.frame.size.width, 600))];
    [self.mainScrollView setClipsToBounds:YES];
    [self.mainScrollView setContentOffset:CGPointMake(0, 120) animated:YES];
    [self styleUIElements];
    [self loadPopupViews];
    [self loadClassData];
    [self loadViewsInitialData];
    
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

-(void)loadViewsInitialData {
    
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


-(void)setInitialUIState {
    
    
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

-(void)buttonPressed:(int)tag inSuperview:(int)superViewTag {
    [self updateActiveSpellDescriptionText:tag forPage:superViewTag];
    [self updateUITransparenciesForButtonTappedOnPage:superViewTag];
   // NSLog(@"button tag: %d, superview tag: %d", tag, superViewTag);
    
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
    self.popupView.frame = CGRectMake(38, 130, popupView.frame.size.width, popupView.frame.size.height);
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


-(IBAction)updateSpellDescriptionText:(id)sender {
    NSLog(@"%@, %d", sender, [sender tag]);
}

-(IBAction)showPopup:(id)sender {
    //set animation for new view
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0;
    transition.type = kCATransitionFade ;
    [self.popupView.layer addAnimation:transition forKey:nil];
    
    [self.mainScrollView addSubview:self.popupView];
}

-(IBAction)removePopup:(id)sender {

    [self.popupView removeFromSuperview];
}

@end
