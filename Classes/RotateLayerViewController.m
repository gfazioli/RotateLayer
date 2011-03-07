//
//  RotateLayerViewController.m
//  RotateLayer
//
//  Created by Giovambattista Fazioli on 14/10/10.
//  Copyright Saidmade Srl 2010. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//


#import "RotateLayerViewController.h"

#import <QuartzCore/QuartzCore.h>

CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};
CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180/M_PI;};

#define USE_CATRANSFORM 1

@implementation RotateLayerViewController


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

- (IBAction)didSliderChangeValue:(id)sender {

#if USE_CATRANSFORM == 1
	CATransform3D trans = CATransform3DIdentity;
	
	trans.m34 = 1.0/[sliderP value];
	
	trans = CATransform3DRotate(trans, DegreesToRadians([sliderX value]), 1, 0, 0);
	trans = CATransform3DRotate(trans, DegreesToRadians([sliderY value]), 0, 1, 0);
	trans = CATransform3DRotate(trans, DegreesToRadians([sliderZ value]), 0, 0, 1);
	[viewContainer.layer setTransform:trans]; 
	
#else	
	
	CALayer *myLayer = viewContainer.layer;
	
	// Decommentare la linea qui sotto per modificare il punto di ancoraggio
	// myLayer.anchorPoint = CGPointMake(0.1f, 0.8f);
		
	[myLayer setValue:[NSNumber numberWithDouble:DegreesToRadians([sliderX value])] forKeyPath:@"transform.rotation.x"];
	[myLayer setValue:[NSNumber numberWithDouble:DegreesToRadians([sliderY value])] forKeyPath:@"transform.rotation.y"];
	[myLayer setValue:[NSNumber numberWithDouble:DegreesToRadians([sliderZ value])] forKeyPath:@"transform.rotation.z"];

#endif	
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
}


- (void)dealloc {
    [super dealloc];
}

@end
