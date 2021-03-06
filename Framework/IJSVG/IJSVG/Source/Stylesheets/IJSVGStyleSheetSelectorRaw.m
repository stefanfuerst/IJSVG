//
//  IJSVGStyleSheetSelectorRaw.m
//  IJSVGExample
//
//  Created by Curtis Hard on 16/01/2016.
//  Copyright © 2016 Curtis Hard. All rights reserved.
//

#import "IJSVGStyleSheetSelectorRaw.h"

@implementation IJSVGStyleSheetSelectorRaw

@synthesize classes, identifier, tag, combinator, combinatorString;

- (void)dealloc
{
    (void)([classes release]), classes = nil;
    (void)([identifier release]), identifier = nil;
    (void)([tag release]), tag = nil;
    (void)([combinatorString release]), combinatorString = nil;
    [super dealloc];
}

- (id)init
{
    if ((self = [super init]) != nil) {
        classes = [[NSMutableArray alloc] init];
        combinator = IJSVGStyleSheetSelectorCombinatorDescendant;
        combinatorString = @" ";
    }
    return self;
}

- (void)addClassName:(NSString*)className
{
    [classes addObject:className];
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"Combinator: %@, Tag: %@, Classes: %@, Identifier: %@", combinatorString, tag, classes, identifier];
}

@end
