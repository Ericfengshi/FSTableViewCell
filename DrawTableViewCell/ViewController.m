//
//  ViewController.m
//  DrawTableViewCell
//
//  Created by fengs on 14-9-30.
//  Copyright (c) 2014年 fengs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize dataTableView = _dataTableView;

-(void)dealloc{
    
    self.dataTableView = nil;
    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.dataTableView = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"列表信息";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataTableView = [[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain] autorelease];
    self.dataTableView.dataSource = self;
    self.dataTableView.delegate = self;
    self.dataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.dataTableView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    CGFloat height = cell.frame.size.height;
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier ] autorelease];
        
        UIView *view = [[[UIView alloc] init] autorelease];
        CGFloat viewHeight = 0.0f;
        for (int i=0 ; i < 5 ; i++) {
            
            NSMutableArray *keyArray = [NSMutableArray arrayWithObjects:
                                        @"文字介绍1:",@"文字介绍2:",@"知道你过得不好 我也就安心了3:", nil];
            NSMutableArray *valueArray = [NSMutableArray arrayWithObjects:
                                          [NSString stringWithFormat:@"随机数据%d", arc4random_uniform(100)],
                                          [NSString stringWithFormat:@"生活就像一盒巧克力 你永远不知道你会得到什么%d", arc4random_uniform(100)],
                                          [NSString stringWithFormat:@"随机数据%d", arc4random_uniform(100)], nil];

            CommonTableViewCellView *cellView = [[[CommonTableViewCellView alloc] initWithFrame:CGRectMake(0, viewHeight, self.view.frame.size.width, 0)
                                                                                       keyArray:keyArray
                                                                                     valueArray:valueArray] autorelease];
            viewHeight += cellView.viewHeight;
            [view addSubview:cellView];
        }
        [view setFrame:CGRectMake(0, 0, self.view.frame.size.width, viewHeight)];
        cell.accessoryView = view;
        [cell setFrame:CGRectMake(0, 0, self.view.frame.size.width, viewHeight)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    return cell;
}
@end
