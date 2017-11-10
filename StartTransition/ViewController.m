//
//  ViewController.m
//  StartTransition
//
//  Created by Evgeniy on 10.11.17.
//  Copyright © 2017 Evgeniy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
//    [self.nature addGestureRecognizer:tapGestureRecognizer];
    isFullScreen = false;
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgToFullScreen:)];
    tap.delegate = self;
    [self.nature addGestureRecognizer:tap];
    [self.nature setUserInteractionEnabled:YES];
}

//- (void) handleTapFrom: (UITapGestureRecognizer *)recognizer {
//    NSLog(@"Tapped");
//}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch;
{
    BOOL shouldReceiveTouch = YES;
    
    if (gestureRecognizer == tap) {
        shouldReceiveTouch = (touch.view == self.nature);
    }
    return shouldReceiveTouch;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imgToFullScreen:(UITapGestureRecognizer *)tapGesture
{
    if (!isFullScreen) {
        [UIView animateWithDuration:5 delay:0 options:0 animations:^{
            //save previous frame
            prevFrame = self.nature.frame;
            [self.nature setFrame:[[UIScreen mainScreen] bounds]];
        }completion:^(BOOL finished){
            isFullScreen = true;
        }];
        return;
    } else {
        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
            [self.nature setFrame:prevFrame];
        }completion:^(BOOL finished){
            isFullScreen = false;
        }];
        return;
    }
    
}

@end
