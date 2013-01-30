//
//  ShareViewController.m
//  ShareStatus
//
//  Created by Shreekant Pawar on 16/01/13.
//  Copyright (c) 2013 the1pawan. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareFacebook:(id)sender {
    if(NSClassFromString(@"SLComposeViewController") != nil) {
        SLComposeViewController *facebookController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            SLComposeViewControllerCompletionHandler __block completionHandler = ^(SLComposeViewControllerResult result) {
                [facebookController dismissViewControllerAnimated:YES completion:nil];
                switch(result) {
                    case SLComposeViewControllerResultDone: {
                        NSLog(@"Succes Posted....");
                    }
                        break;
                    default:{
                        NSLog(@"failed Cancelled.....");
                    }
                        break;
                }
            };
            
            [facebookController addImage:[UIImage imageNamed:@"data.png"]];
            [facebookController setInitialText:@"hahah sharing it.. [MUST Share] [MUST See]."];
            [facebookController setCompletionHandler:completionHandler];
            [self presentViewController:facebookController animated:YES completion:nil];
        }
    }

}

- (IBAction)shareTwitter:(id)sender {
    if(NSClassFromString(@"SLComposeViewController") != nil) {
        SLComposeViewController *twitterController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
            SLComposeViewControllerCompletionHandler __block completionHandler = ^(SLComposeViewControllerResult result) {
                [twitterController dismissViewControllerAnimated:YES completion:nil];
                switch(result) {
                    case SLComposeViewControllerResultDone: {
                        NSLog(@"Posted....");
                    }
                        break;
                    default:{
                        NSLog(@"Cancelled.....");
                    }
                        break;
                }
            };
            
            [twitterController addImage:[UIImage imageNamed:@"data.png"]];
            [twitterController setInitialText:@" sharing it.. [MUST Share] [MUST See] wonder images."];
            [twitterController setCompletionHandler:completionHandler];
            [self presentViewController:twitterController animated:YES completion:nil];
        }
    } else if(NSClassFromString(@"TWTweetComposeViewController") != nil) {
        TWTweetComposeViewController *twitterController = [[TWTweetComposeViewController alloc] init];
        [twitterController addImage:[UIImage imageNamed:@"data.png"]];
        [twitterController setInitialText:@"sharing it.. [MUST Share] [MUST See] awesome images."];
        
        [self presentViewController:twitterController animated:YES completion:nil];
        twitterController.completionHandler = ^(TWTweetComposeViewControllerResult res) {
            [self dismissViewControllerAnimated:YES completion:nil];
        };
    }
}
@end
