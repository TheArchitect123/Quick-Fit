//
//  MusicPlayerController.swift
//  Quick&Fit
//
//  Created by Dan Gerchcovich on 9/09/2016.
//  Copyright © 2016 Dan Gerchcovich. All rights reserved.
//


import Foundation
import UIKit;

import MediaPlayer;

public class MusicController : UITableViewController, MPMediaPickerControllerDelegate {
    
    private var musicPlayer = MPMusicPlayerController();
    private var mediaPlayer = MPMediaPickerController();
    
    var listOfSongs : [MPMediaItem] = [];
    var sectionTitles = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
    
    
    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOfSongs.count;
    }
    
    public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    public override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section) {
            case 0:
                return self.sectionTitles[0];
                break;
            case 1:
                return self.sectionTitles[1];
                break;
            case 2:
                return self.sectionTitles[2];
                break;
            case 3:
                return self.sectionTitles[3];
                break;
            case 4:
                return self.sectionTitles[4];
                break;
            case 5:
                return self.sectionTitles[5];
                break;
            case 6:
                return self.sectionTitles[6];
                break;
            case 7:
                return self.sectionTitles[7];
                break;
            case 8:
                return self.sectionTitles[8];
                break;
            case 9:
                return self.sectionTitles[9];
                break;
            case 10:
                return self.sectionTitles[10];
                break;
            case 11:
                return self.sectionTitles[11];
                break;
            case 12:
                return self.sectionTitles[12];
                break;
            case 13:
                return self.sectionTitles[13];
                break;
            case 14:
                return self.sectionTitles[14];
                break;
            case 15:
                return self.sectionTitles[15];
                break;
            case 16:
                return self.sectionTitles[16];
                break;
            case 17:
                return self.sectionTitles[17];
                break;
            case 18:
                return self.sectionTitles[18];
                break;
            case 19:
                return self.sectionTitles[19];
                break;
            case 20:
                return self.sectionTitles[20];
                break;
            case 21:
                return self.sectionTitles[21];
                break;
            case 22:
                return self.sectionTitles[22];
                break;
            case 23:
                return self.sectionTitles[23];
                break;
            case 24:
                return self.sectionTitles[24];
                break;
            default:
                return self.sectionTitles[25];
                break;
        }
        return "";
    }
    
    public override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.sectionTitles.count;
    }
    
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var musicCell = tableView.dequeueReusableCellWithIdentifier("musicCell");
        
        if(musicCell == nil) {
             musicCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "musicCell");
        }
        
        musicCell?.textLabel?.text = "";
        musicCell?.textLabel?.textColor = UIColor.blackColor();
        
        musicCell?.detailTextLabel?.text = "";
        musicCell?.detailTextLabel?.textColor = UIColor.blackColor();
        
        return musicCell!;
    }
    
    public override func viewDidLoad() {
        self.extendedLayoutIncludesOpaqueBars = false;
        self.edgesForExtendedLayout = UIRectEdge.None;
        self.automaticallyAdjustsScrollViewInsets = true;
        
    }
    
    
}