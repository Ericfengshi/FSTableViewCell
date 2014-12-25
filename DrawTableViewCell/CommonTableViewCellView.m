//
//  CommonTableViewCellView.m
//  DrawTableViewCell https://github.com/Ericfengshi/FSTableViewCell
//
//  Created by fengs on 14-9-29.
//  Copyright (c) 2014年 fengs. All rights reserved.
//

#import "CommonTableViewCellView.h"

#define topBottomSpace_ 10.0f
#define labelSpace_ 100.0f
#define contentWidthSpace_ self.frame.size.width - labelSpace_ - leftSpace_ - rightSpace_
#define contentHeightSpace_ 20.0f
#define leftSpace_ 20.0f
#define rightSpace_ 5.0f

@implementation CommonTableViewCellView
@synthesize cellViewColor = _cellViewColor;
@synthesize labelSpace = _labelSpace;
@synthesize viewHeight = _viewHeight;

-(void)dealloc{
    
    self.cellViewColor = nil;
    [super dealloc];
}

/*
 * init
 * @param UITableViewCell frame
 * @param keyArray : labelArray
 * @param valueArray : contentArray
 * @return id
 */
- (id)initWithFrame:(CGRect)frame keyArray:(NSArray*)keyArray valueArray:(NSArray*)valueArray;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labelSpace = labelSpace_;
        self.cellViewColor = [UIColor clearColor];
        
        self.viewHeight = topBottomSpace_;
        int count = keyArray.count>valueArray.count ? keyArray.count :valueArray.count;
        for (int i = 0;i < count; i++) {
            self.viewHeight = [self rectUIView:self.viewHeight labelText:[keyArray objectAtIndex:i] text:[valueArray objectAtIndex:i]];
        }
        self.viewHeight += topBottomSpace_;
        // 横 分割线
        UIImageView *imgView_H = [[UIImageView alloc]initWithFrame:CGRectMake( 0, self.viewHeight-1, self.frame.size.width, 1)];
        imgView_H.backgroundColor = [UIColor colorWithRed:221/255.0f green:221/255.0f blue:221/255.0f alpha:1.0];
        [self addSubview:imgView_H];
        [imgView_H release];

        [self setFrame:CGRectMake(0, frame.origin.y, self.frame.size.width, self.viewHeight)];
    }
    return self;
}

/*
 * 重置高度
 * @param text : content
 * @param width
 * @param height : default height
 * @return CGFloat
 */
-(CGFloat)resizeViewHeight:(NSString *)text width:(CGFloat)width height:(CGFloat)height{
    
    CGSize constraint = CGSizeMake(width, 2000.0f);
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:13.0f] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    return size.height>height?size.height:height;
}

/*
 * UITableViewCell 最下端高度
 * @param labelText : label
 * @param text : content
 * @return CGFloat
 */
-(CGFloat)rectUIView:(CGFloat)height labelText:(NSString*)labelText text:(NSString*)text{
    
    CGFloat textValueHeight = [self resizeViewHeight:text width:contentWidthSpace_ height:contentHeightSpace_];
    CGFloat labelTextHeight = [self resizeViewHeight:labelText width:self.labelSpace height:contentHeightSpace_];
    CGFloat cellHeight = textValueHeight>labelTextHeight ? textValueHeight : labelTextHeight;
    
    UILabel *label = [self rectUILabel:labelText rect:CGRectMake(leftSpace_, height, self.labelSpace, cellHeight)];
    [self addSubview:label];
    
    UILabel *textValueLabel = [self rectUILabel:text rect:CGRectMake(self.labelSpace + leftSpace_, height, contentWidthSpace_, cellHeight)];
    [self addSubview:textValueLabel];
    
    return height + cellHeight ;
}

/*
 * UILabel 生成
 * @param text : text
 * @param rect : CGRect
 * @return UILabel
 */
- (UILabel *)rectUILabel:(NSString *)text rect:(CGRect)rect{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = self.cellViewColor;
    label.textAlignment = UITextAlignmentLeft;
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:13.0];
    label.text = text;
    return [label autorelease];
}

/*
 * 去掉下划线
 */
- (void)removeUnderLine{
    
    if (self.subviews.count > 0) {
        [[[self subviews] lastObject] removeFromSuperview];
    }
}
@end
