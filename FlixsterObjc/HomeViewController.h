//
//  HomeViewController.h
//  FlixsterObjc
//
//  Created by Ryan Liszewski on 3/8/18.
//  Copyright © 2018 ImThere. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (nonatomic) NSDictionary *movies;

-(void)requestMovie;



@end
