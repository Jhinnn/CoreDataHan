//
//  Emperor+CoreDataProperties.h
//  CoreDataHan
//
//  Created by 徐佳鹏 on 2020/7/27.
//  Copyright © 2020 徐佳鹏. All rights reserved.
//
//

#import "Emperor+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Emperor (CoreDataProperties)

+ (NSFetchRequest<Emperor *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *age;
@property (nullable, nonatomic, copy) NSString *event;
@property (nullable, nonatomic, copy) NSString *sex;

@end

NS_ASSUME_NONNULL_END
