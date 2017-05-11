//
//  ocPlaygroundTests.m
//  ocPlaygroundTests
//
//  Created by RichardLee on 2017/5/11.
//  Copyright © 2017年 lirui.me. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OCPGTestPropertyObject.h"

@interface ocPlaygroundTests : XCTestCase

@end

@implementation ocPlaygroundTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testStrongRef {
    __strong NSObject *object = [[NSObject alloc] init];
    XCTAssert(object);
    
    NSObject *otherObj = object;
    XCTAssert(otherObj);
    
    object = nil;
    XCTAssert(!object);
    XCTAssert(otherObj);
    
}

- (void)testWeakRef {
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wall"
    __weak NSObject *object = [[NSObject alloc] init];
    XCTAssert(!object);
    __weak NSObject *otherObj;
    NSObject *oneStrongObj = [[NSObject alloc] init];
    otherObj = oneStrongObj;
    XCTAssert(otherObj);
    oneStrongObj = nil;
    XCTAssert(!oneStrongObj);
    
//#pragma clang diagnostic pop
}

- (void)testAutoreleasingRef {
    __autoreleasing NSObject *object = [[NSObject alloc] init];
    __autoreleasing NSObject *obj1 = nil;
    XCTAssert(object);
    @autoreleasepool {
         obj1 = [[NSObject alloc] init];
    }
    XCTAssert(obj1);
}

- (void)testCopyRef {
    
    OCPGTestPropertyObject *propObj = [[OCPGTestPropertyObject alloc] init];
    
    NSMutableString *mutableString = [[NSMutableString alloc] init];
    propObj.copyedString = mutableString;
    XCTAssert([propObj.copyedString isKindOfClass:[NSString class]]);
    
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    propObj.copyedArray = mutableArray;
    XCTAssert([propObj.copyedArray isKindOfClass:[NSArray class]]);
    
    propObj.copyedMutableArray = mutableArray;
    XCTAssert(![propObj.copyedMutableArray isKindOfClass:[NSMutableArray class]]);
    XCTAssert(![propObj.copyedMutableArray respondsToSelector:@selector(addObject:)]);
}
@end
