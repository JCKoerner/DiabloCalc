//
//  ClassSpell.m
//  DiabloCalc
//
//  Created by John Koerner on 5/14/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import "ClassSpell.h"

@implementation ClassSpell
@synthesize icon, type, category, name, description, rune;
@synthesize characterClass, lvlReq, spellIndex, runeIndex, runeLvlReq;







-(void)removeAllValues {
    self.icon = nil;
    self.type = nil;
    self.category = nil;
    self.name = nil;
    self.description = nil;
    self.rune = nil;
    self.characterClass = 0;
    self.lvlReq = 0;
    self.spellIndex = 0;
    self.runeIndex = 0;
    self.runeLvlReq = 0;
}

-(void)resetAllValues {
    self.icon = nil;
    self.type = nil;
    self.category = nil;
    self.name = @"Tap to choose skill";
    self.description = nil;
    self.rune = nil;
    self.characterClass = 0;
    self.lvlReq = 0;
}


-(NSComparisonResult)compareLvlReq:(id)otherItem {
    if ([self lvlReq] > [otherItem lvlReq]) {
        return NSOrderedDescending;
    } else {
        return NSOrderedAscending;
    }
}





@end
