//
//  ViewController.m
//  CoreDataDemo
//
//  Created by 滑现伟 on 16/4/25.
//  Copyright © 2016年 滑现伟. All rights reserved.
//

#import "ViewController.h"
#import "HXWModel.h"
#import "NSManagedObjectModel+HXWManagedObjectModel.h"
#import "HXWCoreDataEventManager.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation ViewController
- (IBAction)del:(id)sender {
    [self.array  addObjectsFromArray: [[HXWCoreDataEventManager sharedInstance] selectAttributeForEntity:@"HXWModel" sortByAttributeName:@"keyID" Offset:2 Limit:12]];
    NSLog(@"%@", self.array);

//    [[HXWDao shareInstance] deleteWithEntity:@"HXWModel" secuessed:^{
//        
//    } error:^(NSError *error) {
//        NSLog(@"删除 %@",error);
//
//    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.array = [[NSMutableArray alloc] init];
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    dispatch_async(globalQueue, ^{
        
        NSManagedObjectContext *context = [[HXWCoreDataEventManager sharedInstance] managedObjectContext];
        [context performBlockAndWait:^{
           [self.array  addObjectsFromArray: [[HXWCoreDataEventManager sharedInstance] selectAttributeForEntity:@"HXWModel" sortByAttributeName:@"keyID" ]];
        }];
        
        dispatch_async(mainQueue, ^{
            NSLog(@"%@", self.array);
            
            
        });
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
