//
//  ViewController.swift
//  SwiftAlamofileDemo
//
//  Created by Boss on 9/12/19.
//  Copyright © 2019 LuyệnĐào. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelUpdate: UILabel!
    @IBOutlet weak var labelIcon: UILabel!
    
    var listWeather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RequestData()
        // Do any additional setup after loading the view.
    }
    
    func RequestData(){
        DataServices.share.getdata { data in
            self.listWeather = data
            self.Display()
        }
    }
    
    func Display() {
        labelName.text = listWeather?.location.name
        labelCountry.text = listWeather?.location.country
        labelTime.text = listWeather?.location.localtime
        labelUpdate.text = listWeather?.current.last_updated
        labelIcon.text = listWeather?.current.condition.icon
    }


}

