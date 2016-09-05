//
//  AppDelegate.h
//  objc-array-practice
//
//  Created by Flatiron School on 5/31/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
// assigningTeacher:toRooms: that takes in two NSArray arguments, teacherRoster and rooms and returns a NSString.
- (NSString *) assigningTeacher:(NSArray *) teacherRoster toRooms: (NSArray *) rooms;
 
// replacingTeacher:withTeacher: that takes two arguments, one NSArray argument named teacherRoster and one string argument named substitute and returns an NSArray.
- (NSArray *)replacingTeacher:(NSArray *) teacherRoster withTeacher: (NSString *) substitute;
 
// duplicateStudents:student: takes one NSArray argument mathClass and a NSString argument named student and returns an NSUInteger.
- (NSUInteger) duplicateStudents:(NSArray *) mathClass student:(NSString *)studentName;

// signForPrinter: takes one NSArray argument named backwardsPhrase and returns a NSString.
- (NSString *) signForPrinter:(NSArray *) backwardsPhrase;

// removeOpeningAndClosingShifts: takes one NSArray argument named schedule and returns and NSArray.
- (NSArray *) removeOpeningAndClosingShifts:(NSArray *) schedule;


@end
