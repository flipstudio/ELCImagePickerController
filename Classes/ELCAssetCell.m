//
//  AssetCell.m
//
//  Created by Matt Tuzzolo on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import "ELCAssetCell.h"

@implementation ELCAssetCell

@synthesize rowAssets;
@synthesize didSelectAssetBlock;

-(id)initWithAssets:(NSArray*)_assets reuseIdentifier:(NSString*)_identifier {
    
	if(self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_identifier]) {
        
		self.rowAssets = _assets;
	}
	
	return self;
}

-(void)setAssets:(NSArray*)_assets {
	
	for(UIView *view in [self subviews]) 
    {		
		[view removeFromSuperview];
	}
	
	self.rowAssets = _assets;
}

-(void)layoutSubviews {
    
    CGRect frame;
    CGFloat padding = [ELCAssetCell cellPadding];
    frame = CGRectMake(padding, padding/2, self.bounds.size.width / 4 - 5, self.bounds.size.height - padding);
	
	for(ELCAsset *elcAsset in self.rowAssets) {
		
		[elcAsset setFrame:frame];
		[elcAsset addGestureRecognizer:[[[UITapGestureRecognizer alloc] initWithTarget:elcAsset action:@selector(toggleSelection)] autorelease]];
		[elcAsset setDidSelectAssetBlock:didSelectAssetBlock];
		[self addSubview:elcAsset];
		
		frame.origin.x = frame.origin.x + frame.size.width + padding;
	}
}

+ (CGFloat)cellPadding
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return 13.0;
    } else {
        return 4.0;
    }
}

-(void)dealloc 
{
	[rowAssets release];
	[didSelectAssetBlock release];
    
	[super dealloc];
}

@end
