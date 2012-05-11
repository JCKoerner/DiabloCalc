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
    [self.mainScrollView setContentSize:(CGSizeMake(self.mainScrollView.frame.size.width, 600))];
    [self.mainScrollView setClipsToBounds:YES];
    [self.mainScrollView setContentOffset:CGPointMake(0, 120) animated:YES];
    [self styleUIElements];
    [self loadClassData];
    [self loadPopupViews];
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


#pragma mark Calculator logic

-(IBAction)updateLabelText:(id)sender {
   
    SpellPageView *temp = [spellPageViewsArray objectAtIndex:0];
    [temp.topLabel setText:@"test123"];
}


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
        page.tag = i+1;
        page.frame = CGRectMake(self.pageControlScrollView.frame.size.width*i, 0, page.frame.size.width, page.frame.size.height);
        
        [self.pageControlScrollView addSubview:page];
        [self.spellPageViewsArray addObject:page];
    }
    
    [self.pageControlScrollView setContentSize:CGSizeMake(self.pageControlScrollView.frame.size.width*[self.popupPageControl numberOfPages], self.pageControlScrollView.frame.size.height-1)];
    [self.pageControlScrollView setClipsToBounds:YES];
    

     
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
