//
//  TestModel.h
//  VV_Demo
//
//  Created by chaiweiwei on 16/4/13.
//  Copyright © 2016年 chaiweiwei. All rights reserved.
//

#import <Mantle/Mantle.h>

typedef enum : NSUInteger {
    GHIssueStateOpen,
    GHIssueStateClosed
} GHIssueState;


@interface User : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *name;

@end

@interface TestModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSURL *URL;
@property (nonatomic, copy, readonly) NSURL *HTMLURL;
@property (nonatomic, copy) NSNumber *number;
@property (nonatomic, assign, readonly) GHIssueState state;
@property (nonatomic, copy, readonly) NSString *reporterLogin;
@property (nonatomic, strong, readonly) User *assignee;
@property (nonatomic, copy, readonly) NSDate *updatedAt;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *body;

@property (nonatomic, copy, readonly) NSDate *retrievedAt;

@end
