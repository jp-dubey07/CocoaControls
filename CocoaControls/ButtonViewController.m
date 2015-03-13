//
//  ButtonViewController.m
//  CocoaControls
//
//  Created by MACBOOK-MUM on 24/02/15.
//  Copyright (c) 2015 MACBOOK-MUM. All rights reserved.
//

#import "ButtonViewController.h"
#import "UIColor+CustomColor.h"

@interface ButtonViewController ()

@property (nonatomic, weak) IBOutlet UIButton *systemTextButton;
@property (nonatomic, weak) IBOutlet UIButton *systemContactAddButton;
@property (nonatomic, weak) IBOutlet UIButton *systemDetailDisclosureButton;
@property (nonatomic, weak) IBOutlet UIButton *imageButton;
@property (nonatomic, weak) IBOutlet UIButton *attributedTextButton;

@end

@implementation ButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // All of the buttons are created in the storyboard, but configured below.
    [self configureSystemTextButton];
    [self configureSystemContactAddButton];
    [self configureSystemDetailDisclosureButton];
    [self configureImageButton];
    [self configureAttributedTextSystemButton];
}

#pragma mark - Configuration

- (void)configureSystemTextButton {
    [self.systemTextButton setTitle:NSLocalizedString(@"text_button", nil) forState:UIControlStateNormal];
    
    [self.systemTextButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)configureSystemContactAddButton {
    self.systemContactAddButton.backgroundColor = [UIColor clearColor];
    
    [self.systemContactAddButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)configureSystemDetailDisclosureButton {
    self.systemDetailDisclosureButton.backgroundColor = [UIColor clearColor];
    
    [self.systemDetailDisclosureButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)configureImageButton {
    // To create this button in code you can use +[UIButton buttonWithType:] with a parameter value of UIButtonTypeCustom.
    
    // Remove the title text.
    [self.imageButton setTitle:@"" forState:UIControlStateNormal];
    
    self.imageButton.tintColor = [UIColor customPurpleColor];
    
    UIImage *imageButtonNormalImage = [UIImage imageNamed:@"x_icon"];
    [self.imageButton setImage:imageButtonNormalImage forState:UIControlStateNormal];
    
    // Add an accessibility label to the image.
    self.imageButton.accessibilityLabel = NSLocalizedString(@"X_Button", nil);
    
    [self.imageButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)configureAttributedTextSystemButton {
    // Set the button's title for normal state.
    NSDictionary *normalTitleAttributes = @{
                                            NSForegroundColorAttributeName: [UIColor customBlueColor],
                                            NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle)
                                            };
    
    NSAttributedString *normalAttributedTitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Button", nil) attributes:normalTitleAttributes];
    [self.attributedTextButton setAttributedTitle:normalAttributedTitle forState:UIControlStateNormal];
    
    // Set the button's title for highlighted state.
    NSDictionary *highlightedTitleAttributes = @{
                                                 NSForegroundColorAttributeName : [UIColor customGreenColor],
                                                 NSStrikethroughStyleAttributeName: @(NSUnderlineStyleThick)
                                                 };
    
    NSAttributedString *highlightedAttributedTitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Button", nil) attributes:highlightedTitleAttributes];
    [self.attributedTextButton setAttributedTitle:highlightedAttributedTitle
                                         forState:UIControlStateHighlighted];
    
    [self.attributedTextButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - Actions

- (void)buttonClicked:(UIButton *)button {
    NSLog(@"A button was clicked: %@.", button);
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
