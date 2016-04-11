//
//  YYTextHttpBindingParser.h
//  YYTextDemo
//
//  Created by chaiweiwei on 16/4/11.
//  Copyright © 2016年 ibireme. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYText.h"
#import "VV_YYDelegate.h"

@interface VV_YYTextHttpBindingParser : NSObject<YYTextParser>

@property (nonatomic,strong) NSRegularExpression *regex;

@property (nonatomic,assign) id<VV_YYTextBindingParseDelegate> delegate;

@end
