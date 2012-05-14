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




@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property(nonatomic, retain)IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UILabel *unlockedLabel;
@property (weak, nonatomic) IBOutlet UITextView *runeDescription;
@property (weak, nonatomic) IBOutlet UIImageView *runeImageView;
@end
