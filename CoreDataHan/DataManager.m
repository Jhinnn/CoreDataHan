//
//  DataManager.m
//  CoreDataHan
//
//  Created by 徐佳鹏 on 2020/7/27.
//  Copyright © 2020 徐佳鹏. All rights reserved.
//

#import "DataManager.h"
#import "Emperor+CoreDataProperties.h"
@implementation DataManager

- (void)createDataBase {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Emperor" withExtension:@"momd"];
    
    //1.将创建的模型类文件转换成模型文件对象
    NSManagedObjectModel *emperorModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:url];
    
    //2.将模型对象初始化
    NSPersistentStoreCoordinator *persistentStore = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:emperorModel];
    
    //3.创建数据库文件
    NSString *tempPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *dataBasePath = [tempPath stringByAppendingPathComponent:@"emperor.sqlite"];
    NSURL *urlPath = [NSURL fileURLWithPath:dataBasePath];
    NSError *error;
    [persistentStore addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:urlPath options:nil error:&error];
    if (error) {
        NSLog(@"数据库创建失败");
    }else {
        NSLog(@"数据库创建成功");
    }
    
    self.context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    self.context.persistentStoreCoordinator = persistentStore;
    
}

- (void)insertData {
    Emperor *emperor = [NSEntityDescription insertNewObjectForEntityForName:@"Emperor" inManagedObjectContext:self.context];
    emperor.name = @"刘邦";
    emperor.sex = @"男";
    emperor.event = @"建立汉朝";
    emperor.age = @"14";
    NSError *error;
    if ([self.context save:&error]) {
        NSLog(@"插入数据成功");
    }else {
        NSLog(@"插入数据失败");
    }
}

- (NSArray *)readData {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Emperor"];
    NSError *error = nil;
    NSArray *array = [self.context executeFetchRequest:request error:&error];
    return array;
}
@end
