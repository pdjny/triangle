//
//  view.m
//  triangle
//
//  Created by PHILIP JACOBS on 7/6/13.
//  Copyright (c) 2013 PHILIP JACOBS. All rights reserved.
//

#import "View.h"
@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor whiteColor];
		var1 = .9;
		var2 = .4;
		var3 = .75;
		ascent1 = YES;
		ascent2 = NO;
		ascent3 = YES;
		factor1 = .1;
		factor2 = .2;
		factor3 = .25;

    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
	
	CGSize size = self.bounds.size;
	CGFloat min = MIN(size.width, size.height);
	CGFloat length = min * 5 / 8;
	
	CGMutablePathRef p = CGPathCreateMutable();   //right triangle
	CGPathMoveToPoint(p, NULL, 0, 0);          //lower right vertex (the right angle)
	CGPathAddLineToPoint(p, NULL, 0, length);  //upper right vertex
	CGPathAddLineToPoint(p, NULL, -length, 0); //lower left vertex
	CGPathCloseSubpath(p);
	
	CGContextRef c = UIGraphicsGetCurrentContext();
	
	//origin at th elocatoipn of the right angle
	CGContextTranslateCTM(c, (size.width + length) / 2, (size.height + length) / 2);
	//Reverse the Y axis
	CGContextScaleCTM(c, 1, -1);
	
	//var1
	if (var1 >= 1.0) {
		ascent1 = NO;
	}
	if (var1 <= 0.0) {
		ascent1 = YES;
	}
	
	if (ascent1 == YES) {
		var1 += factor1;
	} else {
		var1 -= factor1;
	}
	
	//var2
	if (var2 >= 1.0) {
		ascent2 = NO;
	}
	if (var2 <= 0.0) {
		ascent2 = YES;
	}
	
	if (ascent2 == YES) {
		var2 += factor2;
	} else {
		var2 -= factor2;
	}
	
	//var3
	if (var3 >= 1.0) {
		ascent3 = NO;
	}
	if (var3 <= 0.0) {
		ascent3 = YES;
	}
	
	if (ascent3 == YES) {
		var3 += factor3;
	} else {
		var3 -= factor3;
	}

	CGContextAddPath(c, p);
	CGContextSetRGBFillColor(c, var1, var2, var3, 1.0);
	//Light source at upper left, shadow at lower right.
	//5 is the amount of blur.  A smaller number makes a sharper shadow.
	CGContextSetShadow(c, CGSizeMake(10, -30), 5);
	CGContextFillPath(c);
	
	CGContextBeginPath(c);
	CGContextAddPath(c, p);
	CGContextSetLineWidth(c, 10);
	CGContextSetRGBStrokeColor(c, var3, var1, var2, 5);
	CGContextSetShadow(c, CGSizeMake(0, 0), 0);
	CGContextStrokePath(c);
	
[self performSelector: @selector(setNeedsDisplay) withObject: nil afterDelay: 1.0];

}


@end
