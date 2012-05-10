//
//  ViewController.m
//  DiabloCalc
//
//  Created by John Koerner on 5/9/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark Load/Unload methods
@synthesize mainScrollView;
@synthesize chooseClassLabel;
@synthesize barbLabel;
@synthesize dhLabel;
@synthesize monkLabel;
@synthesize wdLabel;
@synthesize wizLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setTitle:@"Choose Class"];
    [self setLabelFonts];
    [self.mainScrollView setContentSize:(CGSizeMake(self.mainScrollView.frame.size.width, 461))];
    [self.mainScrollView setClipsToBounds:YES];
    
    
}

- (void)viewDidUnload
{
    [self setBarbLabel:nil];

    [self setDhLabel:nil];
    [self setMonkLabel:nil];
    [self setWdLabel:nil];
    [self setWizLabel:nil];
    [self setChooseClassLabel:nil];
    [self setMainScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark Aesthetics functions

-(void)setLabelFonts {
    // set class labels
    NSString *fontString = [NSString stringWithFormat:@"FanwoodText"];
    float size = 14.0;
    [barbLabel setFont:[UIFont fontWithName:fontString size:size]];
    [dhLabel setFont:[UIFont fontWithName:fontString size:size]];
    [monkLabel setFont:[UIFont fontWithName:fontString size:size]];
    [wdLabel setFont:[UIFont fontWithName:fontString size:size]];
    [wizLabel setFont:[UIFont fontWithName:fontString size:size]]; 
    
    //set choose label
    [chooseClassLabel setFont:[UIFont fontWithName:@"ExocetLight" size:17.0]];
}







#pragma mark ViewController Logic

-(IBAction)pushClassViewController:(id)sender {
    ClassViewController *classViewController;
//    switch ([sender tag]) {
//        case 1: {
//            //NSLog(@"case 1");
//            classViewController = [[ClassViewController alloc] initWithTitle:@"Barbarian"]  ;
//            break;
//        }
//        case 2: {
// 
//            
//            //NSLog(@"case 5");
//            classViewController = [[ClassViewController alloc] initWithTitle:@"Demon Hunter"];
//   
//            break; 
//        }
//        case 3: {
//            
//            //NSLog(@"case 2");
//            classViewController = [[ClassViewController alloc] initWithTitle:@"Monk"];
//            break;  
//            
//
//        }
//        case 4: {
//            //NSLog(@"case 4");
//            classViewController = [[ClassViewController alloc] initWithTitle:@"Witch Doctor"];
//            break;  
//        }
//        case 5: {
//            //NSLog(@"case 3");
//            classViewController = [[ClassViewController alloc] initWithTitle:@"Wizard"];
//            break;  
//        }
//        default:
//            break;
//    }
    classViewController = [[ClassViewController alloc] initWithCharacterClass:[sender tag]];
    if (classViewController) {
        //NSLog(@"char %@", classViewController.characterClass);
        [self.navigationController pushViewController:classViewController animated:YES];
      
    }
    
}

@end
