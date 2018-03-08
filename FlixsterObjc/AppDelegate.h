//
//  AppDelegate.h
//  FlixsterObjc
//
//  Created by Ryan Liszewski on 3/8/18.
//  Copyright © 2018 ImThere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

