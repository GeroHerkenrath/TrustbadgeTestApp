//
//  ViewController.m
//  TrustbadgeTestApp
//
//  Created by Gero Herkenrath on 01/04/16.
//  Copyright © 2016 Gero Herkenrath. All rights reserved.
//

#import "ViewController.h"
#import <Trustbadge/Trustbadge.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *placeholderView;
@property (weak, nonatomic) IBOutlet UIView *placeholderView2;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	if (self.placeholderView) {
		TRSTrustbadgeView *myTB = [[TRSTrustbadgeView alloc] initWithTrustedShopsID:@"X330A2E7D449E31E467D2F53A55DDD070" apiToken:@"notneeded"];
		[myTB loadTrustbadgeWithSuccessBlock:^{
			[self.placeholderView addSubview:myTB];
			
			// set autolayout constraints so that width & height are equal to placeholder
			[myTB setTranslatesAutoresizingMaskIntoConstraints:NO];
			[self.placeholderView addConstraints:[NSLayoutConstraint
												  constraintsWithVisualFormat:@"H:|-0-[myTB]-0-|"
												  options:NSLayoutFormatDirectionLeadingToTrailing
												  metrics:nil
												  views:NSDictionaryOfVariableBindings(myTB)]];
			[self.placeholderView addConstraints:[NSLayoutConstraint
												  constraintsWithVisualFormat:@"V:|-0-[myTB]-0-|"
												  options:NSLayoutFormatDirectionLeadingToTrailing
												  metrics:nil
												  views:NSDictionaryOfVariableBindings(myTB)]];

		} failureBlock:^(NSError *error) {
			NSLog(@"TB 1 doesn't work, cause: %@", error);
		}];
		TRSTrustbadgeView *myTB2 = [[TRSTrustbadgeView alloc] initWithTrustedShopsID:@"X330A2E7D449E31E467D2F53A55DDD070" apiToken:@"notneeded"];
		[myTB2 loadTrustbadgeWithSuccessBlock:^{
			[self.placeholderView2 addSubview:myTB2];
			
			// set autolayout constraints so that width & height are equal to placeholder
			[myTB2 setTranslatesAutoresizingMaskIntoConstraints:NO];
			[self.placeholderView2 addConstraints:[NSLayoutConstraint
												   constraintsWithVisualFormat:@"H:|-0-[myTB2]-0-|"
												   options:NSLayoutFormatDirectionLeadingToTrailing
												   metrics:nil
												   views:NSDictionaryOfVariableBindings(myTB2)]];
			[self.placeholderView2 addConstraints:[NSLayoutConstraint
												   constraintsWithVisualFormat:@"V:|-0-[myTB2]-0-|"
												   options:NSLayoutFormatDirectionLeadingToTrailing
												   metrics:nil
												   views:NSDictionaryOfVariableBindings(myTB2)]];
			
		} failureBlock:^(NSError *error) {
			NSLog(@"TB 2 doesn't work, cause: %@", error);
		}];

	}
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
