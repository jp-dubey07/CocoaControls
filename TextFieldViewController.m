//
//  TextFieldViewController.m
//  CocoaControls
//
//  Created by MACBOOK-MUM on 24/02/15.
//  Copyright (c) 2015 MACBOOK-MUM. All rights reserved.
//

#import "TextFieldViewController.h"
#import "UIColor+CustomColor.h"

@interface TextFieldViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UITextField *tintedTextField;
@property (nonatomic, weak) IBOutlet UITextField *secureTextField;
@property (nonatomic, weak) IBOutlet UITextField *specificKeyboardTextField;
@property (nonatomic, weak) IBOutlet UITextField *customTextField;

@end

@implementation TextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureTextField];
    [self configureTintedTextField];
    [self configureSecureTextField];
    [self configureSpecificKeyboardTextField];
    [self configureCustomTextField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Configuration

- (void)configureTextField {
    
    self.textField.placeholder = NSLocalizedString(@"Default_textfield", nil);
    self.textField.autocorrectionType = UITextAutocorrectionTypeYes;
    self.textField.returnKeyType = UIReturnKeyDone;
    self.textField.clearButtonMode = UITextFieldViewModeNever;
}

- (void)configureTintedTextField {
    self.tintedTextField.tintColor = [UIColor customBlueColor];
    self.tintedTextField.textColor = [UIColor customGreenColor];
    
    self.tintedTextField.placeholder = NSLocalizedString(@"Tint_Textfield", nil);
    self.tintedTextField.returnKeyType = UIReturnKeyDone;
    self.tintedTextField.clearButtonMode = UITextFieldViewModeNever;
}

- (void)configureSecureTextField {
    self.secureTextField.secureTextEntry = YES;
    
    self.secureTextField.placeholder = NSLocalizedString(@"Secure_Textfield", nil);
    self.secureTextField.returnKeyType = UIReturnKeyDone;
    self.secureTextField.clearButtonMode = UITextFieldViewModeAlways;
}

- (void)configureSpecificKeyboardTextField {
    self.specificKeyboardTextField.keyboardType = UIKeyboardTypeEmailAddress;
    
    self.specificKeyboardTextField.placeholder = NSLocalizedString(@"Specific_KB", nil);
    self.specificKeyboardTextField.returnKeyType = UIReturnKeyDone;
}

- (void)configureCustomTextField {
    // Text fields with custom image backgrounds must have no border.
    self.customTextField.borderStyle = UITextBorderStyleNone;
    
    self.customTextField.background = [UIImage imageNamed:@"text_field_background"];
    
    // Create a purple button that, when selected, turns the custom text field's text color to purple.
    UIImage *purpleImage = [UIImage imageNamed:@"text_field_purple_right_view"];
    UIButton *purpleImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    purpleImageButton.bounds = CGRectMake(0, 0, purpleImage.size.width, purpleImage.size.height);
    purpleImageButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    [purpleImageButton setImage:purpleImage forState:UIControlStateNormal];
    [purpleImageButton addTarget:self action:@selector(customTextFieldPurpleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    self.customTextField.rightView = purpleImageButton;
    self.customTextField.rightViewMode = UITextFieldViewModeAlways;
    
    // Add an empty view as the left view to ensure inset between the text and the bounding rectangle.
    UIView *leftPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
    leftPaddingView.backgroundColor = [UIColor clearColor];
    self.customTextField.leftView = leftPaddingView;
    self.customTextField.leftViewMode = UITextFieldViewModeAlways;
    
    self.customTextField.placeholder = NSLocalizedString(@"custom_textfield", nil);
    self.customTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.customTextField.returnKeyType = UIReturnKeyDone;
}

#pragma mark - UITextFieldDelegate (set in Interface Builder)

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - Actions

- (void)customTextFieldPurpleButtonClicked {
    self.customTextField.textColor = [UIColor customPurpleColor];
    
    NSLog(@"The custom text field's purple right view button was clicked.");
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
