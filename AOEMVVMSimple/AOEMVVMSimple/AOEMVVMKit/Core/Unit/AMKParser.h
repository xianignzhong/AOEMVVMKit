//
//  AMKParser.h
//  AOEMVVMSimple
//
//  Created by 夏宁忠 on 2018/1/25.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AMKClassNameFormat,AMKSBBuildNameFormat;
@interface AMKParser : NSObject

/**
 解析类名组合 (注: @"ClassName&&nav")

 @param name 组合名
  @return AMKClassNameFormat
 */
+(AMKClassNameFormat *)parseClassName:(NSString *)name;

/**
 解析StoryBoard文件组合名称 (SB-StoryBoardName-identifier) 如果没有identifier 可忽略

 @param name 组合名
 @return AMKSBBuildNameFormat
 */
+(AMKSBBuildNameFormat *)parseSBBuildName:(NSString *)name;

@end

@interface AMKClassNameFormat : NSObject

@property (nonatomic, assign)BOOL isError;

@property (nonatomic, copy)NSString *amk_className;

@property (nonatomic, copy)NSString *amk_nav;

@end

@interface AMKSBBuildNameFormat : NSObject

@property (nonatomic, assign)BOOL isError;

@property (nonatomic, copy)NSString *amk_sbName;

@property (nonatomic, copy)NSString *amk_identifier;

@end
