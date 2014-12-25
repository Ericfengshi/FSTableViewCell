//
//  ViewController.h
//  DrawTableViewCell
//
//  Created by fengs on 14-9-30.
//  Copyright (c) 2014年 fengs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonTableViewCellView.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_dataTableView;
}

@property(nonatomic,retain) UITableView *dataTableView;

@end

