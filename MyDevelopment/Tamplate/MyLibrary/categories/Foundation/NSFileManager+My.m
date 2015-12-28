//
//  NSFileManager+My.m
//  MyDevelopment
//
//  Created by Petey Mi on 12/25/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import "NSFileManager+My.h"

@implementation NSFileManager (Path)

+(NSString*)temporaryDirectory
{
    return NSTemporaryDirectory();
}
+(NSString*)documentDirectory
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString* directory = [paths firstObject];
    return directory;
}
+ (NSString*)libraryDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *directory = [paths firstObject];
    return directory;
}

+ (NSString*)cachesDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *directory = [paths firstObject];
    return directory;
}

+ (NSString*)pathInLibrary:(NSString*)path {
    return [[NSFileManager libraryDirectory] stringByAppendingPathComponent:path];
}

+ (NSString*)pathInCaches:(NSString*)path {
    return [[NSFileManager cachesDirectory] stringByAppendingPathComponent:path];
}
+ (UInt64)fileSizeOfPath:(NSString*)path {
    NSDictionary* attr = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
    if (attr) {
        return [[attr objectForKey:NSFileSize] longLongValue];
    }
    return 0;
}

- (void)removeAllFilesInDirectory:(NSString*)directory {
    NSArray* files = [self contentsOfDirectoryAtPath:directory error:NULL];
    NSEnumerator* itr = [files objectEnumerator];
    NSString *filename;
    while ((filename = [itr nextObject])) {
        [self removeItemAtPath:[directory stringByAppendingPathComponent:filename] error:NULL];
    }
}
@end
