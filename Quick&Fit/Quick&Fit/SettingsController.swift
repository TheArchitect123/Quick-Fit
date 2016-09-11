//
//  SettingsController.swift
//  Quick&Fit
//
//  Created by Dan Gerchcovich on 9/09/2016.
//  Copyright © 2016 Dan Gerchcovich. All rights reserved.
//

import Foundation
import UIKit;
import MessageUI;
import CoreFoundation;
import AudioToolbox;

public class SettingsController : UITableViewController {
    
    let sectionTitles : [String] = ["",""];
    let AIItems : [String] = ["🔋 Battery Monitor"];
    let generalItems : [String] = ["📜 About","📱 Share","🔬 Report an issue","🤔 Send Feedback", "🎁 More By Alpha Genius","☠️ Automatic Crash Reports"];
    
    //battery controller
    private func batteryController(title: String, message: String) {
        let battery = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert);
        
        let utility = Utilities();
        let confirmed = UIAlertAction(title: "Enabled", style: UIAlertActionStyle.Default, handler: {(Action: UIAlertAction)->Void in
            utility.batteryLevel(true);
        });
        
        let denied = UIAlertAction(title: "Disabled", style: UIAlertActionStyle.Cancel, handler: {(Action: UIAlertAction)->Void in
            utility.batteryLevel(false);
        });
        
        battery.addAction(confirmed);
        battery.addAction(denied);
        
