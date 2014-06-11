//
//  CircularPicker.m
//  CircularColorPicker
//
//  Created by Janusz Chudzynski on 6/17/13.
//  Copyright (c) 2013 Janusz Chudzynski. All rights reserved.
//
/*
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 1. Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 3. All advertising materials mentioning features or use of this software
 must display the following acknowledgement:
 This product includes software developed by the Janusz Chudzynski.
 4. Neither the name of the Janusz Chudzynski nor the
 names of its contributors may be used to endorse or promote products
 derived from this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY Janusz Chudzynski ''AS IS'' AND ANY
 EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL Janusz Chudzynski BE LIABLE FOR ANY
 DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "CircularPicker.h"


@interface CircularPicker(){
    CGMutablePathRef redPart;
    CGMutablePathRef greenPart;
    CGMutablePathRef bluePart;
    CGMutablePathRef yellowPart;
    
    CGMutablePathRef blackPart;
    CGMutablePathRef grayPart;
    CGMutablePathRef whitePart;
    CGMutablePathRef orangePart;
    
    ColorFromPickerBlock touchHandler;
        
}
@end

@implementation CircularPicker



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
        self.userInteractionEnabled = YES;
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame andCompletionHandler:(ColorFromPickerBlock)completionBlock
{
    self = [self initWithFrame:frame];
    if (self) {
        // Initialization code
        touchHandler = completionBlock;
    }
    return self;
}




// Only override drawRect: if you perform custom drawing.

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor * clearColor = [UIColor clearColor];
    CGContextSetFillColorWithColor(context, clearColor.CGColor);
    CGContextFillRect(context, self.bounds);
    
    UIColor * redColor = [UIColor redColor];
    UIColor * greenColor = [UIColor greenColor];
    UIColor * blueColor = [UIColor blueColor];
    UIColor * yellowColor = [UIColor yellowColor];
    
    UIColor * blackColor = [UIColor blackColor];
    UIColor * grayColor = [UIColor grayColor];
    UIColor * whiteColor = [UIColor whiteColor];
    UIColor * orangeColor = [UIColor orangeColor];
    
    //get biggest rect in the bounds.
    float srednica = 0;
    srednica = self.bounds.size.height > self.bounds.size.width ? self.bounds.size.width: self.bounds.size.height;
    srednica = 0.95 * srednica;
    float cx = (self.bounds.size.width - srednica)/2.0;
    float cy = (self.bounds.size.height - srednica)/2.0;
    
    NSLog(@" %f %f %f",cx,cy,srednica);
    
    CGRect boundingBox =  CGRectMake(cx, cy, srednica, srednica);
    CGContextMoveToPoint(context, self.center.x, self.center.y);
    CGContextSetFillColorWithColor(context, blackColor.CGColor);
  
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 5), 10.0, [[UIColor darkGrayColor ]CGColor]);
    CGContextSetFillColorWithColor(context, blackColor.CGColor);
    CGContextFillEllipseInRect(context, boundingBox);
    CGContextRestoreGState(context);
    

 
    //get a center of the image
    CGPoint center = self.center;
    redPart = [self createPath:CGPathCreateMutable() withAngle:0 andAngle:45 andCenter:center andRadius:srednica/2.0];
    greenPart = [self createPath:CGPathCreateMutable() withAngle:45 andAngle:90 andCenter:center andRadius:srednica/2.0];
    bluePart = [self createPath:CGPathCreateMutable() withAngle:90 andAngle:45 andCenter:center andRadius:srednica/2.0];
    yellowPart = [self createPath:CGPathCreateMutable() withAngle:135 andAngle:180 andCenter:center andRadius:srednica/2.0];
    blackPart = [self createPath:CGPathCreateMutable() withAngle:180 andAngle:225 andCenter:center andRadius:srednica/2.0];
    grayPart = [self createPath:CGPathCreateMutable() withAngle:225 andAngle:270 andCenter:center andRadius:srednica/2.0];
    whitePart = [self createPath:CGPathCreateMutable() withAngle:270 andAngle:315 andCenter:center andRadius:srednica/2.0];
    orangePart = [self createPath:CGPathCreateMutable() withAngle:315 andAngle:360 andCenter:center andRadius:srednica/2.0];
    
    CGContextSetShadowWithColor(context, CGSizeMake(0, 3), 10.0, [[UIColor lightGrayColor ]CGColor]);
    CGContextAddPath(context, greenPart);
    CGContextSetFillColorWithColor(context, [greenColor CGColor]);
    CGContextFillPath(context);
    
    
    CGContextAddPath(context, bluePart);
    CGContextSetFillColorWithColor(context, [blueColor CGColor]);
    CGContextFillPath(context);

    CGContextAddPath(context, yellowPart);
    CGContextSetFillColorWithColor(context, [yellowColor CGColor]);
    CGContextFillPath(context);

    CGContextAddPath(context, blackPart);
    CGContextSetFillColorWithColor(context, [blackColor CGColor]);
    CGContextFillPath(context);

    CGContextAddPath(context, grayPart);
    CGContextSetFillColorWithColor(context, [grayColor CGColor]);
    CGContextFillPath(context);
    
    CGContextAddPath(context, whitePart);
    CGContextSetFillColorWithColor(context, [whiteColor CGColor]);
    CGContextFillPath(context);

    CGContextAddPath(context, orangePart);
    CGContextSetFillColorWithColor(context, [orangeColor CGColor]);
    CGContextFillPath(context);    

    CGContextAddPath(context, redPart);
    CGContextSetFillColorWithColor(context, [redColor CGColor]);
    CGContextFillPath(context);

    
    
}

-(CGMutablePathRef)createPath:(CGMutablePathRef)path withAngle:(float)angle1 andAngle:(float)angle2 andCenter:(CGPoint)center andRadius:(float)radius{
    CGPathMoveToPoint(redPart, &CGAffineTransformIdentity, center.x, center.y);
    //get a current angle. for now it's hardcoded
    
    radius = 0.97*radius;
    //0 and 45
    angle1 =degreesToRadians(angle1);
    angle2 =degreesToRadians(angle2);
    
    CGPoint start = [self pointOnCircleWithCenter:center radius:radius andAngle:angle1];
    CGPoint end = [self pointOnCircleWithCenter:center radius:radius andAngle:angle2];
    
    CGPathMoveToPoint(path, &CGAffineTransformIdentity, center.x, center.y);
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, start.x,start.y);
    CGPathAddArc(path, &CGAffineTransformIdentity, center.x, center.y, radius, angle1,angle2, false);
    
     CGPathAddLineToPoint(path, &CGAffineTransformIdentity, end.x, end.y);
        CGPathCloseSubpath(path);
    return path;
}

/*calculates coordinates of circle's point*/
-(CGPoint)pointOnCircleWithCenter:(CGPoint)center radius:(int)r andAngle:(float)a{
    float x = center.x + r * cos(a);
    float y = center.y + r * sin(a);
    return CGPointMake(x, y);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchLoc = [touch locationInView:self];
    
    
    if(CGPathContainsPoint(redPart,  &CGAffineTransformIdentity, touchLoc, false)){
        __block UIColor * redColor = [UIColor redColor];
       touchHandler(redColor);
        NSLog(@"Red");
        
    }
    else if(CGPathContainsPoint(greenPart,  &CGAffineTransformIdentity, touchLoc, false)){
        touchHandler([UIColor greenColor]);
        NSLog(@"Green");
    }
    else if(CGPathContainsPoint(orangePart,  &CGAffineTransformIdentity, touchLoc, false)){
        touchHandler([UIColor orangeColor]);
        NSLog(@"orange");
        
    }
    else if(CGPathContainsPoint(whitePart,  &CGAffineTransformIdentity, touchLoc, false)){
        touchHandler([UIColor whiteColor]);
        NSLog(@"White");
    }
    else if(CGPathContainsPoint(grayPart,  &CGAffineTransformIdentity, touchLoc, false)){
        touchHandler([UIColor grayColor]);
        NSLog(@"Gray");
    }
    else if(CGPathContainsPoint(blackPart,  &CGAffineTransformIdentity, touchLoc, false)){
        touchHandler([UIColor blackColor]);
        NSLog(@"Black");
  
    }
    else if(CGPathContainsPoint(yellowPart,  &CGAffineTransformIdentity, touchLoc, false)){
        touchHandler([UIColor yellowColor]);
        NSLog(@"Yellow");
    }
    else if(CGPathContainsPoint(bluePart,  &CGAffineTransformIdentity, touchLoc, false)){
        NSLog(@"Blue");
        touchHandler([UIColor blueColor]);
    }
    
}


@end
