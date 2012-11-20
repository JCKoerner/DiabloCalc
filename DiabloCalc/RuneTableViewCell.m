//
//  RuneTableViewCell.m
//  DiabloCalc
//
//  Created by John Koerner on 5/12/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import "RuneTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
@implementation RuneTableViewCell

@synthesize textLabel;
@synthesize view;
@synthesize unlockedLabel;
@synthesize runeDescription;
@synthesize runeImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        [self addSubview:[[[NSBundle mainBundle] loadNibNamed:@"RuneTableViewCell" owner:self options:nil] objectAtIndex:0]];
        
        //[self addSubview:self.view];
        
        [self.textLabel setFont:[UIFont fontWithName:@"FanwoodText" size:15.0]];
        
        UIView *bgColorView = [[UIView alloc] init];
        [bgColorView.layer setBackgroundColor:[UIColor clearColor].CGColor];
        [bgColorView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.3]];
        [self setSelectedBackgroundView:bgColorView];
        [self.selectedBackgroundView.layer setCornerRadius:5];
        //[self.selectedBackgroundView.layer
        [self.backgroundView.layer setBackgroundColor:[UIColor clearColor].CGColor];
        
        [self.textLabel setHighlightedTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:.85]];
        [self.textLabel setBackgroundColor:[UIColor clearColor]];
        
        [self.runeDescription setFont:[UIFont fontWithName:@"FanwoodText" size:12.0]];
        [self.runeDescription setTextColor:[UIColor colorWithRed:.1333 green:.0667 blue:.012 alpha:.85]];
        [self.unlockedLabel setHighlightedTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:.9]];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
