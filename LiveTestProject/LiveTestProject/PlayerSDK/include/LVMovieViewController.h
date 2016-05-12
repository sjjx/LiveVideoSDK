//
//  ViewController.h
//  LVmovieapp
//
//  Created by lv on 11.10.12.
//  Copyright (c) 2012 lv . All rights reserved.
//
//  this file is part of LVMovie
//  LVMovie is licenced under the LGPL v3, see lgpl-3.0.txt

#import <UIKit/UIKit.h>

@class LVMovieDecoder;

extern NSString * const LVMovieParameterMinBufferedDuration;    // Float
extern NSString * const LVMovieParameterMaxBufferedDuration;    // Float
extern NSString * const LVMovieParameterDisableDeinterlacing;   // BOOL

@interface LVMovieViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

+ (id) movieViewControllerWithContentPath: (NSString *) path
                               parameters: (NSDictionary *) parameters;

@property (readonly) BOOL playing;

- (void) play;
- (void) pause;

@end
