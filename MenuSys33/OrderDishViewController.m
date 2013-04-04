//
//  OrderDishViewController.m
//  MenuSys33
//
//  Created by rjxy on 13-3-19.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "OrderDishViewController.h"

@interface OrderDishViewController ()

@end

@implementation OrderDishViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}
#pragma mark UITableView Delagete and DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentfier";
    static BOOL nibsRegistered = NO;;
    
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"OrderDishCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        nibsRegistered=YES;
    }
    OrderDishCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
    

        
//        UIView *background = [[UIView alloc] initWithFrame:cell.bounds];
//        cell.backgroundView=background;

//    cell.ShowDishesImage.image = [UIImage imageNamed:@"myinfomation.png"];
//    cell.ShowDishesPrice.text = @"20";
//    cell.ShowDishesName.text = @"红烧肉";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"xuanzhong");
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}



@end
