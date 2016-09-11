//
//  Utilities.swift
//  Quick&Fit
//
//  Created by Dan Gerchcovich on 9/09/2016.
//  Copyright © 2016 Dan Gerchcovich. All rights reserved.
//

import Foundation;
import UIKit;

public class Utilities {
    
    public func batteryLevel(check: Bool) {
        
        let navMaster = NavMaster();
        
        if(check == true) {
            print("Battery monitoring enabled");
            UIDevice.currentDevice().batteryMonitoringEnabled = true;
            if(UIDevice.currentDevice().batteryLevel > 0.3 && UIDevice.currentDevice().batteryLevel <= 0.4) {
                if(UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone) {
                    let batteryAlert = UIAlertController(title: "😱 Low Battery", message: "Your iPhone's battery level is currently measured at \(UIDevice.currentDevice().batteryLevel). You should consider charge your iPhone soon.", preferredStyle: UIAlertControllerStyle.Alert);
                    
                    let confirmed = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
                    
                    batteryAlert.addAction(confirmed);
                    
                    if(navMaster.presentedViewController == nil) {
                        navMaster.presentViewController(batteryAlert, animated: true, completion: nil)
                    } else {
                        navMaster.presentedViewController?.dismissViewControllerAnimated(true, completion: {()->Void in
                            navMaster.presentViewController(batteryAlert, animated: true, completion: nil);
                        });
                    }
                } else if(UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone) {
                    let batteryAlert = UIAlertController(title: "😱 Low Battery", message: "Your iPad's battery level is currently measured at \(UIDevice.currentDevice().batteryLevel). You should consider charge your iPhone soon.", preferredStyle: UIAlertControllerStyle.Alert);
                    
                    let confirmed = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
                    
                    batteryAlert.addAction(confirmed);
                    
                    if(navMaster.presentedViewController == nil) {
                        navMaster.presentViewController(batteryAlert, animated: true, completion: nil)
                    } else {
                        navMaster.presentedViewController?.dismissViewControllerAnimated(true, completion: {()->Void in
                            navMaster.presentViewController(batteryAlert, animated: true, completion: nil);
                        });
                    }
                }
            }
        }
        else {
            print("Battery monitoring disabled");
            UIDevice.currentDevice().batteryMonitoringEnabled = false;
        }
    }
}
