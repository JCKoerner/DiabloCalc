//
//  ClassViewController.h
//  DiabloCalc
//
//  Created by John Koerner on 5/9/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassViewController : UIViewController {
    int characterClass;
}


-(id)initWithCharacterClass:(int)classInt;
-(NSString *)classNameForInt:(int)classInt;


-(void)styleUIElements;
-(void)loadClassData;

@property (assign) int characterClass;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UILabel *requiredLevelLabel;
@property (weak, nonatomic) IBOutlet UILabel *requiredLevelIntLabel;
@property (weak, nonatomic) IBOutlet UIImageView *classCrestImage;

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;

@end
