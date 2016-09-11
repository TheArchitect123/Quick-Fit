//
//  WorkoutController.swift
//  Quick&Fit
//
//  Created by Dan Gerchcovich on 9/09/2016.
//  Copyright © 2016 Dan Gerchcovich. All rights reserved.
//


import Foundation
import UIKit;

import MapKit;
import CoreLocation;

import HealthKit;
import HealthKitUI;

public class WorkoutStartController : UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    public var usersMap : MKMapView = MKMapView();
    public let userLocationManager : CLLocationManager = CLLocationManager();
    
    public var speedLabel = UILabel();
    public var pulseLabel = UILabel();
    public var distanceTravelledLabel = UILabel();
    public var stepCounterLabel = UILabel();
    public var caloriesBurnedLabel = UILabel();
    public var exerciseTypeLabel = UILabel();
    public var durationLabel = UILabel();
    
    public var averageSpeed : Double = 0.0;
    public var pulse : Double = 0.0;
    public var distance : Double = 0.0;
    public var stepCounter : Int = 0;
    public var caloriesBurned : Double = 0.0;
    public var exerciseType : String = "Cycling";
    public var durationSeconds : Int = 0;
    public var durationMinutes : Int = 0;
    public var durationHours : Int = 0;
    
    public var searchButton = UIButton();
    public var homingBeacon = UIButton();
    
    public func searchPressed() {
        //here the user will enter the address he wants to get to and the fitness workout will start to work
        print("Search button pressed")
    }
    
    public func homingBeaconPressed() {
        
    }
    
    public func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        let userCamera = MKMapCamera();
        userCamera.altitude = 1000;
        userCamera.pitch = 10;
        userCamera.centerCoordinate = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude);
        userCamera.heading = 10;
        
        self.usersMap.setCamera(userCamera, animated: true);
    }
    
    public override func viewWillLayoutSubviews() {
        
        var screenWidth = UIScreen.mainScreen().bounds.width;
        var screenHeight = UIScreen.mainScreen().bounds.height;
        
        switch(UIDevice.currentDevice().modelName) {
            
        //iPhone versions
        case "iPhone4,1": //iPhone 4S
            
            if(UIDevice.currentDevice().orientation == UIDeviceOrientation.Portrait || UIDevice.currentDevice().orientation == UIDeviceOrientation.PortraitUpsideDown) {
                self.usersMap.removeFromSuperview();
                print ("Orientation is Portrait: \(UIDevice.currentDevice().orientation.isPortrait)");
                self.usersMap.frame = CGRect(x: 5, y: 195, width: screenWidth - 10, height: screenHeight / 1.90);
                self.view.addSubview(self.usersMap);
                
                //labels
                self.speedLabel.frame = CGRect(x: 5, y: 125, width: 155, height: 30);
                self.pulseLabel.frame = CGRect(x: 160, y: 125, width: 155, height: 30);
                self.distanceTravelledLabel.frame = CGRect(x: 92.5, y: 155, width: 135, height: 30);
                
                self.stepCounterLabel.frame = CGRect(x: 5, y: 65, width: 155, height: 30);
                self.caloriesBurnedLabel.frame = CGRect(x: 160, y: 65, width: 155, height: 30);
                self.exerciseTypeLabel.frame =  CGRect(x: 5, y: 95, width: 155, height: 30);
                self.durationLabel.frame =  CGRect(x: 160, y: 95, width: 155, height: 30);
               
              
                self.speedLabel.text = " 🚴🏼 \(self.averageSpeed)m/s";
                self.pulseLabel.text = " ❤️ \(self.pulse) beats";
                self.distanceTravelledLabel.text = " 🛰 \(self.distance)km";
                self.stepCounterLabel.text = " 🚶 \(self.stepCounter) steps";
                self.caloriesBurnedLabel.text = " 🍔 \(self.caloriesBurned) calories";
                self.exerciseTypeLabel.text = " 🏅" + self.exerciseType;
                self.durationLabel.text = " ⏱ 0\(self.durationHours):0\(self.durationMinutes):0\(self.durationSeconds)";
                
                
                
                self.view.addSubview(self.stepCounterLabel);
                self.view.addSubview(self.caloriesBurnedLabel);
                self.view.addSubview(self.exerciseTypeLabel);
                self.view.addSubview(self.durationLabel);
                
                self.view.bringSubviewToFront(self.speedLabel);
                self.view.bringSubviewToFront(self.pulseLabel);
                self.view.bringSubviewToFront(self.distanceTravelledLabel);
                self.view.bringSubviewToFront(self.stepCounterLabel);
                self.view.bringSubviewToFront(self.caloriesBurnedLabel);
                self.view.bringSubviewToFront(self.exerciseTypeLabel);
                self.view.bringSubviewToFront(self.durationLabel);
            }
            else if(UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeLeft || UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeRight) {
                self.usersMap.removeFromSuperview();
                print ("Orientation is Landscape: \(UIDevice.currentDevice().orientation.isLandscape)");
                self.usersMap.frame = CGRect(x: 5, y: 125, width: screenWidth - 10, height: screenHeight / 2.15);
                self.view.addSubview(self.usersMap);
                
                self.speedLabel.removeFromSuperview();
                self.pulseLabel.removeFromSuperview();
                self.distanceTravelledLabel.removeFromSuperview();
                self.stepCounterLabel.removeFromSuperview();
                self.caloriesBurnedLabel.removeFromSuperview();
                self.exerciseTypeLabel.removeFromSuperview();
                self.durationLabel.removeFromSuperview();
                
                
                //labels
                self.speedLabel.frame = CGRect(x: 55, y: 35, width: 120, height: 40);
                self.pulseLabel.frame = CGRect(x: 175, y: 35,width: 130, height: 40);
                self.distanceTravelledLabel.frame = CGRect(x: 305, y: 35, width: 120, height: 40);
                
                
                self.stepCounterLabel.frame = CGRect(x: 5, y: 75, width: 120, height: 40);
                self.caloriesBurnedLabel.frame = CGRect(x: 125, y: 75, width: 120, height: 40);
                self.exerciseTypeLabel.frame =  CGRect(x: 245, y: 75, width: 120, height: 40);
                self.durationLabel.frame =  CGRect(x: 365, y: 75, width: 110, height: 40);
                
                
                //default landscape text
                self.speedLabel.text = " 🚴🏼 \(self.averageSpeed)m/s";
                self.pulseLabel.text = " ❤️ \(self.pulse) beats";
                self.distanceTravelledLabel.text = " 🛰 \(self.distance)km";
                self.stepCounterLabel.text = " 🚶 \(self.stepCounter) steps";
                self.caloriesBurnedLabel.text = " 🍔 \(self.caloriesBurned) calories";
                self.exerciseTypeLabel.text = " 🏅" + self.exerciseType;
                self.durationLabel.text = " ⏱ 0\(self.durationHours):0\(self.durationMinutes):0\(self.durationSeconds)";
                
                
                self.view.addSubview(self.speedLabel);
                self.view.addSubview(self.pulseLabel);
                self.view.addSubview(self.distanceTravelledLabel);
                self.view.addSubview(self.stepCounterLabel);
                self.view.addSubview(self.caloriesBurnedLabel);
                self.view.addSubview(self.exerciseTypeLabel);
                self.view.addSubview(self.durationLabel);
                
                self.view.bringSubviewToFront(self.speedLabel);
                self.view.bringSubviewToFront(self.pulseLabel);
                self.view.bringSubviewToFront(self.distanceTravelledLabel);
                self.view.bringSubviewToFront(self.stepCounterLabel);
                self.view.bringSubviewToFront(self.caloriesBurnedLabel);
                self.view.bringSubviewToFront(self.exerciseTypeLabel);
                self.view.bringSubviewToFront(self.durationLabel);
                
            }
            break;
            
        case "iPhone5,1","iPhone5,2": //iPhone 5
            self.usersMap.frame = CGRect(x: 5, y: 400, width: screenWidth - 10, height: screenHeight / 3.0);
            self.view.addSubview(self.usersMap);
            
            break;
        case "iPhone6,1","iPhone6,2": //iPhone 5S
            self.usersMap.frame = CGRect(x: 5, y: 400, width: screenWidth - 10, height: screenHeight / 3.0);
            self.view.addSubview(self.usersMap);
            
            break;
        case "iPhone7,2": //iPhone 6
            self.usersMap.frame = CGRect(x: 5, y: 400, width: screenWidth - 10, height: screenHeight / 3.0);
            self.view.addSubview(self.usersMap);
            
            
            break;
        case "iPhone7,2": //iPhone 6
            self.usersMap.frame = CGRect(x: 5, y: 400, width: screenWidth - 10, height: screenHeight / 3.0);
            self.view.addSubview(self.usersMap);
            
            
            break;
        case "iPhone7,1": //iPhone 6 Plus
            self.usersMap.frame = CGRect(x: 5, y: 400, width: screenWidth - 10, height: screenHeight / 3.0);
            self.view.addSubview(self.usersMap);
            
            
            break;
        case "iPhone8,1": //iPhone 6S
            self.usersMap.frame = CGRect(x: 5, y: 400, width: screenWidth - 10, height: screenHeight / 3.0);
            self.view.addSubview(self.usersMap);
            
            break;
        case "iPhone8,2": //iPhone 6S Plus
            self.usersMap.frame = CGRect(x: 5, y: 400, width: screenWidth - 10, height: screenHeight / 3.0);
            self.view.addSubview(self.usersMap);
            
            break;
            
        //iPad version
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": //iPad 2
            break;
            
        case "iPad3,1", "iPad3,2", "iPad3,3": //iPad 3
            break;
        case "iPad3,4", "iPad3,5", "iPad3,6": //iPad 4
            break;
        case "iPad4,1", "iPad4,2", "iPad4,3": //iPad Air
            break;
        case "iPad5,3", "iPad5,4": //iPad Air 2
            break;
        case "iPad2,5", "iPad2,6", "iPad2,7": //iPad Mini
            break;
        case "iPad4,4", "iPad4,5", "iPad4,6": //iPad Mini 2
            break;
        case "iPad4,7", "iPad4,8", "iPad4,9": //iPad Mini 3
            break;
        case "iPad5,1", "iPad5,2": //iPad Mini 4
            break;
        case "iPad6,7", "iPad6,8": //iPad Pro
            break;
            
        default:
            print("Other devices")
            
            break;
            
        }
    }
    
    public override func viewDidLoad() {
        self.view.backgroundColor = UIColor.lightGrayColor();
        
        //map properties
        self.usersMap.showsBuildings = true;
        self.usersMap.showsUserLocation = true;
        self.usersMap.showsPointsOfInterest = true;
        self.usersMap.userInteractionEnabled = false;
        
        //border properties of map
        self.usersMap.tintColor = UIColor.blackColor();
        self.usersMap.layer.borderWidth = 0.6;
        
        self.userLocationManager.requestAlwaysAuthorization();
        self.userLocationManager.startUpdatingLocation();
        
        self.usersMap.delegate = self;
        self.userLocationManager.delegate = self;
        
        self.speedLabel.text = "🚴🏼 \(self.averageSpeed)m/s";
        self.pulseLabel.text = "❤️ \(self.pulse) beats";
        self.distanceTravelledLabel.text = "🛰 \(self.distance)km";
        self.stepCounterLabel.text = "🚶 \(self.stepCounter) steps";
        self.caloriesBurnedLabel.text = "🍔 \(self.caloriesBurned) calories";
        self.exerciseTypeLabel.text = "🏅" + self.exerciseType;
        self.durationLabel.text = "⏱ 0\(self.durationHours):0\(self.durationMinutes):0\(self.durationSeconds)";
        
        
        self.speedLabel.adjustsFontSizeToFitWidth = true;
        self.pulseLabel.adjustsFontSizeToFitWidth = true;
        self.distanceTravelledLabel.adjustsFontSizeToFitWidth = true;
        self.stepCounterLabel.adjustsFontSizeToFitWidth = true;
        self.caloriesBurnedLabel.adjustsFontSizeToFitWidth = true;
        self.exerciseTypeLabel.adjustsFontSizeToFitWidth = true;
        self.durationLabel.adjustsFontSizeToFitWidth = true;
        
        
        self.speedLabel.font = UIFont.boldSystemFontOfSize(self.speedLabel.font.pointSize);
        self.pulseLabel.font = UIFont.boldSystemFontOfSize(self.pulseLabel.font.pointSize);
        self.distanceTravelledLabel.font = UIFont.boldSystemFontOfSize(self.distanceTravelledLabel.font.pointSize);
        self.stepCounterLabel.font = UIFont.boldSystemFontOfSize(self.stepCounterLabel.font.pointSize);
        self.caloriesBurnedLabel.font = UIFont.boldSystemFontOfSize(self.caloriesBurnedLabel.font.pointSize);
        self.exerciseTypeLabel.font = UIFont.boldSystemFontOfSize(self.exerciseTypeLabel.font.pointSize);
        self.durationLabel.font = UIFont.boldSystemFontOfSize(self.durationLabel.font.pointSize);
        
        
        self.speedLabel.layer.borderWidth = 0.4;
        self.pulseLabel.layer.borderWidth = 0.4;
        self.distanceTravelledLabel.layer.borderWidth = 0.4;
        self.stepCounterLabel.layer.borderWidth = 0.4;
        self.caloriesBurnedLabel.layer.borderWidth = 0.4;
        self.exerciseTypeLabel.layer.borderWidth = 0.4;
        self.durationLabel.layer.borderWidth = 0.4;
        
        
        
        self.speedLabel.tintColor = UIColor.blackColor();
        self.pulseLabel.tintColor = UIColor.blackColor();
        self.distanceTravelledLabel.tintColor = UIColor.blackColor();
        self.stepCounterLabel.tintColor = UIColor.blackColor();
        self.caloriesBurnedLabel.tintColor = UIColor.blackColor();
        self.exerciseTypeLabel.tintColor = UIColor.blackColor();
        self.durationLabel.tintColor = UIColor.blackColor();
        
        self.speedLabel.backgroundColor = UIColor.whiteColor();
        self.pulseLabel.backgroundColor = UIColor.whiteColor();
        self.distanceTravelledLabel.backgroundColor = UIColor.whiteColor();
        self.stepCounterLabel.backgroundColor = UIColor.whiteColor();
        self.caloriesBurnedLabel.backgroundColor = UIColor.whiteColor();
        self.exerciseTypeLabel.backgroundColor = UIColor.whiteColor();
        self.durationLabel.backgroundColor = UIColor.whiteColor();
        
        var screenWidth = UIScreen.mainScreen().bounds.width;
        var screenHeight = UIScreen.mainScreen().bounds.height;
        
        //position of the map view depends on the type of device
        switch(UIDevice.currentDevice().modelName) {
            
        //iPhone versions
        case "iPhone4,1": //iPhone 4S
            
            //Portrait mode
            if(UIDevice.currentDevice().orientation == UIDeviceOrientation.Portrait || UIDevice.currentDevice().orientation == UIDeviceOrientation.PortraitUpsideDown) {
                
                self.stepCounterLabel.frame = CGRect(x: 5, y: 65, width: 105, height: 30);
                self.caloriesBurnedLabel.frame = CGRect(x: 110, y: 65, width: 105, height: 30);
                self.exerciseTypeLabel.frame =  CGRect(x: 210, y: 65, width: 105, height: 30);
                
                self.durationLabel.frame =  CGRect(x: 245, y: 95, width: 70, height: 30);
                //user map
                self.usersMap.removeFromSuperview();
                print ("Orientation is: \(UIDevice.currentDevice().orientation)");
                self.usersMap.frame = CGRect(x: 5, y: 195, width: screenWidth - 10, height: screenHeight / 1.90);
                self.view.addSubview(self.usersMap);
                
                //labels 
                print("Speed label \(self.speedLabel)");
                print("Speed label \(self.pulseLabel)");
                print("Speed label \(self.distanceTravelledLabel)");
                
                self.speedLabel.frame = CGRect(x: 5, y: 125, width: 155, height: 30);
                self.pulseLabel.frame = CGRect(x: 160, y: 125, width: 155, height: 30);
                self.distanceTravelledLabel.frame = CGRect(x: 92.5, y: 155, width: 135, height: 30);
                
                self.stepCounterLabel.frame = CGRect(x: 5, y: 65, width: 155, height: 30);
                self.caloriesBurnedLabel.frame = CGRect(x: 160, y: 65, width: 155, height: 30);
                self.exerciseTypeLabel.frame =  CGRect(x: 5, y: 95, width: 155, height: 30);
                self.durationLabel.frame =  CGRect(x: 160, y: 95, width: 155, height: 30);
                
                //default portrait text 
                self.speedLabel.text = " 🚴🏼 \(self.averageSpeed)m/s";
                self.pulseLabel.text = " ❤️ \(self.pulse) beats";
                self.distanceTravelledLabel.text = " 🛰 \(self.distance)km";
                self.stepCounterLabel.text = " 🚶 \(self.stepCounter) steps";
                self.caloriesBurnedLabel.text = " 🍔 \(self.caloriesBurned) calories";
                self.exerciseTypeLabel.text = " 🏅" + self.exerciseType;
                self.durationLabel.text = " ⏱ 0\(self.durationHours):0\(self.durationMinutes):0\(self.durationSeconds)";
                
                
                
                
                self.view.addSubview(self.speedLabel);
                self.view.addSubview(self.pulseLabel);
                self.view.addSubview(self.distanceTravelledLabel);
                
                self.view.addSubview(self.stepCounterLabel);
                self.view.addSubview(self.caloriesBurnedLabel);
                self.view.addSubview(self.exerciseTypeLabel);
                self.view.addSubview(self.durationLabel);
                
                self.view.bringSubviewToFront(self.speedLabel);
                self.view.bringSubviewToFront(self.pulseLabel);
                self.view.bringSubviewToFront(self.distanceTravelledLabel);
                self.view.bringSubviewToFront(self.stepCounterLabel);
                self.view.bringSubviewToFront(self.caloriesBurnedLabel);
                self.view.bringSubviewToFront(self.exerciseTypeLabel);
                self.view.bringSubviewToFront(self.durationLabel);
                
            }
                //Landscape mode
            else if(UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeLeft || UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeRight) {
                self.usersMap.removeFromSuperview();
                print ("Orientation is: \(UIDevice.currentDevice().orientation)");
                self.usersMap.frame = CGRect(x: 5, y: 125, width: screenWidth - 10, height: screenHeight / 2.15);
                self.view.addSubview(self.usersMap);
                
                self.speedLabel.removeFromSuperview();
                self.pulseLabel.removeFromSuperview();
                self.distanceTravelledLabel.removeFromSuperview();
                self.stepCounterLabel.removeFromSuperview();
                self.caloriesBurnedLabel.removeFromSuperview();
                self.exerciseTypeLabel.removeFromSuperview();
                self.durationLabel.removeFromSuperview();
                
                //labels
                self.speedLabel.frame = CGRect(x: 55, y: 35, width: 120, height: 40);
                self.pulseLabel.frame = CGRect(x: 175, y: 35,width: 130, height: 40);
                self.distanceTravelledLabel.frame = CGRect(x: 305, y: 35, width: 120, height: 40);

                
                self.stepCounterLabel.frame = CGRect(x: 5, y: 75, width: 120, height: 40);
                self.caloriesBurnedLabel.frame = CGRect(x: 125, y: 75, width: 120, height: 40);
                self.exerciseTypeLabel.frame =  CGRect(x: 245, y: 75, width: 120, height: 40);
                self.durationLabel.frame =  CGRect(x: 365, y: 75, width: 110, height: 40);
                
                //default landscape text
                self.speedLabel.text = " 🚴🏼 \(self.averageSpeed)m/s";
                self.pulseLabel.text = " ❤️ \(self.pulse) beats";
                self.distanceTravelledLabel.text = " 🛰 \(self.distance)km";
                self.stepCounterLabel.text = " 🚶 \(self.stepCounter) steps";
                self.caloriesBurnedLabel.text = " 🍔 \(self.caloriesBurned) calories";
                self.exerciseTypeLabel.text = " 🏅" + self.exerciseType;
                self.durationLabel.text = " ⏱ 0\(self.durationHours):0\(self.durationMinutes):0\(self.durationSeconds)";
                
                
                self.view.addSubview(self.speedLabel);
                self.view.addSubview(self.pulseLabel);
                self.view.addSubview(self.distanceTravelledLabel);
                self.view.addSubview(self.stepCounterLabel);
                self.view.addSubview(self.caloriesBurnedLabel);
                self.view.addSubview(self.exerciseTypeLabel);
                self.view.addSubview(self.durationLabel);
                
                
                self.view.bringSubviewToFront(self.speedLabel);
                self.view.bringSubviewToFront(self.pulseLabel);
                self.view.bringSubviewToFront(self.distanceTravelledLabel);
                self.view.bringSubviewToFront(self.stepCounterLabel);
                self.view.bringSubviewToFront(self.caloriesBurnedLabel);
                self.view.bringSubviewToFront(self.exerciseTypeLabel);
                self.view.bringSubviewToFront(self.durationLabel);
            }
            break;
            
        case "iPhone5,1","iPhone5,2": //iPhone 5
            self.usersMap.frame = CGRect(x: 5, y: 400, width: screenWidth - 10, height: screenHeight / 3.0);
            self.view.addSubview(self.usersMap);
            
            break;
        case "iPhone6,1","iPhone6,2": //iPhone 5S
            self.usersMap.frame = CGRect(x: 5, y: 400, width: screenWidth - 10, height: screenHeight / 3.0);
            self.view.addSubview(self.usersMap);
            
            break;
        case "iPhone7,2": //iPhone 6
            self.usersMap.frame = CGRect(x: 5, y: 400, width: screenWidth - 10, height: screenHeight / 3.0);
            self.view.addSubview(self.usersMap);
            
            
            break;
        case "iPhone7,2": //iPhone 6
            self.usersMap.frame = CGRect(x: 5, y: 400, width: screenWidth - 10, height: screenHeight / 3.0);
            self.view.addSubview(self.usersMap);
            
            
            break;
        case "iPhone7,1": //iPhone 6 Plus
            self.usersMap.frame = CGRect(x: 5, y: 400, width: screenWidth - 10, height: screenHeight / 3.0);
            self.view.addSubview(self.usersMap);
            
            
            break;
        case "iPhone8,1": //iPhone 6S
            self.usersMap.frame = CGRect(x: 5, y: 400, width: screenWidth - 10, height: screenHeight / 3.0);
            self.view.addSubview(self.usersMap);
            
            break;
        case "iPhone8,2": //iPhone 6S Plus
            self.usersMap.frame = CGRect(x: 5, y: 400, width: screenWidth - 10, height: screenHeight / 3.0);
            self.view.addSubview(self.usersMap);
            
            break;
            
        //iPad version
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": //iPad 2
            break;
            
        case "iPad3,1", "iPad3,2", "iPad3,3": //iPad 3
            break;
        case "iPad3,4", "iPad3,5", "iPad3,6": //iPad 4
            break;
        case "iPad4,1", "iPad4,2", "iPad4,3": //iPad Air
            break;
        case "iPad5,3", "iPad5,4": //iPad Air 2
            break;
        case "iPad2,5", "iPad2,6", "iPad2,7": //iPad Mini
            break;
        case "iPad4,4", "iPad4,5", "iPad4,6": //iPad Mini 2
            break;
        case "iPad4,7", "iPad4,8", "iPad4,9": //iPad Mini 3
            break;
        case "iPad5,1", "iPad5,2": //iPad Mini 4
            break;
        case "iPad6,7", "iPad6,8": //iPad Pro
            break;
            
        default:
            print("Other devices")
            
            break;
            
        }
        
        
        
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
}