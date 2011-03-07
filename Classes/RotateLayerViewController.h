//
//  RotateLayerViewController.h
//  RotateLayer
//
//  Created by Giovambattista Fazioli on 08/03/11.
//  Copyright Saidmade Srl 2011. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface RotateLayerViewController : UIViewController {

}

@property(nonatomic, retain) IBOutlet UIView *viewContainer;
@property(nonatomic, retain) IBOutlet UIImageView *imageView;
@property(nonatomic, retain) IBOutlet UISlider *sliderX;
@property(nonatomic, retain) IBOutlet UISlider *sliderY;
@property(nonatomic, retain) IBOutlet UISlider *sliderZ;
@property(nonatomic, retain) IBOutlet UISlider *sliderP;
@property(nonatomic, retain) IBOutlet UISwitch *switchTransform;

- (IBAction)didSliderChangeValue:(UISlider *)sender;
- (IBAction)didSwitch:(UISwitch *)sender;

@end

