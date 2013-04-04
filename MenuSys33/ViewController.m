//
//  ViewController.m
//  MenuSys33
//
//  Created by rjxy on 13-3-18.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize addDish,orderDish;
@synthesize popoverDishViewController;
@synthesize popCancel;


- (UIButton *)buttonWithFrame:(CGRect)frame  withNormalTitle:(NSString *)title  withOtherStateTitle:(NSString *)otherTitle action:(SEL)action 
{
    UIImage *buttonBackgroundImage = [[UIImage imageNamed:@"button_background.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
    UIImage *disabledButtonBackgroundImage = [[UIImage imageNamed:@"button_background_disabled.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:otherTitle forState:UIControlStateDisabled];
    [button setBackgroundImage:buttonBackgroundImage forState:UIControlStateNormal];
    [button setBackgroundImage:disabledButtonBackgroundImage forState:UIControlStateDisabled];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    return button;
}

-(void)addMenuDishDetail
{
    AddDishViewController *addDishViewController = [[AddDishViewController alloc] init];
    [addDishViewController.view setBackgroundColor:[UIColor yellowColor]];
    popoverDishViewController = [[UIPopoverController alloc] initWithContentViewController:addDishViewController];
    popoverDishViewController.delegate = self;
    [popoverDishViewController setPopoverContentSize:CGSizeMake(480, 640) animated:YES];
    CGRect pointRect = CGRectMake(addDish.frame.origin.x + addDish.frame.size.width/2,addDish.frame.origin.y + addDish.frame.size.height , 2, 0);
    [popoverDishViewController presentPopoverFromRect:pointRect
                                               inView:self.view
                             permittedArrowDirections:UIPopoverArrowDirectionUp
                                             animated:YES];
    
}

-(void)orderDishViewSwitch
{
//    [UIView beginAnimations:@"Curl" context:nil];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView setAnimationDuration:1.25];
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
    
    OrderDishViewController *orderDishViewController = [[OrderDishViewController alloc] initWithNibName:@"OrderDishViewController" bundle:nil];
//    [self.view removeFromSuperview];
//    [self.view insertSubview:orderDishViewController.view atIndex:1];
//    [self.view addSubview:orderDishViewController.view];
//    [UIView commitAnimations];
    
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 1.25;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"cube";
    animation.subtype = kCATransitionFromRight;
//    NSUInteger green = [[self.view subviews] indexOfObject:self.view];
//    NSUInteger blue = [[self.view subviews] indexOfObject:orderDishViewController.view];
//    
//    [self.view exchangeSubviewAtIndex:green withSubviewAtIndex:blue];
    [self.view addSubview:orderDishViewController.view];
    [[self.view layer] addAnimation:animation forKey:@"animation"];


}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
//    if ([Tool iPadDeviceOrientation]==UIDeviceOrientationFaceUp) {
//        CGRect addDishButRect = CGRectMake(100, 100, 200, 100);
//        addDish = [self buttonWithFrame:addDishButRect withNormalTitle:@"添加菜肴" withOtherStateTitle:@"添加菜肴" action:@selector(addMenuDishDetail)];
//    }
   
        CGRect addDishButRect = CGRectMake(100, 100, 200, 100);
        addDish = [self buttonWithFrame:addDishButRect 
                        withNormalTitle:@"添加菜肴" 
                    withOtherStateTitle:@"添加菜肴" 
                                 action:@selector(addMenuDishDetail)];
    
        CGRect orderDishButRect = CGRectMake(100, 600, 200, 100);
        orderDish = [self buttonWithFrame:orderDishButRect
                                withNormalTitle:@"开始点菜" 
                            withOtherStateTitle:@"开始点菜"
                                         action:@selector(orderDishViewSwitch)];
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark UIPopoverControllerDelegate
-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
        [popoverController dismissPopoverAnimated:YES];
    
}
- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告"
                                                    message:@"你正在编辑菜单，是否放弃？" 
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
        
    return popCancel;

}

#pragma mark UIAlerDalegate
//-(void)alertViewCancel:(UIAlertView *)alertView {
//    popCancel=YES;
//}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        popCancel=NO;
        NSLog(@"YES");
    }
    if (buttonIndex==1) {
        popCancel=YES;
        NSLog(@"NO");
    }

}

@end
