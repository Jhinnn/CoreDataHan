//
//  ViewController.m
//  CoreDataHan
//
//  Created by 徐佳鹏 on 2020/7/27.
//  Copyright © 2020 徐佳鹏. All rights reserved.
//

#import "ViewController.h"
#import "DataManager.h"
#import "Emperor+CoreDataProperties.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    
    DataManager *manager = [[DataManager alloc] init];
    [manager createDataBase];
    [manager insertData];
    
    self.dataArray = [manager readData];
    [self.tableView reloadData];

    
    
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.rowHeight = 50;
        self.tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[NSString stringWithFormat:@"%ld",indexPath.row]];
    Emperor *emp = self.dataArray[indexPath.row];
    cell.textLabel.text = emp.name;
    cell.detailTextLabel.text = emp.event;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}



@end
