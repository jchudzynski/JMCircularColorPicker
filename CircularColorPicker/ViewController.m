//
//  ViewController.m
//  CircularColorPicker
//
//  Created by Janusz Chudzynski on 6/17/13.
//  Copyright (c) 2013 Janusz Chudzynski. All rights reserved.
//
/*
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 1. Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 3. All advertising materials mentioning features or use of this software
 must display the following acknowledgement:
 This product includes software developed by the Janusz Chudzynski.
 4. Neither the name of the Janusz Chudzynski nor the
 names of its contributors may be used to endorse or promote products
 derived from this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY Janusz Chudzynski ''AS IS'' AND ANY
 EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL Janusz Chudzynski BE LIABLE FOR ANY
 DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "ViewController.h"
#import "CircularPicker.h"

@interface ViewController (){
CircularPicker * cp;
NSTimer * timer;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Initializing CircularPicker
    cp = [[CircularPicker alloc] initWithFrame:self.view.bounds andCompletionHandler:^(UIColor * color){
    @try {
        NSLog(@"Color is %@",color);
        [UIView animateWithDuration:0.5 animations:^{
            self.view.backgroundColor = color; // Changes color of the background to one selected in the picker
        }];
    }
    @catch (NSException *exception) {
        NSLog(@" Exception %@",[exception debugDescription]);
    }
    @finally {

        }
    }];
    //run timer
    timer = [NSTimer scheduledTimerWithTimeInterval:1/30.f target:self selector:@selector(rotate:) userInfo:nil repeats:YES];
    [self.view addSubview:cp];
}

/**
 Rotates the picker
 */
-(void)rotate:(id)timer{
    CGAffineTransformRotate(cp.transform, 1);
    cp.transform =  CGAffineTransformRotate(cp.transform, degreesToRadians(1));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
