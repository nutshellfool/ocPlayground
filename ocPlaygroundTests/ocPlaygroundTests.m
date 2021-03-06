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
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-unsafe-retained-assign"
    __weak NSObject *object = [[NSObject alloc] init];
#pragma clang diagnostic pop
    XCTAssert(!object);
    __weak NSObject *otherObj;
    NSObject *oneStrongObj = [[NSObject alloc] init];
    otherObj = oneStrongObj;
    XCTAssert(otherObj);
    oneStrongObj = nil;
    XCTAssert(!oneStrongObj);
}

- (void)testWeakStringVarRef {
    NSString *string = @"testWeakRef";
    __weak NSString *weakRef = string;
    XCTAssert(weakRef);
    string = nil;
    XCTAssert(weakRef);
}

- (void)testAutoreleasingRef {
//    __autoreleasing NSObject *object = [[NSObject alloc] init];
//    __autoreleasing NSObject *obj1 = nil;
//    XCTAssert(object);
//    @autoreleasepool {
//        obj1 = [[NSObject alloc] init];
//    }
//    XCTAssert(obj1);
    
    // Actually I have no idea how to write the test case
    // on demostrating the autoreleasing variables.
    // the key point of the autorelease variable are
    // 1. this autorelase variable memory will be relased when jump out of the @autorealeasepool scope.
    // 2. within the viewcontroller lifecycle, the variable will be released in the runloop.
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
