//
//  AppDelegate.m
//  objc-array-practice
//
//  Created by Flatiron School on 5/31/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISAppDelegate.h"

@interface FISAppDelegate ()

@end

@implementation FISAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSString *teacherGreeting = @"Welcome Ms. Leahey, your classroom is 4.\nWelcome Principle Peskin, your classroom is 8.\nWelcome Mrs. Jacobs, your classroom is 15.\nWelcome Mr. Peterson, your classroom is 16.\nWelcome Mr. Smith, your classroom is 23.\nWelcome Mr. Hurley, your classroom is 42.";
    
    NSArray *teacherRoster = @[@"Ms. Leahey",
                      @"Principle Peskin",
                      @"Mrs. Jacobs",
                      @"Mr. Peterson",
                      @"Mr. Smith",
                      @"Mr. Hurley"];
    
    NSArray *updatedRoster = @[@"Ms. Leahey",
                      @"Principle Peskin",
                      @"Mr. Loftus",
                      @"Mr. Peterson",
                      @"Mr. Smith",
                      @"Mr. Hurley"];
    
    NSString *firstStudent = @"Jen Linley";
    NSString *secondStudent = @"Joey Potter";
    NSString *thirdStudent = @"Dawson Leary";
    
    
    NSArray *rooms = @[@4, @8, @15, @16, @23, @42];
    
    NSArray *mathClass = @[@"Joey Potter",
                  @"Jen Linley",
                  @"Dawson Leary",
                  @"Pacey Witter",
                  @"Jen Linley",
                  @"Jack McPhee",
                  @"Dawson Leary",
                  @"Eve Whitman",
                  @"Madison Blacker",
                  @"Eve Whitman",
                  @"Dawson Leary",
                  @"Andie McPhee",
                  @"Audrey Lidell", ];
    
    NSString *substitute = @"Mr. Loftus";
    
    NSArray *backwardsPhrase = @[@"wildcats!",
                        @"the",
                        @"Not",
                        @"Minutemen!",
                        @"Go"];
    
    NSArray *schedule = @[@"Joey",
                 @"Bodie",
                 @"Joey",
                 @"Bess",
                 @"Bodie",
                 @"Joey"];

    NSString *results1 = [self assigningTeacher:teacherRoster toRooms: rooms];
    NSLog(@"assigningTeacher %@", results1);
    
    NSArray *results2 = [self replacingTeacher:teacherRoster withTeacher:substitute];
    NSLog(@"replacingTeacher %@", results2);
    
    NSUInteger results3 = [self duplicateStudents:mathClass student:firstStudent];
    NSLog(@"duplicateStudents %lu", results3);
    
    NSString *results4 = [self signForPrinter:backwardsPhrase];
    NSLog(@"signForPrinter %@", results4);
    
    NSArray *results5 = [self removeOpeningAndClosingShifts:schedule];
    NSLog(@"removeOpeningAndClosinngShifts %@", results5);
    
    
    return YES;
}
// assigningTeacher:toRooms: should return a string with the teachers name and room assignment in this format "Welcome <#teacher's name>, your classroom is <#room>. each on a new line.
// Welcome Ms. Leahey, your classroom is 4.\n
- (NSString *) assigningTeacher: (NSArray *) teacherRoster toRooms: (NSArray *) rooms{
    NSMutableString *results = [[NSMutableString alloc] init];
    for(NSInteger i = 0; i < [teacherRoster count]; i++){
        [results appendFormat:@"Welcome %@, your classroom is %@.\n", teacherRoster[i], rooms[i]];
    }
    [results setString:[results substringToIndex:[results length]-1]]; //trim last new line
    NSString *results2 = results;
    return results2;
}
// Oh no! Mrs. Jacobs has called out sick. We need an updated teacher roster. replacingTeacher:withTeacher: should return a NSArray with the new list of teachers.
- (NSArray *)replacingTeacher: (NSArray *) teacherRoster withTeacher: (NSString *) substitute{
    NSString *match = @"Mrs. Jacobs";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF != %@", match];
    NSArray *results = [teacherRoster filteredArrayUsingPredicate:predicate];
    NSMutableArray *mResults = [results mutableCopy];
    [mResults addObject:substitute];
    return mResults;
}

// duplicateStudents: should return a NSUInteger count of times a sudent's name appears.
- (NSUInteger) duplicateStudents:(NSArray *) mathClass student:(NSString *)studentName{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF == %@", studentName];
    NSArray *studentFound = [mathClass filteredArrayUsingPredicate:predicate];
    NSInteger results = [studentFound count];
    return results;
}

// signForPrinter: should return a string with the correct phrase. Somehow it was reversed and you need to set it right.
- (NSString *) signForPrinter: (NSArray *) backwardsPhrase{
    NSArray *forwardsPhrase = [[backwardsPhrase reverseObjectEnumerator] allObjects]; // reverse the elements in an array
    NSString *results = [forwardsPhrase componentsJoinedByString:@" "]; // join array elements into a string
    results = [NSString stringWithFormat:@"%@ ", results]; // append a space at the end of the string to pass the test
    return results;
}

// removeOpeningAndClosingShifts:schedule should return the updated schedule array that removes Joey's name from the first and last position.
- (NSArray *) removeOpeningAndClosingShifts: (NSArray *) schedule{
    NSMutableArray *results = [schedule mutableCopy];
    [results removeObjectAtIndex:0];  // remove first item
    [results removeObjectAtIndex:[results count]-1]; // remove last item
    return results;
}

@end