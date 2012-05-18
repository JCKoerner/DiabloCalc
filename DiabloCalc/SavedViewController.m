//
//  SavedViewController.m
//  DiabloCalc
//
//  Created by John Koerner on 5/16/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import "SavedViewController.h"

@interface SavedViewController ()

@end

@implementation SavedViewController
@synthesize saveTableView;
@synthesize buildsDictionary;
@synthesize nonEmptySectionArray;
@synthesize hud;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        [self setTitle:@"Saved Builds"];
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
//        [label setBackgroundColor:[UIColor clearColor]];
//        [label setFont:[UIFont fontWithName:@"ExocetLight" size:23.0]];
//        [label setShadowColor:[UIColor colorWithWhite:0 alpha:.5]];
//        [label setTextColor:[UIColor colorWithRed:1.0 green:.9098 blue:.6039 alpha:.8]];
//        [label setText:NSLocalizedString(self.title, @"")];
//        [label setAdjustsFontSizeToFitWidth:YES];
//        [self.navigationItem setTitleView:label];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

 
    self.saveTableView.separatorColor = [UIColor colorWithWhite:0 alpha:.1];
    self.saveTableView.layer.backgroundColor = [UIColor clearColor].CGColor;
    self.saveTableView.backgroundColor = [UIColor colorWithWhite:0 alpha:.1];
    
    [self setTitle:@"Saved Builds"];
    
    
    
    
    UIView *viewForTitle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 175, 50)];
    [viewForTitle setBackgroundColor:[UIColor clearColor]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(7, 0, 175, 50)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:@"ExocetLight" size:23.0]];
    [label setShadowColor:[UIColor colorWithWhite:0 alpha:.5]];
    [label setTextColor:[UIColor colorWithRed:1.0 green:.9098 blue:.6039 alpha:.8]];
    [label setText:@"Saved Builds"];
    [label setAdjustsFontSizeToFitWidth:YES];
    [viewForTitle addSubview:label];
    [self.navigationItem setTitleView:viewForTitle];
    
    //[self.editButtonItem setAction:@selector(toggleEdit)];
    
    //UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(toggleEdit)];
    [rightButton setStyle:UIBarButtonItemStylePlain];
    self.navigationItem.rightBarButtonItem = rightButton;
    isEditing = NO;
    [self initializeData];
}

- (void)viewDidUnload
{
    [self setSaveTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void)initializeData {
    self.buildsDictionary = [NSKeyedUnarchiver unarchiveObjectWithFile:[self dataFilePath]];
    self.nonEmptySectionArray = [[NSMutableArray alloc] initWithCapacity:5];
    if(self.buildsDictionary) {
        int count = 0;
        for (NSString *key in [[self.buildsDictionary allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]) {
            int rowCount = [[self.buildsDictionary objectForKey:key] count];
            if(rowCount>0) {
                //non empty array found, add to nonemptysectionarrray
                NSArray *keyArray = [NSArray arrayWithObjects:@"index", @"title", @"rows",@"class", nil];
                NSArray *valueArray = [NSArray arrayWithObjects:[NSNumber numberWithInt: count], [self classNameForInt:[key intValue]], [NSNumber numberWithInt: rowCount], key, nil];
                NSDictionary *sectionDict = [[NSDictionary alloc] initWithObjects:valueArray forKeys:keyArray];
                [self.nonEmptySectionArray addObject:sectionDict];
                count++;
            }
        }
        if (count<1) {
           // NSLog(@"hmm");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You have no saved builds to display" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
//    } else {
//
//    }   
    }
}

#pragma mark delegate methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //NSLog(@"sectioncount %d", [self.nonEmptySectionArray count]);
    return [self.nonEmptySectionArray count];
   // return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self.nonEmptySectionArray objectAtIndex:section] objectForKey:@"rows"] intValue];
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *) indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // remove the row here.
        //[self.saveTableView deleteRowsAtIndexPaths:indexPath.row withRowAnimation:UITableViewRowAnimationFade];
        NSMutableArray *temp = [self.buildsDictionary objectForKey:[[self.nonEmptySectionArray objectAtIndex:indexPath.section] objectForKey:@"class"]];
        [temp removeObjectAtIndex:indexPath.row];
        
        
        NSString *archivePath = [self dataFilePath];
        [NSKeyedArchiver archiveRootObject:self.buildsDictionary toFile:archivePath];
        
        [self initializeData];
        [self.saveTableView reloadData];
    }
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger row = [indexPath row];

	
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                       reuseIdentifier:@"cell"];
       
        
        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.detailTextLabel.backgroundColor = [UIColor clearColor];
        UIView *bgColorView = [[UIView alloc] init];
        [bgColorView.layer setBackgroundColor:[UIColor clearColor].CGColor];
        [bgColorView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.3]];
        [cell setSelectedBackgroundView:bgColorView];
    } 
    
	// fill it with contents
    //self.non
  
 
    
    NSArray *dataArray = [self.buildsDictionary objectForKey:[[self.nonEmptySectionArray objectAtIndex:indexPath.section] objectForKey:@"class"]];
    cell.textLabel.text = [[dataArray objectAtIndex:row] objectForKey:@"title"];
    cell.detailTextLabel.text = [[dataArray objectAtIndex:row] objectForKey:@"timestamp"];
    //NSLog(@"%@", [self.nonEmptySectionArray objectAtIndex:indexPath.section]);
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (isEditing) {
        [self toggleEdit];
    } else {
        NSArray *dataArray = [self.buildsDictionary objectForKey:[[self.nonEmptySectionArray objectAtIndex:indexPath.section] objectForKey:@"class"]];
        NSString *buildString = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"build_string"];
        //NSLog(@"%@", [[self.nonEmptySectionArray objectAtIndex:indexPath.section] objectForKey:@"class"]);
        int classInt = [[[self.nonEmptySectionArray objectAtIndex:indexPath.section] objectForKey:@"class"] intValue];
        
        
        // The hud will dispable all input on the window
        self.hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view.window animated:YES];
        self.hud.tag = 25;
        self.hud.dimBackground = YES;
        //hud.delegate = self;
        self.hud.labelText = NSLocalizedString(@"Loading Build", nil);
        self.hud.detailsLabelText = NSLocalizedString(@"Please Wait", nil);
        // [self.navigationController.view addSubview:hud];

        //[HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
        NSArray *buildArray = [NSArray arrayWithObjects:buildString, [NSNumber numberWithInt:classInt], nil];
        //[HUD showWhileExecuting:@selector(pushVCWithBuildArray:) onTarget:self withObject:buildArray animated:YES];
        
        [self performSelector:@selector(pushVCWithBuildArray:) withObject:buildArray afterDelay:0];
    }
}


