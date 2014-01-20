//
//  TodoListViewController.m
//  todoapp
//
//  Created by Rakhesh on 1/16/14.
//  Copyright (c) 2014 Rakhesh. All rights reserved.
//

#import "TodoListViewController.h"
#import "EditableCell.h"
#import <objc/runtime.h>


static char indexPathKey;
@interface TodoListViewController ()

@end

@implementation TodoListViewController
NSUserDefaults *defaults;

- (void)synchronizeUserDefaults
{
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:toDoListArray forKey:@"todoList"];
    [defaults synchronize];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"textFieldShouldEndEditing");
    @try{
        //        NSLog(textField.text);
        NSIndexPath *indexPath = objc_getAssociatedObject(textField, &indexPathKey);
        [toDoListArray replaceObjectAtIndex:indexPath.row withObject:textField.text];
        [self synchronizeUserDefaults];
        
        
    }
    @catch(NSException * e){
        
    }
    return YES;
}

//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//    @try{
//        NSLog(textField.text);
//        NSIndexPath *indexPath = objc_getAssociatedObject(textField, &indexPathKey);
//        [toDoListArray replaceObjectAtIndex:indexPath.row withObject:textField.text];
//        [self synchronizeUserDefaults];
//
//
//    }
//    @catch(NSException * e){
//
//    }
//
//}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    defaults = [NSUserDefaults standardUserDefaults];
    toDoListArray = [[defaults objectForKey:@"todoList"] mutableCopy];
    if (Nil == toDoListArray){
        toDoListArray = [[NSMutableArray alloc] init];
        //[toDoListArray addObject:@"one"];
    }
    [defaults synchronize];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd  target:self action:@selector(addNewTodo)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) addNewTodo
{
    
    [toDoListArray addObject:@""];
    [self synchronizeUserDefaults];
    [self.tableView reloadData];
    // [self.tableView.]
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return toDoListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"EditableCell";
    EditableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.todoItemText.text = [toDoListArray objectAtIndex:indexPath.row];
    objc_setAssociatedObject(cell.todoItemText, &indexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    cell.todoItemText.delegate = self;
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [toDoListArray removeObjectAtIndex:indexPath.row];
        [self synchronizeUserDefaults];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        NSLog(@"Edit cell is called");
    }
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSLog(@"moveRowAtIndexPath");
    [self synchronizeUserDefaults];
    NSString *swapString = [toDoListArray objectAtIndex:fromIndexPath.row];
    [toDoListArray replaceObjectAtIndex:fromIndexPath.row withObject:[toDoListArray objectAtIndex:toIndexPath.row]];
    [toDoListArray replaceObjectAtIndex:toIndexPath.row withObject:swapString];
    [self synchronizeUserDefaults];
    
    
    
}
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

- (IBAction)TEST:(id)sender {
}
@end
