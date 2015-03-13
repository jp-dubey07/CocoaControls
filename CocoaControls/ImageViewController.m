//
//  ImageViewController.m
//  CocoaControls
//
//  Created by MACBOOK-MUM on 25/02/15.
//  Copyright (c) 2015 MACBOOK-MUM. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // The root view of the view controller set in Interface Builder is a UIImageView.
    UIImageView *imageView = (UIImageView *)self.view;
    
    imageView.animationImages = @[
                                  [UIImage imageNamed:@"image_animal_1"],
                                  [UIImage imageNamed:@"image_animal_2"],
                                  [UIImage imageNamed:@"image_animal_3"],
                                  [UIImage imageNamed:@"image_animal_4"],
                                  [UIImage imageNamed:@"image_animal_5"]
                                  ];
    
    // We want the image to be scaled to the correct aspect ratio within imageView's bounds.
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    // If the image does not have the same aspect ratio as imageView's bounds, then imageView's backgroundColor will be applied to the "empty" space.
    imageView.backgroundColor = [UIColor whiteColor];
    
    imageView.animationDuration = 5;
    [imageView startAnimating];
    
    imageView.isAccessibilityElement = YES;
    imageView.accessibilityLabel = NSLocalizedString(@"Animated", nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
