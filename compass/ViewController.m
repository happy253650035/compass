//
//  ViewController.m
//  compass
//
//  Created by yi yin on 13-2-1.
//  Copyright (c) 2013年 snda. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CLHeading.h>

#import "math.h"

#define toRad(X) (X*M_PI/180.0)
#define toDeg(X) (X*180.0/M_PI)

@interface ViewController ()

@end

@implementation ViewController{
    int mosCode;
}

@synthesize compassView,locationManager,timerShine;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    currentHeading = 0.0;
    [self startLocationHeadingEvents];
    
    mosCode = 0;
    if (timerShine) {
        // [timerShine release];
        
        [timerShine invalidate];
        timerShine = nil;
        
        
    }
    timerShine = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(sosFlash) userInfo:nil repeats:YES];
}

-(void)sosFlash{
    switch (mosCode) {
        case 2:
            NSLog(@"light");
            break;
        case 4:
            NSLog(@"dark");
            break;
        case 6:
            NSLog(@"light");
            break;
        case 8:
            NSLog(@"dark");
            break;
        case 10:
            NSLog(@"light");
            break;
        case 12:
            NSLog(@"dark");
            break;
        case 17:
            NSLog(@"light");
            break;
        case 21:
            NSLog(@"dark");
            break;
        case 23:
            NSLog(@"light");
            break;
        case 27:
            NSLog(@"dark");
            break;
        case 29:
            NSLog(@"light");
            break;
        case 33:
            NSLog(@"dark");
            break;
        case 38:
            NSLog(@"light");
            break;
        case 40:
            NSLog(@"dark");
            break;
        case 42:
            NSLog(@"light");
            break;
        case 44:
            NSLog(@"dark");
            break;
        case 46:
            NSLog(@"light");
            break;
        case 48:
            NSLog(@"longdark");
            break;
        case 59:
            mosCode = -1;
            break;
            
        default:
            break;
    }
    mosCode++;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)startLocationHeadingEvents{
    if (locationManager == nil) {
        CLLocationManager* theManager = [[CLLocationManager alloc] init];
        
        // Retain the object in a property.
        self.locationManager = theManager;
        locationManager.delegate = self;
    }
    
    // Start heading updates.
    if ([CLLocationManager headingAvailable]) {
        locationManager.headingFilter = 5;
        [locationManager startUpdatingHeading];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    if (newHeading.headingAccuracy < 0)
        return;
    
    // Use the true heading if it is valid.
    CLLocationDirection  theHeading = newHeading.trueHeading;
//    ((newHeading.trueHeading > 0) ? newHeading.trueHeading : newHeading.magneticHeading);//trueHeading是地理上的方向，magneticHeading是磁极的方向
    
    currentHeading = theHeading;
    [self updateHeadingDisplays];
}

- (void)updateHeadingDisplays {
    // Animate Compass
    [UIView     animateWithDuration:0.3
                              delay:0.0 
                            options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             CGAffineTransform headingRotation;
                             headingRotation = CGAffineTransformRotate(CGAffineTransformIdentity, (CGFloat)-toRad(currentHeading));
                             compassView.transform = headingRotation;
                         }
                         completion:^(BOOL finished) {
                             
                         }];    
}

@end
