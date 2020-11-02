//
//  ScanViewController.h
//  ZQScanViewController
//
//  Created by 肖兆强 on 2018/1/26.
//  Copyright © 2018年 JWZT. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ScanDelegate <NSObject>

-(void)scanResult:(NSString *)result;

@end
@interface ScanViewController : UIViewController
@property(nonatomic,assign)id<ScanDelegate>delegate;
@end
