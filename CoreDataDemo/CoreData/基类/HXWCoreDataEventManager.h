//
//  HXWCoreDataEventManager.h
//  CoreDataDemo
//
//  Created by 滑现伟 on 16/4/25.
//  Copyright © 2016年 滑现伟. All rights reserved.
//

#import "HXWCoreDataManager.h"

@interface HXWCoreDataEventManager : HXWCoreDataManager

+ (HXWCoreDataEventManager *)sharedInstance;

- (void)saveContext;

/*
 *  判断是否有该数据
 */
- (BOOL)isHaveWithEntity:(NSString *)entityName attributeName:(NSString *)attributeName value:(id)value;

/*
 *  清空某一类的所有对象
 */
- (void)deleteWithEntity:(NSString *)entityName;

/*
 *  删除某一个对象
 */
- (void)deleteWithEntity:(NSString *)entityName attributeName:(NSString *)attributeName value:(id)value;

/*
 *  取出某一类所有对象
 */
- (NSArray *)selectAttributeForEntity:(NSString *)entityName;

/*
 *  取出某一类所有对象 是根据某一个值排序 出来的
 */

- (NSArray *)selectAttributeForEntity:(NSString *)entityName sortByAttributeName:(NSString *)sortDescriptorName;



/*
 *  偏移查询
 *  offset 偏移位置
 *  limit 取出的量
 */
- (NSArray *)selectAttributeForEntity:(NSString *)entityName sortByAttributeName:(NSString *)sortDescriptorName Offset:(NSInteger)offset Limit:(NSInteger)limit;
@end
