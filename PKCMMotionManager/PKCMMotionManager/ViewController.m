//
//  ViewController.m
//  PKCMMotionManager
//
//  Created by Pawan kumar on 12/28/17.
//  Copyright © 2017 Pawan Kumar. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()

@property(strong, nonatomic) IBOutlet UIImageView *ball;

@property(strong, nonatomic) CMMotionManager *motionManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Background Color
    self.view.backgroundColor = [UIColor blackColor];

    //SetUp Core Motion
    [self startAccelerometerData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#define BALLOON_Width _ball.frame.size.width/2 // 25
#define BALLOON_Height _ball.frame.size.height/2

-(void)startAccelerometerData {
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = 1/60.0;
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        
        [self outputAccelertionData:accelerometerData.acceleration];
        if(error){
            NSLog(@"%@", error);
        }
    } ];
}

-(void)outputAccelertionData:(CMAcceleration)acceleration
{
    CGRect windowFrame = [[UIScreen mainScreen] bounds];
    CGFloat windowWidth = windowFrame.size.width;
    CGFloat windowHeight = windowFrame.size.height;
    
    //Manage Screen Width
    double valueX = acceleration.x*BALLOON_Width;
    double newX = (_ball.center.x +valueX);
    if (newX > windowWidth-BALLOON_Width){
        newX = windowWidth-BALLOON_Width;
    }
    else if (newX < 0+BALLOON_Width){
        newX = 0+BALLOON_Width;
    }
    
    //Manage Screen height
    double valueY = acceleration.y*BALLOON_Height;
    double newY = (_ball.center.y -valueY);
    if (newY > windowHeight-BALLOON_Height){
        newY = windowHeight-BALLOON_Height;
    }
    else if (newY < 0+BALLOON_Height){
        newY = 0+BALLOON_Height;
    }
    
    _ball.center = CGPointMake(newX, newY);
}



@end