-(void)pushVCWithBuildArray:(NSArray *)buildArray {
    UINavigationController *navigationController = self.navigationController;
    
    ClassViewController *vc = [[ClassViewController alloc] initWithCharacterClass:[[buildArray objectAtIndex:1] intValue]]; 
    [vc setBuildString:[buildArray objectAtIndex:0]];
    self.hud.delegate = vc;
    [self dismissHUD:nil];
    [self.hud removeFromSuperview];
    [hud removeFromSuperview];
    [navigationController popToRootViewControllerAnimated:NO];
    [navigationController pushViewController:vc animated:NO];
    

}




-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
        //cell.backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:.5];
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:.04];
   // cell.backgroundColor = [UIColor clearColor];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[self.nonEmptySectionArray objectAtIndex:section] objectForKey:@"title"];
    
}

- (UIView *)tableView:(UITableView *)tbl viewForHeaderInSection:(NSInteger)section
{
    UIView* sectionHead = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tbl.bounds.size.width, 18)];
    sectionHead.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    sectionHead.userInteractionEnabled = YES;
    sectionHead.tag = section;
    
    UIImageView *headerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableViewSectionHeader"]];
    headerImage.contentMode = UIViewContentModeScaleAspectFit;
    
    [sectionHead addSubview:headerImage];
    
    
    UILabel *sectionText = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, tbl.bounds.size.width - 10, 18)];
    
    sectionText.backgroundColor = [UIColor clearColor];
    sectionText.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.85];
    sectionText.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5];
    sectionText.shadowOffset = CGSizeMake(0,1); 
    
    sectionText.font = [UIFont boldSystemFontOfSize:18];
    sectionText.text = [[self.nonEmptySectionArray objectAtIndex:section] objectForKey:@"title"];
    [sectionHead addSubview:sectionText];
   
    
    return sectionHead;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


-(void)toggleEdit {
    if (isEditing) {
        [self.saveTableView setEditing:NO animated:YES];
        isEditing=NO;
        
    }else {
        [self.saveTableView setEditing:YES animated:YES];
        isEditing=YES;
       // [self.navigationItem.rightBarButtonItem
    }
}


- (void)dismissHUD:(id)arg{
    
    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
    hud = nil;
    
}

#pragma mark load/save logic

- (NSString *)dataFilePath {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:@"saved_builds.plist"];
}

#pragma mark misc.

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


@end
