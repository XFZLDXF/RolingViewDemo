//
//  ViewController.h
//  MenuSys33
//
//  Created by rjxy on 13-3-18.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Tool.h"
#import "AddDishViewController.h"
#import "OrderDishViewController.h"
@interface ViewController : UIViewController<UIPopoverControllerDelegate,UIAlertViewDelegate>
@property(strong,nonatomic) UIButton *addDish;
@property(strong,nonatomic) UIButton *orderDish;
@property(strong,nonatomic) UIPopoverController *popoverDishViewController;
@property(assign,nonatomic) BOOL popCancel;


@end
