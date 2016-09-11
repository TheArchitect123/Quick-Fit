//
//  TabMaster.swift
//  Quick&Fit
//
//  Created by Dan Gerchcovich on 9/09/2016.
//  Copyright © 2016 Dan Gerchcovich. All rights reserved.
//


import UIKit


public class TabMaster: UITabBarController, UITabBarControllerDelegate  {
    
    var searchButtonContainer : UIBarButtonItem = UIBarButtonItem()
    var homingBeaconContainer : UIBarButtonItem = UIBarButtonItem();

    var workoutStart = WorkoutStartController();
    
    func searchPressed() {
        //here the user will enter the address he wants to get to and the fitness workout will start to work
        print("Search button pressed")
    }
    
    func homingBeaconPressed() {
        let homingBeacon = UIAlertController(title: "Homing Beacon", message: "Activating this feature will send an SOS and your location to the authorities and to one of your favourite contacts. Only use this feature in emergencies. Would you like to send an SOS?", preferredStyle: UIAlertControllerStyle.Alert);
        
        let confirmed = UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default, handler:{(Action: UIAlertAction)->Void in
            //sends a text message to the authorities and to the device's favourite contact with the device's current location and default message for help
        });
        
        let denied = UIAlertAction(title: "No", style: UIAlertActionStyle.Destructive, handler:{(Action: UIAlertAction)->Void in
            //sends a text message to the authorities and to the device's favourite contact with the device's current location and default message for help
        });
        
        homingBeacon.addAction(confirmed);
        homingBeacon.addAction(denied);
        
