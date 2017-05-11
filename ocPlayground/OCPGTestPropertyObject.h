//
//  OCPGTestPropertyObject.h
//  ocPlayground
//
//  Created by RichardLee on 2017/5/11.
//  Copyright © 2017年 lirui.me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCPGTestPropertyObject : NSObject

@property(nonatomic, copy) NSString *copyedString;
@property(nonatomic, copy) NSArray *copyedArray;

// Beware of this stronge declaration!
@property(nonatomic, copy) NSMutableArray *copyedMutableArray;

@end
