//
//  TableViewController.m
//  TableViewAutoLayout66plus
//
//  Created by Joshua Motley on 4/12/16.
//  Copyright © 2016 Motley. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIView *viewOnTable;

@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomButtonConstraint;

@property (strong, nonatomic) IBOutlet UITextField *textFieldRound;


@property NSLayoutConstraint *anotherBottomButtonConstraint;



@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardOnScreen:) name:UIKeyboardWillShowNotification object:nil];
    
    [self.textFieldRound addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventEditingDidEnd];
    
    self.viewOnTable.frame = CGRectMake(self.viewOnTable.frame.origin.x, self.viewOnTable.frame.origin.y, self.viewOnTable.frame.size.width, self.view.frame.size.height-132);
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    NSString *cellID;
//    switch ([indexPath row]) {
//        case 0:
//            cellID = @"cell";
//            break;
//        case 1:
//            cellID = @"cell";
//            break;
//        case 2:
//            cellID = @"buttonCell";
//            break;
//        default:
//            break;
//    }
//    
//    NSLog(@"%@",cellID);
    
    
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];

    // Configure the cell...
    return cell;
}

-(void)keyboardOnScreen:(NSNotification *)notification
{
    NSDictionary *info = notification.userInfo;
    NSValue *value = info[UIKeyboardFrameEndUserInfoKey];
    
    CGRect rawFrame = [value CGRectValue];
    CGRect keyboardFrame = [self.view convertRect:rawFrame fromView:nil];
    
    CGFloat keyboardHeight = keyboardFrame.size.height;
    
    NSLog(@"%f", keyboardHeight);
    
    self.bottomButtonConstraint.active = NO;
    
    [self.view layoutIfNeeded];
    
    [UIView animateWithDuration:1.0f animations:^{
       self.anotherBottomButtonConstraint =[NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.viewOnTable attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-keyboardHeight-10];
        self.anotherBottomButtonConstraint.active = YES;
        
        [self.view layoutIfNeeded];
    }];
}


- (IBAction)buttonAction:(id)sender {
    [self.view endEditing:YES];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    self.anotherBottomButtonConstraint.active = NO;
    self.bottomButtonConstraint.active = YES;
    
    
    [self.view layoutIfNeeded];
        NSLog(@"Hidden");
    
    
    
}





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
