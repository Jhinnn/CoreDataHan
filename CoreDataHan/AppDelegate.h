//
//  AppDelegate.h
//  CoreDataHan
//
//  Created by 徐佳鹏 on 2020/7/27.
//  Copyright © 2020 徐佳鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

