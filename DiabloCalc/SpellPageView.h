//
//  SpellPageView.h
//  DiabloCalc
//
//  Created by John Koerner on 5/10/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SpellPageView;
@protocol SpellPageViewDelegate <NSObject>
@optional
-(void)buttonPressed:(int)tag;

@end

@interface SpellPageView : UIView {
    UIView *view;
    UILabel *topLabel;
    UITextView *topDescription;
    
    id <SpellPageViewDelegate> delegate;
}


-(IBAction)buttonWasPressed:(id)sender;


@property (nonatomic, retain) IBOutlet UIView *view;
@property (nonatomic, retain) IBOutlet UILabel *topLabel;
@property (nonatomic, retain) IBOutlet UITextView *topDescription;


@property (nonatomic, assign) id <SpellPageViewDelegate> delegate;
@end
