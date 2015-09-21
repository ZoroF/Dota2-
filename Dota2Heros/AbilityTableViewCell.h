//
//  AbilityTableViewCell.h
//  Dota2Heros
//
//  Created by Zoro on 15/9/18.
//  Copyright (c) 2015年 Zoro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AbilityTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *abilityImageView;
@property (weak, nonatomic) IBOutlet UILabel *abilityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *abilityDetailLabel;

@end
