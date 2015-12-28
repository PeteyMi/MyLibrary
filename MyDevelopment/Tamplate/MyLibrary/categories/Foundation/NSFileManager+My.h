//
//  NSFileManager+My.h
//  MyDevelopment
//
//  Created by Petey Mi on 12/25/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Path)

+ (NSString*)temporaryDirectory;

+ (NSString*)documentDirectory;

+ (NSString*)libraryDirectory;

+ (NSString*)cachesDirectory;

+ (NSString*)pathInLibrary:(NSString*)path;

+ (NSString*)pathInCaches:(NSString*)path;

+ (UInt64)fileSizeOfPath:(NSString*)path;

- (void)removeAllFilesInDirectory:(NSString*)directory;

@end