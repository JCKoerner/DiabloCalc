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
@synthesize hud;
@synthesize classView;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setTitle:@"Choose Class"];
    [self setLabelFonts];
    [self.mainScrollView setContentSize:(CGSizeMake(self.mainScrollView.frame.size.width, 461))];
    [self.mainScrollView setClipsToBounds:YES];
    self.classView = [[ClassViewController alloc] initWithCharacterClass:1];
    
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
    [chooseClassLabel setFont:[UIFont fontWithName:@"ExocetLight" size:19.0]];
}



- (void)dismissHUD:(id)arg{
    
    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
    hud = nil;
    
}




//- (void)hudWasHidden {
//    // Remove HUD from screen 
//    [hud removeFromSuperview];
//    
//    // add here the code you may need
//    
//}






#pragma mark ViewController Logic

//-(void)initializeClassViewController:(NSNumber *)number {
//
//    ClassViewController *classViewController = [[ClassViewController alloc] initWithCharacterClass:[number intValue]];      
//
//    //[self performSelector:@selector(pushClassViewController:) withObject:classViewController];
//    [self performSelectorOnMainThread:@selector(pushClassViewController:) withObject:classViewController waitUntilDone:NO];
//  
//}
//
//
//-(IBAction)callPushClassViewController:(id)sender {
//    hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
//    //self.hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
//    
//    hud.delegate = self;
//    hud.labelText = NSLocalizedString(@"Loading Skills", nil);
//    hud.detailsLabelText = NSLocalizedString(@"Please Wait", nil);
//    [self.navigationController.view addSubview:hud];
//    //[self.view.window addSubview:hud];
//    [NSThread detachNewThreadSelector:@selector(initializeClassViewController:) toTarget:self withObject:[NSNumber numberWithInt:[sender tag]]];
//    //[hud showWhileExecuting:@selector(initializeClassViewController:) onTarget:self withObject:[NSNumber numberWithInt:[sender tag]] animated:YES];
//}
//
//
//
//-(void)pushClassViewController:(ClassViewController *)vc {
//
//        //NSLog(@"char %@", classViewController.characterClass);
//    [self.navigationController pushViewController:vc animated:YES];
//
//    //[self dismissHUD:nil];
//}


-(void)pushVC:(NSNumber *)tag {
    ClassViewController *classViewController = [[ClassViewController alloc] initWithCharacterClass:[tag intValue]];
    [self.navigationController pushViewController:classViewController animated:YES];
    [self dismissHUD:nil];
}


-(IBAction)pushViewControllerForClass:(id)sender {
    //hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    self.hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.dimBackground = YES;
    hud.delegate = self;
    hud.labelText = NSLocalizedString(@"Loading Calculator", nil);
    hud.detailsLabelText = NSLocalizedString(@"Please Wait", nil);
   // [self.navigationController.view addSubview:hud];
    [self performSelector:@selector(pushVC:) withObject:[NSNumber numberWithInt:[sender tag]] afterDelay:0];

    
}


@end
