//
//  GameController.m
//  Pongy WatchKit Extension
//
//  Created by Viktor Radulov on 7/11/17.
//  Copyright © 2017 Golova. All rights reserved.
//

#import "GameController.h"

@interface GameController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *imageView;

@property (nonatomic) CGRect leftPaddleRect;
@property (nonatomic) CGRect rightPaddleRect;
@property (nonatomic) CGRect ballRect;

@end

@implementation GameController

- (CGRect)leftPaddleRect
{
	if (CGRectEqualToRect(_leftPaddleRect, CGRectZero))
	{
		_rightPaddleRect = CGRectMake(2.0, 180.0 / 2.0 - 6.0, 4.0, 12.0);
	}
	return _leftPaddleRect;
}

- (CGRect)rightPaddleRect
{
	if (CGRectEqualToRect(_rightPaddleRect, CGRectZero))
	{
		_rightPaddleRect = CGRectMake(180 - 4.0 - 2.0, 180.0 / 2.0 - 6.0, 4.0, 12.0);
	}
	return _rightPaddleRect;
}

- (CGRect)ballRect
{
	if (CGRectEqualToRect(_ballRect, CGRectZero))
	{
		_ballRect = CGRectMake(180 / 2.0 - 10.0 / 2.0, 180 / 2.0 - 10.0 / 2.0, 10.0, 10.0);
	}
	return _ballRect;
}

- (void)awakeWithContext:(id)context
{
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate
{
	[NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer)
	{
		UIImage *image = [[UIImage alloc] init];
		
		UIGraphicsBeginImageContext(CGSizeMake(180, 180));
		CGContextRef ctx = UIGraphicsGetCurrentContext();
		
		[[UIColor whiteColor] setStroke];
		
		CGContextFillRect(ctx, self.leftPaddleRect);
		CGContextFillRect(ctx, self.rightPaddleRect);
		CGContextFillRect(ctx, self.ballRect);
		
		UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		
		[self.imageView setImage:retImage];
	}];
	
    [super willActivate];
}

- (void)didDeactivate
{
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



