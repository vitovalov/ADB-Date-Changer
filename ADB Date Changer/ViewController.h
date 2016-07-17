//
//  ViewController.h
//  ADB Date Changer
//
//  Created by Vitaliy on 5/6/16.
//  Copyright © 2016 vitovalov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

- (NSString *)runCommand:(NSString *)commandToRun;

@property (unsafe_unretained) IBOutlet NSDatePickerCell *calendar;
@property (weak) IBOutlet NSTextFieldCell *authorLabel;


@end

