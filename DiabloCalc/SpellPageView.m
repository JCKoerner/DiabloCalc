//
//  SpellPageView.m
//  DiabloCalc
//
//  Created by John Koerner on 5/10/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import "SpellPageView.h"

@implementation SpellPageView
@synthesize view;
//@synthesize delegate;
@synthesize delegate = _delegate;
@synthesize topLabel, topDescription;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addSubview:[[[NSBundle mainBundle] loadNibNamed:@"spellPageView" owner:self options:nil] objectAtIndex:0]];
        //[self addSubview:self.view];

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




#pragma mark Interface logic

-(IBAction)buttonWasPressed:(id)sender {
    [delegate buttonPressed:[sender tag]];
    
  
}

@end