        if(self.presentedViewController == nil) {
            self.presentViewController(homingBeacon, animated: true, completion: nil);
        } else {
            self.presentedViewController?.dismissViewControllerAnimated(true, completion: {()->Void in
                self.presentViewController(homingBeacon, animated: true, completion: nil);
            })
        }
    }
    
    public func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        switch(tabBarController.selectedIndex) {
            
        case 0: //current workout

            searchButtonContainer = UIBarButtonItem(title: "🔍", style: UIBarButtonItemStyle.Plain, target: self, action: nil);
            
            homingBeaconContainer = UIBarButtonItem(title: "😱", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
            
            self.workoutStart.searchButton.frame = CGRect(x: 0, y: 20, width: 40, height: 40);
            self.workoutStart.homingBeacon.frame = CGRect(x: 0, y: 20, width: 40, height: 40);
            
            self.workoutStart.searchButton = UIButton(type: UIButtonType.Custom);
            self.workoutStart.homingBeacon = UIButton(type: UIButtonType.Custom);
            
            self.workoutStart.searchButton.showsTouchWhenHighlighted = true;
            self.workoutStart.homingBeacon.showsTouchWhenHighlighted = true;
            
            
            self.workoutStart.searchButton.addTarget(self, action: #selector(self.searchPressed), forControlEvents: UIControlEvents.TouchDown);
            self.workoutStart.homingBeacon.addTarget(self, action: #selector(self.homingBeaconPressed), forControlEvents: UIControlEvents.TouchDown);
            
            self.searchButtonContainer.customView = self.workoutStart.searchButton;
            self.homingBeaconContainer.customView = self.workoutStart.homingBeacon;
            
            self.navigationItem.setLeftBarButtonItem(homingBeaconContainer, animated: false);
            self.navigationItem.setRightBarButtonItem(searchButtonContainer, animated: false);
        
            self.navigationItem.title = "Let's Workout";
            
            break;
        case 1: //previous workouts
            self.navigationItem.setLeftBarButtonItem(nil, animated: false);
            self.navigationItem.setRightBarButtonItem(nil, animated: false);
            self.navigationItem.title = "My Previous Workouts";
            break;
            
        case 2: //results of workouts
            
            self.navigationItem.setLeftBarButtonItem(nil, animated: false);
            self.navigationItem.setRightBarButtonItem(nil, animated: false);
            self.navigationItem.title = "My Progress";
            break;
            
            
        case 3: //Music player
            self.navigationItem.setLeftBarButtonItem(nil, animated: false);
            self.navigationItem.setRightBarButtonItem(nil, animated: false);
            self.navigationItem.title = "My Music Library"
            
            break;
            
        case 4: //Settings
            self.navigationItem.setLeftBarButtonItem(nil, animated: false);
            self.navigationItem.setRightBarButtonItem(nil, animated: false);
            self.navigationItem.title = "Settings";
            
            break;
        default:
            self.navigationItem.setLeftBarButtonItem(nil, animated: false);
            self.navigationItem.setRightBarButtonItem(nil, animated: false);
            print("No selection has been made");
            break;
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.whiteColor();
        
        let startWorkout = WorkoutStartController();
        let previousWorkouts = WorkoutProgressController();
        
        let settingsController = SettingsController();
        let graphicsController = GraphicalResultsController();
        let musicController = MusicController();
        
        self.setViewControllers([startWorkout, previousWorkouts, graphicsController, musicController, settingsController], animated: true);
        
        
        self.tabBar.items![0].title = "Workout";
        self.tabBar.items![1].title = "Previous Workouts";
        self.tabBar.items![2].title = "Results";
        self.tabBar.items![3].title = "Music Player";
        self.tabBar.items![4].title = "Settings";
        
        
        self.tabBar.tintColor = UIColor.blueColor();
        
        self.tabBar.items![0].image = UIImage(named: "StartWorkoutUnSelected.png");
        self.tabBar.items![1].image = UIImage(named: "PreviousWorkouts.png");
        self.tabBar.items![2].image = UIImage(named: "ResultsIcon.png");
        self.tabBar.items![3].image = UIImage(named: "MusicPlayer.png");
        self.tabBar.items![4].image = UIImage(named: "Settings.png");
        
        self.tabBar.barStyle = UIBarStyle.Default;
        self.delegate = self;
        
        
        //self.navigationItem.setLeftBarButtonItem(homingBeacon, animated: true);
        //this is supposed to be a button here to strt the workout
        
        searchButtonContainer = UIBarButtonItem()
        
        homingBeaconContainer = UIBarButtonItem();
        
        self.workoutStart.searchButton.frame = CGRect(x: 0, y: 20, width: 40, height: 40);
        self.workoutStart.homingBeacon.frame = CGRect(x: 0, y: 20, width: 40, height: 40);
        
        self.workoutStart.searchButton.titleLabel?.font = UIFont.systemFontOfSize(20);
        
        self.workoutStart.searchButton.titleLabel?.text = "🔍";
        self.workoutStart.homingBeacon.titleLabel?.text = "😱";
        
        self.workoutStart.searchButton.setTitle("🔍", forState: UIControlState.Normal);
        self.workoutStart.searchButton.setTitle("🔍", forState: UIControlState.Highlighted);
        
        self.workoutStart.homingBeacon.setTitle("😱", forState: UIControlState.Normal);
        self.workoutStart.homingBeacon.setTitle("😱", forState: UIControlState.Highlighted);
        
        self.workoutStart.searchButton.showsTouchWhenHighlighted = true;
        self.workoutStart.homingBeacon.showsTouchWhenHighlighted = true;
        
        self.searchButtonContainer.customView = self.workoutStart.searchButton;
        self.homingBeaconContainer.customView = self.workoutStart.homingBeacon;
        
        
        self.workoutStart.searchButton.addTarget(self, action: #selector(self.searchPressed), forControlEvents: UIControlEvents.TouchDown);
        self.workoutStart.homingBeacon.addTarget(self, action: #selector(self.homingBeaconPressed), forControlEvents: UIControlEvents.TouchDown);
        
        self.navigationItem.setLeftBarButtonItem(homingBeaconContainer, animated: false);
        self.navigationItem.setRightBarButtonItem(searchButtonContainer, animated: false);
        
        
        self.navigationItem.title = "Let's Workout";
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
