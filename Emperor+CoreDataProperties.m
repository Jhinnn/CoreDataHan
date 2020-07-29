//
//  Emperor+CoreDataProperties.m
//  CoreDataHan
//
//  Created by 徐佳鹏 on 2020/7/27.
//  Copyright © 2020 徐佳鹏. All rights reserved.
//
//

#import "Emperor+CoreDataProperties.h"

@implementation Emperor (CoreDataProperties)

+ (NSFetchRequest<Emperor *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Emperor"];
}

@dynamic name;
@dynamic age;
@dynamic event;
@dynamic sex;

@end
