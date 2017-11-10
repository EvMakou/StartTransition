//
//  ViewController.h
//  StartTransition
//
//  Created by Evgeniy on 10.11.17.
//  Copyright © 2017 Evgeniy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate> {
    UITapGestureRecognizer *tap;
    BOOL isFullScreen;
    CGRect prevFrame;
}

@property (weak, nonatomic) IBOutlet UIImageView *nature;

@property (weak, nonatomic) IBOutlet UIImageView *shapeAmerica;

@end

