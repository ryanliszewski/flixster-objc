//
//  HomeViewController.h
//  FlixsterObjc
//
//  Created by Ryan Liszewski on 3/8/18.
//  Copyright © 2018 ImThere. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <UITableViewDataSource>


@property (nonatomic) NSArray *movies;


-(void)requestMovies;




@end
