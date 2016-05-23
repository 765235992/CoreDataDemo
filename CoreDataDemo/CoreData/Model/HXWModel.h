//
//  HXWModel.h
//  CoreDataDemo
//
//  Created by 滑现伟 on 16/4/25.
//  Copyright © 2016年 滑现伟. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface HXWModel : NSManagedObject
@property (nonatomic ,strong) NSString *name;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSNumber *keyID;
@end
