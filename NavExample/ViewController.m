//
//  ViewController.m
//  NavExample
//
//  Created by Manohar on 11/06/14.
//  Copyright (c) 2014 Manohar. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

NSArray *names;


- (void)viewDidLoad
{
    [super viewDidLoad];
    names=[NSArray arrayWithObjects:@"manohar",@"shreedhar",@"ravindra", nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [names count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [names objectAtIndex:indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"nameDetail"]){
        NSIndexPath *path=[self.tableView indexPathForSelectedRow];
        DetailViewController *detailViewController=segue.destinationViewController;
        detailViewController.name=[names objectAtIndex:path.row];
        
    }
}


@end
