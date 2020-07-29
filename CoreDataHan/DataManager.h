//
//  DataManager.h
//  CoreDataHan
//
//  Created by 徐佳鹏 on 2020/7/27.
//  Copyright © 2020 徐佳鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject

@property (nonatomic, strong) NSManagedObjectContext *context;


- (void)createDataBase;
- (void)insertData;
- (NSArray *)readData;

@end

NS_ASSUME_NONNULL_END
