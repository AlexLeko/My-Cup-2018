//
//  AppDelegate.h
//  My Cup 2018
//
//  Created by Adriano Carnaroli on 11/01/18.
//  Copyright © 2018 Alex dos Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

