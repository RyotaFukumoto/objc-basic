//
//  FavoriteProgrammingLanguage.h
//  ex1-1-5
//
//  Created by ryota on 2016/12/21.
//  Copyright © 2016年 ryota. All rights reserved.
//

#ifndef FavoriteProgrammingLanguage_h
#define FavoriteProgrammingLanguage_h
#import "FavoriteProgrammingLanguageDelegate.h"
#import <Foundation/Foundation.h>

@interface FavoriteProgrammingLanguage : NSObject
@property(nonatomic,weak) id<FavoriteProgrammingLanguageDelegate> delegate;

-(void)joinInternship;

@end

#endif /* FavoriteProgrammingLanguage_h */

