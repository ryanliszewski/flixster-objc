//
//  HomeViewController.m
//  FlixsterObjc
//
//  Created by Ryan Liszewski on 3/8/18.
//  Copyright © 2018 ImThere. All rights reserved.
//

#import "HomeViewController.h"
#import "MovieViewCell.h"

@interface HomeViewController()
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	_tableview.dataSource = self;
	
	[self requestMovies];
}

#pragma API get request to MovieDB. Endpoing= now_playing

-(void)requestMovies {
	NSURL *url = [[NSURL alloc] initWithString: @"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"];
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
	NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
	
	NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if (data != nil) {
			NSError *e = nil;
			NSDictionary *movieDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&e];
			_movies = movieDictionary[@"results"];
			
			dispatch_async(dispatch_get_main_queue(), ^{
				NSLog(@"%@", _movies);
				[self.tableview reloadData];
			});
		} else {
			NSLog(@"%@", error.localizedDescription);
		}
	}];
	[task resume];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	MovieViewCell *cell = (MovieViewCell *) [tableView dequeueReusableCellWithIdentifier:@"MovieViewCell" forIndexPath:indexPath];
	
	NSDictionary *movie = [[NSDictionary alloc] initWithDictionary:_movies[indexPath.row]];
	NSString *title = movie[@"original_title"];
	
	
	
	[cell bindData:title];
	
	return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return _movies.count;
}



@end
