//
//  AMKParser.m
//  AOEMVVMSimple
//
//  Created by 夏宁忠 on 2018/1/25.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "AMKParser.h"

@implementation AMKParser

+(AMKClassNameFormat *)parseClassName:(NSString *)name{
    
    AMKClassNameFormat * format = [[AMKClassNameFormat alloc]init];
    
    if (!name || [name isEqualToString:@""]) {
        
        format.isError = YES;
    }else{
        
        NSArray * arr = [name componentsSeparatedByString:@"&&"];
        if (arr && arr.count > 0) {
            
            format.amk_className = [arr.firstObject stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        }
        if (arr.count>1) {
            
            format.amk_nav = [arr[1] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        }
        if (arr.count>2) {
            
            format.isError = YES;
        }
    }
    
    return format;
}

+(AMKSBBuildNameFormat *)parseSBBuildName:(NSString *)name{
    
    AMKSBBuildNameFormat * format = [[AMKSBBuildNameFormat alloc]init];
    if (!name || [name isEqualToString:@""]) {
        
        format.isError = YES;
    }else{
        
        NSArray * arr = [name componentsSeparatedByString:@"-"];
        if (arr && arr.count==1) {
            
            format.isError = YES;
        }else{
            
            if (arr && arr.count>0) {
                
                NSString * str = [arr.firstObject stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                if (![str isEqualToString:@"SB"]) {
                    
                    format.isError = YES;
                }
            }
            if (arr && arr.count>1) {
                
                format.amk_sbName = [arr[1] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            }
            if (arr && arr.count>2) {
                
                format.amk_identifier = [arr[2] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            }
            if (arr.count>3) {
                
                format.isError = YES;
            }
        }
    }
    return format;
}

@end

@implementation AMKClassNameFormat

@end

@implementation AMKSBBuildNameFormat

@end
