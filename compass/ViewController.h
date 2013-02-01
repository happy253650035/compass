//
//  ViewController.h
//  compass
//
//  Created by yi yin on 13-2-1.
//  Copyright (c) 2013年 snda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CLLocationManagerDelegate.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>{
    CLLocationCoordinate2D currentLocation;
    CLLocationDirection currentHeading;
    CLLocationManager *locationManager;
    NSTimer *timerShine;
}

@property(nonatomic,strong)IBOutlet UIImageView *compassView;
@property(nonatomic, strong)CLLocationManager *locationManager;
@property(nonatomic, strong)NSTimer *timerShine;

@end
