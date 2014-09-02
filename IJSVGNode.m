//
//  IJSVGNode.m
//  IconJar
//
//  Created by Curtis Hard on 30/08/2014.
//  Copyright (c) 2014 Curtis Hard. All rights reserved.
//

#import "IJSVGNode.h"

@implementation IJSVGNode

@synthesize x;
@synthesize y;
@synthesize width;
@synthesize height;
@synthesize fillColor;
@synthesize fillOpacity;
@synthesize strokeColor;
@synthesize strokeOpacity;
@synthesize strokeWidth;
@synthesize opacity;
@synthesize identifier;
@synthesize parentNode;
@synthesize transforms;
@synthesize windingRule;

- (void)dealloc
{
    [transforms release], transforms = nil;
    [fillColor release], fillColor = nil;
    [strokeColor release], strokeColor = nil;
    [identifier release], identifier = nil;
    [super dealloc];
}

- (id)init
{
    if( ( self = [super init] ) != nil )
    {
        self.opacity = 0.f;
        self.fillOpacity = 1.f;
        self.strokeOpacity = 1.f;
    }
    return self;
}

// winding rule can inherit..
- (IJSVGWindingRule)windingRule
{
    switch(windingRule)
    {
        case IJSVGWindingRuleEvenOdd:
            return NSEvenOddWindingRule;
        case IJSVGWindingRuleNonZero:
            return NSNonZeroWindingRule;
        case IJSVGWindingRuleInherit:
            if( parentNode != nil )
                return parentNode.windingRule;
    }
    return IJSVGWindingRuleNonZero;
}

// these are all recursive, so go up the chain
// if they dont exist on this specific node
- (CGFloat)opacity
{
    if( opacity == IJSVGInheritedFloatValue && parentNode != nil )
        return parentNode.opacity;
    if( opacity != 0.f )
        return opacity;
    return 0.f;
}

- (CGFloat)fillOpacity
{
    if( fillOpacity == IJSVGInheritedFloatValue && parentNode != nil )
        return parentNode.fillOpacity;
    if( fillOpacity != 0.f )
        return fillOpacity;
    return 0.f;
}

// these are all recursive, so go up the chain
// if they dont exist on this specific node
- (CGFloat)strokeWidth
{
    if( strokeWidth == IJSVGInheritedFloatValue && parentNode != nil )
        return parentNode.strokeWidth;
    if( strokeWidth != 0.f )
        return strokeWidth;
    return 0;
}

// these are all recursive, so go up the chain
// if they dont exist on this specific node
- (NSColor *)strokeColor
{
    if( strokeColor != nil )
        return strokeColor;
    if( strokeColor == nil && parentNode != nil )
        return parentNode.strokeColor;
    return nil;
}

- (CGFloat)strokeOpacity
{
    if( strokeOpacity == IJSVGInheritedFloatValue && parentNode != nil )
        return parentNode.strokeOpacity;
    if( strokeOpacity != 0.f )
        return strokeOpacity;
    return 0.f;
}

@end