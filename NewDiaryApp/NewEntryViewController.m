//
//  NewEntryViewController.m
//  NewDiaryApp
//
//  Created by ricardo antonio cacho on 2015-07-19.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import "NewEntryViewController.h"
#import "CoreDataStack.h"
#import "DiaryEntry.h"

@interface NewEntryViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *diaryTextField;

@end

@implementation NewEntryViewController


- (void)insertNewDiaryEntry {
    CoreDataStack *aCoreDataStack = [CoreDataStack defaultStack];
    DiaryEntry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"DiaryEntry" inManagedObjectContext:
                        aCoreDataStack.managedObjectContext];
    entry.entry = self.diaryTextField.text;
    entry.date = [[NSDate date] timeIntervalSince1970];
    [aCoreDataStack saveContext];
}

#pragma mark - IBActions

- (IBAction)cancelWasPressed:(UIBarButtonItem *)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (IBAction)doneWasPressed:(UIBarButtonItem *)sender {
    [self insertNewDiaryEntry];
    [self.navigationController popToRootViewControllerAnimated:NO];
}

#pragma mark - Text Field 

- (void)textFieldDidEndEditing:(UITextField *)textField {
    //
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [self.diaryTextField resignFirstResponder];
}


@end
