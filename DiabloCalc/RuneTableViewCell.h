//
//  RuneTableViewCell.h
//  DiabloCalc
//
//  Created by John Koerner on 5/12/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RuneTableViewCell : UITableViewCell {
    IBOutlet UIView *view;
    
}




@property (retain, nonatomic) IBOutlet UILabel *textLabel;
@property(nonatomic, retain)IBOutlet UIView *view;
@property (retain, nonatomic) IBOutlet UILabel *unlockedLabel;
@property (retain, nonatomic) IBOutlet UITextView *runeDescription;
@property (retain, nonatomic) IBOutlet UIImageView *runeImageView;
@end
