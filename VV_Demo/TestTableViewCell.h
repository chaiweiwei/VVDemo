//
//  TestTableViewCell.h
//  VV_Demo
//
//  Created by chaiweiwei on 16/4/15.
//  Copyright © 2016年 chaiweiwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableViewCell : UITableViewCell

@property (nonatomic,copy) void (^blockCallBack)(void);

@end
