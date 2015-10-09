//
//  DetailTableViewController.m
//  Dota2Heros
//
//  Created by Zoro on 15/9/18.
//  Copyright (c) 2015年 Zoro. All rights reserved.
//

#import "DetailTableViewController.h"
#import "AbilityTableViewCell.h"
#import "BioTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface DetailTableViewController () {
    NSString *docPath;
}

@property NSURL *heroFullImageURL;
@property NSString *heroBio;
@property NSMutableDictionary *abilityList;
@property (weak, nonatomic) IBOutlet UIImageView *heroFullImageView;

@end

@implementation DetailTableViewController

- (void)showDetail {
    // Full Image
    self.heroFullImageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://cdn.dota2.com.cn/apps/dota2/images/heroes/%@_vert.jpg",self.heroName]];
    [self.heroFullImageView sd_setImageWithURL:self.heroFullImageURL];
    
    // Bio
    self.heroBio = [NSDictionary dictionaryWithContentsOfFile:[docPath stringByAppendingPathComponent:@"DetailData.plist"]][self.heroName][@"bio"];
    
    // Ability
    NSDictionary *allAbility = [NSDictionary dictionaryWithContentsOfFile:[docPath stringByAppendingPathComponent:@"AbilityData.plist"]];
    self.abilityList = [NSMutableDictionary dictionary];
    
    for (NSString *name in allAbility) {
        if ([name hasPrefix:[self.heroName stringByAppendingString:@"_"]]) {
            [self.abilityList setObject:allAbility[name] forKey:name];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    [self showDetail];
    
    // UI
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Ability";
    } else {
        return @"Bio";
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0) {
        return self.abilityList.count;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        AbilityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AbilityCell" forIndexPath:indexPath];
        cell.abilityNameLabel.text = self.abilityList[[self.abilityList allKeys][indexPath.row]][@"dname"];
        cell.abilityDetailLabel.text = self.abilityList[[self.abilityList allKeys][indexPath.row]][@"desc"];
        cell.abilityDetailLabel.numberOfLines = 0;
        
        NSURL *abilityImageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://cdn.dota2.com/apps/dota2/images/abilities/%@_hp1.png", [self.abilityList allKeys][indexPath.row]]];
        [cell.abilityImageView sd_setImageWithURL:abilityImageURL];
        
        return cell;
    } else {
        BioTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BioCell" forIndexPath:indexPath];
        cell.textLabel.text = self.heroBio;
        cell.textLabel.numberOfLines = 0;
        return cell;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
