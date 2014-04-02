//
//  MBPostViewController.m
//  Test
//
//  Created by Aditya Aggarwal on 4/1/14.
//  Copyright (c) 2014 Aditya. All rights reserved.
//

#import "MBPostViewController.h"
#import "MBDotNetApiClient.h"
#import "MBPostData.h"
#import "MBPostTableViewcellCell.h"
@interface MBPostViewController ()
{
    UIActivityIndicatorView *_activityIndicatorView;
    
}
@property (nonatomic,retain)NSMutableArray *arr_PostsTimeline;
@end

@implementation MBPostViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self createActivityIndicator];
    [self fetchTimeline];
    self.tableView.rowHeight = 100;
    [self createRefreshControl];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)createActivityIndicator
{
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [_activityIndicatorView setCenter:CGPointMake(self.view.frame.size.width/2,
                                                  self.view.frame.size.height/2)];
    [_activityIndicatorView setColor:[UIColor darkGrayColor]];
    
    _activityIndicatorView.hidesWhenStopped = YES;
  
    [self.view addSubview:_activityIndicatorView];
}

-(void)createRefreshControl
{
    UIRefreshControl *refresh = [[UIRefreshControl alloc]init];
    [refresh addTarget:self
                action:@selector(fetchTimeline)
      forControlEvents:UIControlEventValueChanged];
    self.refreshControl =refresh;
    [refresh release];
}

#pragma mark - FetchTimeline Method
- (void)fetchTimeline
{
    [_activityIndicatorView startAnimating];
    [[MBDotNetApiClient sharedClient] getPath:@"stream/0/posts/stream/global" parameters:nil success:^(AFHTTPRequestOperation *operation, id json)
    {
        NSMutableArray *arr_post = [json valueForKeyPath:@"data"];
        self.arr_PostsTimeline = [[NSMutableArray alloc]init];
        for (NSDictionary *attributes in arr_post) {
            MBPostData *post = [MBPostData instanceFromDictionary:attributes];
            [self.arr_PostsTimeline addObject:post];
        }
        [self.tableView reloadData];
        [_activityIndicatorView stopAnimating];
        [self.refreshControl endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error )
     {
         UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
         [alert show];
         [alert release];
         [_activityIndicatorView stopAnimating];
         [self.refreshControl endRefreshing];


     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.arr_PostsTimeline count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MBPostTableViewcellCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[MBPostTableViewcellCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] ;
    }
    cell.postData = [self.arr_PostsTimeline objectAtIndex:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //return [[MBPostTableViewcellCell calculateRowHeight] :[_posts objectAtIndex:indexPath.row]];
    return [MBPostTableViewcellCell calculateRowHeight:[self.arr_PostsTimeline objectAtIndex:indexPath.row]];
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */
- (void)dealloc
{
    [_activityIndicatorView release];
    [super dealloc];
}

@end
