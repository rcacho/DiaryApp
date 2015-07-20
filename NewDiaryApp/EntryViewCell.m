//
//  EntryViewCell.m
//  NewDiaryApp
//
//  Created by ricardo antonio cacho on 2015-07-19.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import "EntryViewCell.h"

@interface  EntryViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *entryContentLabel;

@end

@implementation EntryViewCell


- (void)setEntry:(DiaryEntry *)entry {
    _entry = entry;
    [self setContent];
}

- (void)setContent {
    self.entryContentLabel.text = self.entry.entry;
}

@end
