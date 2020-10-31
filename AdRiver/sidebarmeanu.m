//
//  sidebarmeanu.m
//  Nvest
//
//  Created by Apple on 16/05/2017.
//  Copyright © 2017 SystemOrigami. All rights reserved.
//

#import "sidebarmeanu.h"

@interface sidebarmeanu ()

@end
NSArray *menuItems;
@implementation sidebarmeanu

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    screenWidth = [[UIScreen mainScreen] bounds].size.width;
     menuItems = @[@"home",@"profile",@"account",@"logout"];
    [self.navigationController setNavigationBarHidden:YES];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return menuItems.count;
}
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row==3){
        
//        [self requestLogout];
        
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        WebViewVC * feedbackVC = (WebViewVC*)[storyboard   instantiateViewControllerWithIdentifier:@"gowebview"] ;
        
//        [defaults setObject:@"https://anchor.fm/jocelyne-firmin" forKey:WEB_URL];
//        [defaults synchronize];
        
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *startview = [story instantiateInitialViewController];
        startview.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [[self presentedViewController] dismissViewControllerAnimated:NO completion:nil];

        [self presentViewController:startview animated:NO completion:nil];
        
        
    }
    
    
    
    
    
   

    
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return screenWidth * 0.16;
//}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = [menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // cell.textLabel.text=@"lable";
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
