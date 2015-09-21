//
//  HeroTableViewCell.h
//  Dota2Heros
//
//  Created by Zoro on 15/9/17.
//  Copyright (c) 2015年 Zoro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@end
