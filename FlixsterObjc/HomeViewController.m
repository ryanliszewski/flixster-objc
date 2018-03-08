//
//  HomeViewController.m
//  FlixsterObjc
//
//  Created by Ryan Liszewski on 3/8/18.
//  Copyright © 2018 ImThere. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self requestMovie];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)requestMovie {
	NSURL *url = [[NSURL alloc] initWithString: @"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"];
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
	NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
	
	NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if (data != nil) {
			NSError *e = nil;
			NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&e];
			NSLog(@"%@", dataDictionary);
		} else {
			NSLog(@"%@", error.localizedDescription);
		}
	}];
	[task resume];
}

@end
