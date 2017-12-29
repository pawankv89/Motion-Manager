
PKCMMotionManager
=========

## PKCMMotionManager.
------------
 Added Some screens here.
 
[![](https://github.com/pawankv89/PKCMMotionManager/blob/master/Screens/1.png)]
[![](https://github.com/pawankv89/PKCMMotionManager/blob/master/Screens/2.MP4)]

## Usage
------------
 iOS 9 Demo showing how to droodown on iPhone X Simulator in  Objective-C.


```objective-c


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


```

```objective-c

```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each this release can be found in the [CHANGELOG](CHANGELOG.mdown). 
