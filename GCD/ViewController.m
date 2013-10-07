//
//  ViewController.m
//  GCD
//
//  Created by Misato Tina Alexandre on 10/7/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
 dispatch_queue_t myQueue;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    self.resutLabel.text=@"Please wait while we pick a number!";

    //create a queue
   myQueue=dispatch_queue_create("com.misato.gcd", NULL);
    //run longRunningOperation in the new queue.
    dispatch_async(myQueue, ^{[self longRunningOperation];});
}

-(void)longRunningOperation{
    
    
    [NSThread sleepForTimeInterval:5];
    //Update the view element in the main queue.
    dispatch_async(dispatch_get_main_queue(), ^{[self.resutLabel setText:[NSString stringWithFormat:@"Results: %d", arc4random()]];});
    
}
@end
