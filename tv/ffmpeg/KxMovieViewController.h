//
//  ViewController.h
//  kxmovieapp
//
//  Created by Kolyvan on 11.10.12.
//  Copyright (c) 2012 Konstantin Boukreev . All rights reserved.
//
//  https://github.com/kolyvan/kxmovie
//  this file is part of KxMovie
//  KxMovie is licenced under the LGPL v3, see lgpl-3.0.txt

#import <UIKit/UIKit.h>
#import "KxMovieDecoder.h"

@protocol KxMovieViewControllerDelegate
- (void) newEPGEvent: (EPGEvent*) event;
@end


@interface KxMovieViewController : UIViewController<KxMovieDecoderDelegate>

+ (id) movieViewControllerWithContentPath: (NSString *) path;

@property (readonly) BOOL playing;
@property (readwrite, weak) id<KxMovieViewControllerDelegate> delegate;

- (void) play;

@end
