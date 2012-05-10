//
//  ClassViewController.m
//  DiabloCalc
//
//  Created by John Koerner on 5/9/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import "ClassViewController.h"

@interface ClassViewController ()

@end

@implementation ClassViewController
@synthesize descriptionTextView;
@synthesize requiredLevelLabel;
@synthesize requiredLevelIntLabel;
@synthesize classCrestImage;
@synthesize mainScrollView;
@synthesize characterClass;

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
    [self.mainScrollView setContentSize:(CGSizeMake(self.mainScrollView.frame.size.width, 600))];
    [self.mainScrollView setClipsToBounds:YES];
    [self.mainScrollView setContentOffset:CGPointMake(0, 120) animated:YES];
    [self styleUIElements];
    [self loadClassData];
}

- (void)viewDidUnload
{
    [self setMainScrollView:nil];
    [self setDescriptionTextView:nil];
    [self setRequiredLevelLabel:nil];
    [self setRequiredLevelIntLabel:nil];
    [self setClassCrestImage:nil];
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
    switch (self.characterClass) {
        case 1: {
            //barbarian data
            [classCrestImage setImage:[UIImage imageNamed:@"barbClassCrest"]];
            break;
        }
        case 2: {
            //demon hunter data
            [classCrestImage setImage:[UIImage imageNamed:@"dhClassCrest"]];
            break;
        }
        case 3: {
            //monk data
            [classCrestImage setImage:[UIImage imageNamed:@"monkClassCrest"]];
            break;
        }
        case 4: {
            //witch doctor data
            [classCrestImage setImage:[UIImage imageNamed:@"wdClassCrest"]];
            break;
        }
        case 5: {
             //wizard data
            [classCrestImage setImage:[UIImage imageNamed:@"wizardClassCrest"]];
            break;
        }
            
        default: {
        
            break;
        }
            
    }
}


@end
