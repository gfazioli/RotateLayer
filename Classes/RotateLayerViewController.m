//
//  RotateLayerViewController.m
//  RotateLayer
//
//  Created by Giovambattista Fazioli on 08/03/11.
//  Copyright Saidmade Srl 2011. All rights reserved.
//


#import "RotateLayerViewController.h"

#import <QuartzCore/QuartzCore.h>

CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};
CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180/M_PI;};

#define USE_CATRANSFORM 1

@implementation RotateLayerViewController

@synthesize viewContainer;
@synthesize imageView;
@synthesize sliderX;
@synthesize sliderY;
@synthesize sliderZ;
@synthesize sliderP;
@synthesize switchTransform;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];	
}

- (IBAction)didSwitch:(UISwitch *)sender {
	
}

- (IBAction)didSliderChangeValue:(UISlider *)sender {

	if (switchTransform.isOn) {
		CATransform3D trans = CATransform3DIdentity;
		
		trans.m34 = 1.0/[sliderP value];
		
		trans = CATransform3DRotate(trans, DegreesToRadians([sliderX value]), 1, 0, 0);
		trans = CATransform3DRotate(trans, DegreesToRadians([sliderY value]), 0, 1, 0);
		trans = CATransform3DRotate(trans, DegreesToRadians([sliderZ value]), 0, 0, 1);
		[viewContainer.layer setTransform:trans]; 
	} else {
		CALayer *myLayer = viewContainer.layer;
		
		// Decommentare la linea qui sotto per modificare il punto di ancoraggio
		// myLayer.anchorPoint = CGPointMake(0.1f, 0.8f);
		
		[myLayer setValue:[NSNumber numberWithDouble:DegreesToRadians([sliderX value])] forKeyPath:@"transform.rotation.x"];
		[myLayer setValue:[NSNumber numberWithDouble:DegreesToRadians([sliderY value])] forKeyPath:@"transform.rotation.y"];
		[myLayer setValue:[NSNumber numberWithDouble:DegreesToRadians([sliderZ value])] forKeyPath:@"transform.rotation.z"];
		
	}
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.viewContainer = nil;
	self.imageView = nil;
	self.sliderX = nil;
	self.sliderY = nil;
	self.sliderZ = nil;
	self.sliderP = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
