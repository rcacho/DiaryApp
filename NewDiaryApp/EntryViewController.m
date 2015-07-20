//
//  NewEntryViewController.m
//  NewDiaryApp
//
//  Created by ricardo antonio cacho on 2015-07-19.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import "EntryViewController.h"
#import "CoreDataStack.h"
#import "DiaryEntry.h"

@interface EntryViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *diaryTextField;

@end

@implementation EntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.diaryEntry != nil) {
        self.diaryTextField.text = self.diaryEntry.entry;
    }
}

- (void)insertNewDiaryEntry {
    CoreDataStack *aCoreDataStack = [CoreDataStack defaultStack];
    DiaryEntry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"DiaryEntry" inManagedObjectContext:
                        aCoreDataStack.managedObjectContext];
    entry.entry = self.diaryTextField.text;
    entry.date = [[NSDate date] timeIntervalSince1970];
    [aCoreDataStack saveContext];
}

- (void)setDiaryEntry:(DiaryEntry *)diaryEntry {
    _diaryEntry = diaryEntry;
}

#pragma mark - IBActions

- (IBAction)cancelWasPressed:(UIBarButtonItem *)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (void)updateDataEntry {
    self.diaryEntry.entry = self.diaryTextField.text;
    CoreDataStack *theCoreDataStack = [CoreDataStack defaultStack];
    [theCoreDataStack saveContext];
}

- (IBAction)doneWasPressed:(UIBarButtonItem *)sender {
    if (self.diaryEntry != nil) {
        [self updateDataEntry];
    } else {
        [self insertNewDiaryEntry];
    }
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