        if(self.presentedViewController == nil) {
            self.presentViewController(battery, animated: true, completion:nil);
        }
        else {
            self.presentedViewController?.dismissViewControllerAnimated(true, completion: {()->Void in
                self.presentViewController(battery, animated: true, completion: nil);
            });
        }
    }
    
    //about controller
    private func aboutController(title: String, message: String) {
        let about = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert);
        
        let confirmed = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
        
        about.addAction(confirmed);
        
        if(self.presentedViewController == nil) {
            self.presentViewController(about, animated: true, completion:nil);
        }
        else {
            self.presentedViewController?.dismissViewControllerAnimated(true, completion: {()->Void in
                self.presentViewController(about, animated: true, completion: nil);
            });
        }
    }
    
    //Share controller
    private func shareController(title: String, message: String) {
        let share = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert);
        
        let facebookAction = UIAlertAction(title: "Facebook", style: UIAlertActionStyle.Default, handler: {(Action: UIAlertAction)->Void in
            
            let messageURL = NSURL(string: "");
            
            if(UIApplication.sharedApplication().canOpenURL(messageURL!) == true) {
                UIApplication.sharedApplication().openURL(messageURL!);
            }
            else {
                let errorController = UIAlertController(title: "No internet connection detected", message: "Cannot direct you to facebook. Check your internet connection", preferredStyle: UIAlertControllerStyle.Alert);
                let confirmed = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
                
                errorController.addAction(confirmed);
                
                if(self.presentedViewController == nil) {
                    self.presentViewController(errorController, animated: true, completion:nil);
                }
                else {
                    self.presentedViewController?.dismissViewControllerAnimated(true, completion: {()->Void in
                        self.presentViewController(errorController, animated: true, completion: nil);
                    });
                }
            }
        });
        
        let twitterAction = UIAlertAction(title: "Twitter", style: UIAlertActionStyle.Default, handler: {(Action: UIAlertAction) -> Void in
            let messageURL = NSURL(string: "");
            
            if(UIApplication.sharedApplication().canOpenURL(messageURL!) == true) {
                UIApplication.sharedApplication().openURL(messageURL!);
            }
            else {
                let errorController = UIAlertController(title: "No internet connection detected", message: "Cannot direct you to facebook. Check your internet connection", preferredStyle: UIAlertControllerStyle.Alert);
                let confirmed = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
                
                errorController.addAction(confirmed);
                
                if(self.presentedViewController == nil) {
                    self.presentViewController(errorController, animated: true, completion:nil);
                }
                else {
                    self.presentedViewController?.dismissViewControllerAnimated(true, completion: {()->Void in
                        self.presentViewController(errorController, animated: true, completion: nil);
                    });
                }
            }
        });
        
        let emailFriendAction = UIAlertAction(title: "Email a friend", style: UIAlertActionStyle.Default, handler: {(Action: UIAlertAction)->Void in
            
            let mail = MFMailComposeViewController();
            if(MFMailComposeViewController.canSendMail() == true) {
                self.presentViewController(mail, animated: true, completion: nil);
            }
            else {
                let errorController = UIAlertController(title: "Cannot open Message App", message: "Seems that your device is denied to send messages", preferredStyle: UIAlertControllerStyle.Alert);
                let confirmed = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
                
                errorController.addAction(confirmed);
                
                if(self.presentedViewController == nil) {
                    self.presentViewController(errorController, animated: true, completion:nil);
                }
                else {
                    self.presentedViewController?.dismissViewControllerAnimated(true, completion: {()->Void in
                        self.presentViewController(errorController, animated: true, completion: nil);
                    });
                }
            }
        });
        let textAFriendAction = UIAlertAction(title: "Text a friend", style: UIAlertActionStyle.Default, handler: {(Action: UIAlertAction)->Void in
            let textFriend = NSURL(string: "sms:");
            
            if(UIApplication.sharedApplication().canOpenURL(textFriend!) == true) {
                UIApplication.sharedApplication().openURL(textFriend!);
            }
            else {
                let errorController = UIAlertController(title: "Cannot open Message App", message: "Seems that your device is denied to send messages", preferredStyle: UIAlertControllerStyle.Alert);
                let confirmed = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
                
                errorController.addAction(confirmed);
                
                if(self.presentedViewController == nil) {
                    self.presentViewController(errorController, animated: true, completion:nil);
                }
                else {
                    self.presentedViewController?.dismissViewControllerAnimated(true, completion: {()->Void in
                        self.presentViewController(errorController, animated: true, completion: nil);
                    });
                }
            }
        });
        let denied = UIAlertAction(title: "Maybe Later", style: UIAlertActionStyle.Default, handler: nil);
        
        share.addAction(facebookAction);
        share.addAction(twitterAction);
        share.addAction(emailFriendAction);
        share.addAction(textAFriendAction);
        share.addAction(denied);
        
        
        if(self.presentedViewController == nil) {
            self.presentViewController(share, animated: true, completion:nil);
        }
        else {
            self.presentedViewController?.dismissViewControllerAnimated(true, completion: {()->Void in
                self.presentViewController(share, animated: true, completion: nil);
            });
        }
    }
    
    
    
    
    //report an issue controller
    private func reportController(title: String, message: String) {
        let report = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert);
        
        let confirmed = UIAlertAction(title: "Send Email?", style: UIAlertActionStyle.Default, handler: {(Action: UIAlertAction)-> Void in
            
            let mail = MFMailComposeViewController();
            if(MFMailComposeViewController.canSendMail() == true) {
                mail.setToRecipients(["dan.developer789@gmail.com"]);
                self.presentViewController(mail, animated: true, completion: nil);
            }
            else {
                let errorController = UIAlertController(title: "Cannot open Message App", message: "Seems that your device is denied to send messages", preferredStyle: UIAlertControllerStyle.Alert);
                let confirmed = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
                
                errorController.addAction(confirmed);
                
                if(self.presentedViewController == nil) {
                    self.presentViewController(errorController, animated: true, completion:nil);
                }
                else {
                    self.presentedViewController?.dismissViewControllerAnimated(true, completion: {()->Void in
                        self.presentViewController(errorController, animated: true, completion: nil);
                    });
                }
            }});
        
        let denied = UIAlertAction(title: "Never Mind", style: UIAlertActionStyle.Cancel, handler: nil);
        
        
        report.addAction(confirmed);
        report.addAction(denied);
        
        if(self.presentedViewController == nil) {
            self.presentViewController(report, animated: true, completion:nil);
        }
        else {
            self.presentedViewController?.dismissViewControllerAnimated(true, completion: {()->Void in
                self.presentViewController(report, animated: true, completion: nil);
            });
        }
    }
    
    
    
    
    //send feedback an issue controller
    private func sendFeedbackController(title: String, message: String) {
        let report = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert);
        
        let confirmed = UIAlertAction(title: "Send Email?", style: UIAlertActionStyle.Default, handler: {(Action: UIAlertAction)-> Void in
            
            let mail = MFMailComposeViewController();
            if(MFMailComposeViewController.canSendMail() == true) {
                mail.setToRecipients(["dan.developer789@gmail.com"]);
                self.presentViewController(mail, animated: true, completion: nil);
            }
            else {
                let errorController = UIAlertController(title: "Cannot open Message App", message: "Seems that your device is denied to send messages", preferredStyle: UIAlertControllerStyle.Alert);
                let confirmed = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
                
                errorController.addAction(confirmed);
                
                if(self.presentedViewController == nil) {
                    self.presentViewController(errorController, animated: true, completion:nil);
                }
                else {
                    self.presentedViewController?.dismissViewControllerAnimated(true, completion: {()->Void in
                        self.presentViewController(errorController, animated: true, completion: nil);
                    });
                }
            }});
        
        let denied = UIAlertAction(title: "Never Mind", style: UIAlertActionStyle.Cancel, handler: nil);
        
        
        report.addAction(confirmed);
        report.addAction(denied);
        
        if(self.presentedViewController == nil) {
            self.presentViewController(report, animated: true, completion:nil);
        }
        else {
            self.presentedViewController?.dismissViewControllerAnimated(true, completion: {()->Void in
                self.presentViewController(report, animated: true, completion: nil);
            });
        }
    }
    
    
    //report an issue controller
    private func moreAppsController(title: String, message: String) {
        //pushes a controller containing a list of all of my other apps
    }
    
    
    private func autoCrashReport(title: String, message: String) {
        let crashReport = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert);
        
        let confirmed = UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default, handler: {(Action: UIAlertAction)-> Void in
            //auto crash reports are handled here
            
            
        });
        
        let denied = UIAlertAction(title: "No", style: UIAlertActionStyle.Cancel, handler: {(Action: UIAlertAction) -> Void in
            //turns off auto crash report
        });
        
        crashReport.addAction(confirmed);
        crashReport.addAction(denied);
        
        if(self.presentedViewController == nil) {
            self.presentViewController(crashReport, animated: true, completion:nil);
        }
        else {
            self.presentedViewController?.dismissViewControllerAnimated(true, completion: {()->Void in
                self.presentViewController(crashReport, animated: true, completion: nil);
            });
        }
    }
    
    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0:
            return self.AIItems.count;
            break;
        default:
            return self.generalItems.count;
            break;
        }
        return 0;
    }
    
    public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch(indexPath.section) {
        case 0:
            if(indexPath.row == 0) {
                if(UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone) {
                    batteryController("Battery monitor", message: "Would you like to enable battery monitoring on your iPhone. This feature will enable your iPhone to notify you when it runs low on battery sooner than the default iOS version.")
                } else if(UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
                    batteryController("Battery monitor", message: "Would you like to enable battery monitoring on your iPad. This feature will enable your iPad to notify you when it runs low on battery sooner than the default iOS version.")
                }
            }
            break;
        default:
            switch(indexPath.row) {
            case 0:
                aboutController("Welcome to Quick&Fit", message: "Welcome \(UIDevice.currentDevice().name). This application will aid you in your journey of getting the fit body you always wanted. It records all your progress and displays how much you have achieved");
                break;
            case 1:
                shareController("Share this app?", message: "Tell your friends about this app");
                break;
            case 2:
                reportController("Any problems?", message: "Send me an email and I will address the bug ASAP");
                break;
            case 3:
                sendFeedbackController("Any suggestions?", message: "If you have any improvements you think I should implement. Then email me.");
                break;
            case 4:
                print("More by alpha genius")
                break;
            default:
                if(UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone) {
                    autoCrashReport("Send auto crash reports?", message: "With this feature enabled, whenever your app crashes for whatever reason, your iPhone will send a crash report to my email so I can address the issue. This will help me to improve your user experience. Would you like to enable automatic crash reports?");
                } else if(UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
                    autoCrashReport("Send auto crash reports?", message: "With this feature enabled, whenever your app crashes for whatever reason, your iPad will send a crash report to my email so I can address the issue. This will help me to improve your user experience. Would you like to enable automatic crash reports?");
                }
                break;
            }
            break;
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
    }
    
    public override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2;
    }
    
    public override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section) {
        case 0:
            return "🔌 AI Settings";
            break;
        default:
            return "⚙ General Settings";
            break;
        }
    }
    
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var settingsCell = tableView.dequeueReusableCellWithIdentifier("String");
        
        if(settingsCell == nil) {
            settingsCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier:"String");
        }
        
        switch(indexPath.section) {
        case 0: //AI settings
            settingsCell?.textLabel?.text = self.AIItems[indexPath.row];
            settingsCell?.textLabel?.textColor = UIColor.blackColor();
            
            return settingsCell!;
            break;
        default:
            settingsCell?.textLabel?.text = self.generalItems[indexPath.row];
            settingsCell?.textLabel?.textColor = UIColor.blackColor();
            
            settingsCell?.detailTextLabel?.text = ">";
            settingsCell?.detailTextLabel?.textColor = UIColor.grayColor();
            
            return settingsCell!;
            break;
        }
        return settingsCell!;
    }
    
    public override func viewDidLoad() {
        self.extendedLayoutIncludesOpaqueBars = false;
        self.edgesForExtendedLayout = UIRectEdge.None;
        self.automaticallyAdjustsScrollViewInsets = true;
        
        if(UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone) {
            self.tableView.rowHeight = 70.0;
        } else if(UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
            self.tableView.rowHeight = 120.0;
        }
    }
}