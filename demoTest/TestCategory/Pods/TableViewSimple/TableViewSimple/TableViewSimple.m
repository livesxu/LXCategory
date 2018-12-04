//
//  TableViewSimple.m
//  XiaoLiuFisheries
//
//  Created by Livespro on 2017/3/9.
//  Copyright © 2017年 福中集团软件公司. All rights reserved.
//

#import "TableViewSimple.h"

@interface TableViewSimple ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TableViewSimple

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator  = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    }
    return self;
}

- (void)addSection:(LXTableSimpleSectionBlock)sectionBlock;{
    
    if (!self.sectionsArray) {
        
        self.sectionsArray = [NSMutableArray array];
        self.delegate = self;
        self.dataSource = self;
        
    }
    
    TableSimpleSection *section = [[TableSimpleSection alloc]init];
    
    section.tableView = self;
    
    section.sectionIndex = self.sectionsArray.count;
    
    sectionBlock(section,section.sectionIndex);
    
    [self.sectionsArray addObject:section];
    
}

#pragma mark - tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.sectionsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{
    
    TableSimpleSection *section_temp = self.sectionsArray[section];
    
    section_temp.sectionIndex = section;
    
    return section_temp.cellsArray.count;
}

#pragma mark - cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    
    TableSimpleSection *section_temp = self.sectionsArray[indexPath.section];
    
    UITableViewCell *cell_temp = section_temp.cellsArray[indexPath.row];
    
    return cell_temp;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableSimpleSection *section_temp = self.sectionsArray[indexPath.section];
    
    UITableViewCell *cell_temp = section_temp.cellsArray[indexPath.row];
    
    return cell_temp.cellHeight_simple;
}

#pragma mark - header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    TableSimpleSection *section_temp = self.sectionsArray[section];
    
    return section_temp.headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    TableSimpleSection *section_temp = self.sectionsArray[section];
    
    return section_temp.headerHeight;
}

#pragma mark - footer
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    TableSimpleSection *section_temp = self.sectionsArray[section];
    
    return section_temp.footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    TableSimpleSection *section_temp = self.sectionsArray[section];
    
    return section_temp.footerHeight;
}

#pragma mark - selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableSimpleSection *section_temp = self.sectionsArray[indexPath.section];
    
    UITableViewCell *cell_temp = section_temp.cellsArray[indexPath.row];
    
    if (cell_temp.simpleCellSelectedAction) {
        
        cell_temp.simpleCellSelectedAction(indexPath);
        
    }
}

@end
