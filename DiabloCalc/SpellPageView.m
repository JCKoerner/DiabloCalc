//
//  SpellPageView.m
//  DiabloCalc
//
//  Created by John Koerner on 5/10/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import "SpellPageView.h"

@implementation SpellPageView
@synthesize skillRunesLabel;
@synthesize runesPlaceholderLabel;
@synthesize runeTableView;
@synthesize runeTableViewCells;
@synthesize specialLabel;
@synthesize cooldownLabel;
@synthesize unlockedLabel;
@synthesize view;
//@synthesize delegate;
@synthesize activeSpellTitle;
@synthesize skillButton1;
@synthesize skillButton2;
@synthesize skillButton3;
@synthesize skillButton4;
@synthesize delegate = _delegate;
@synthesize topLabel, topDescription;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addSubview:[[[NSBundle mainBundle] loadNibNamed:@"spellPageView" owner:self options:nil] objectAtIndex:0]];
        //[self addSubview:self.view];
        [self.runeTableView setSeparatorColor:[UIColor colorWithRed:.1 green:0 blue:0 alpha:.09]];
        [self.runeTableView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.05]];
        //[self.runeTableView.layer setBackgroundColor:[UIColor clearColor].CGColor];
        //[self.runeTableView setRowHeight:65];
        self.runeTableViewCells = [[NSMutableArray alloc] initWithCapacity:6];
        for (int i=0; i<6; i++) {
            RuneTableViewCell *cell = [[RuneTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            if(i==0) {
                [cell.textLabel setText:@"None"];
                [cell.unlockedLabel setText:@"Use skill without rune."];
                [cell.runeDescription setText:@""];
                [cell.runeImageView setImage:[UIImage imageNamed:@"runeNone"]];
                
            }

            [self.runeTableViewCells addObject:cell];
            
        }
        self.runeTableView.layer.cornerRadius = 5;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/





- (void) awakeFromNib
{
    [super awakeFromNib];
    
    [[NSBundle mainBundle] loadNibNamed:@"spellPageView" owner:self options:nil];
    [self addSubview:self.view];
}

#pragma mark tableview Delegate methods
-(int)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}
-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
	
    
    RuneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[RuneTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//        UIView *bgColorView = [[UIView alloc] init];
//        [bgColorView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.1]];
//        [cell setSelectedBackgroundView:bgColorView];
        //cell = [runeTableViewCells objectAtIndex:indexPath.row];
        
    } 
   // [cell.textLabel setText:@"test"];
    
    
    RuneTableViewCell *storedCell = [runeTableViewCells objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithString:[storedCell.textLabel text]];
    cell.unlockedLabel.text = [NSString stringWithString:[storedCell.unlockedLabel text]];
    cell.runeDescription.text = [NSString stringWithString:[storedCell.runeDescription text]];
    cell.runeImageView.image = storedCell.runeImageView.image;
   // [cell.textLabel setText:[[[runeTableViewCells objectAtIndex:indexPath.row] textLabel] text]];

    
	return cell;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        return 40;
    } else {
        RuneTableViewCell *cell = [self.runeTableViewCells objectAtIndex:indexPath.row];
       // NSLog(@"height %f", (10+cell.runeDescription.contentSize.height));
        return (10 + cell.runeDescription.contentSize.height);
    }
}

#pragma mark Interface logic

-(IBAction)buttonWasPressed:(id)sender {
    [self.delegate buttonPressed:[sender tag] inSuperview:[[sender superview] tag]];
    //NSLog(@"%@, %d %d", sender, [sender tag], [[sender superview] tag]);
  
  
}

@end
