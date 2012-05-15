//
//  ClassSpell.h
//  DiabloCalc
//
//  Created by John Koerner on 5/14/12.
//  Copyright (c) 2012 Etude Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassSpell : NSObject {
    int characterClass;
    int lvlReq;
    NSString *icon;
    NSString *type;
    NSString *category;
    NSString *name;
    NSString *description;
    NSString *rune;
    
}

-(void)removeAllValues;
-(void)resetAllValues;


@property(assign) int characterClass;
@property(assign) int lvlReq;
@property(nonatomic, retain) NSString *icon;
@property(nonatomic, retain) NSString *type;
@property(nonatomic, retain) NSString *category;
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *description;
@property(nonatomic, retain) NSString *rune;


@end
