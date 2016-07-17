//
//  ViewController.m
//  ADB Date Changer
//
//  Created by Vitaliy on 5/6/16.
//  Copyright © 2016 vitovalov. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController


- (IBAction)onCalend:(NSDatePicker *)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMdd.HHmmss"];
    
    NSDate *vas = [_calendar dateValue];
    
    NSString *formattedDate = [dateFormatter stringFromDate:vas];
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"adb" ofType:@""];
    //NSURL *resourcesUrl = [NSURL fileURLWithPath:filePath];

    NSString *greeting = [[NSString alloc] initWithFormat:@"\"%@\"",filePath];
    NSString *a = [[NSString alloc] initWithFormat:@" -e shell \'su 0 date -s %@",formattedDate];
    NSString *b = [a stringByAppendingString:@"\'"];
                   
    NSString * dos = [greeting stringByAppendingString:b];
    
    /*
    int pid = [[NSProcessInfo processInfo] processIdentifier];
    NSPipe *pipe = [NSPipe pipe];
    NSFileHandle *file = pipe.fileHandleForReading;
    
    NSTask *task = [[NSTask alloc] init];
    task.launchPath = @"/bin/sh";
    task.arguments = @[@"-c",dos];
    task.standardOutput = pipe;
    
    [task launch];
    
    NSData *data = [file readDataToEndOfFile];
    [file closeFile];
    
    NSString *output = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    NSLog (@"adb returned:\n%@", output);
*/
    
    NSString *output = [self runCommand:dos];
}

- (NSString *)runCommand:(NSString *)commandToRun
{
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/bin/sh"];
    
    NSArray *arguments = [NSArray arrayWithObjects:
                          @"-c" ,
                          [NSString stringWithFormat:@"%@", commandToRun],
                          nil];
    NSLog(@"run command:%@", commandToRun);
    [task setArguments:arguments];
    
    NSPipe *pipe = [NSPipe pipe];
    [task setStandardOutput:pipe];
    
    NSFileHandle *file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data = [file readDataToEndOfFile];
    
    NSString *output = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return output;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

@end
