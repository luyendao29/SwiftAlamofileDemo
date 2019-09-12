//
//  DataServices.swift
//  SwiftAlamofileDemo
//
//  Created by Boss on 9/12/19.
//  Copyright © 2019 LuyệnĐào. All rights reserved.
//

import UIKit
import Alamofire
class DataServices {
    static  let share = DataServices()
    func getdata(completedHandle: @escaping(Weather) -> ()) {
        guard let url = URL(string: urlApi) else {return}
        Alamofire.request(url, method: .get, parameters:nil, encoding: JSONEncoding.default).responseJSON { response in
            do {
                let recivedData = try JSONDecoder().decode(Weather.self, from: response.data!)
                
                //print(categoryMusicData)
                DispatchQueue.main.async {
                    completedHandle(recivedData)
                }
            } catch {
                print(error)
            }
        }
   
    }
}


