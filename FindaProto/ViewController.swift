//
//  ViewController.swift
//  FindaProto
//
//  Created by Apple on 16/02/2018.
//  Copyright © 2018 databigit. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var myAnnotation: MKPointAnnotation = MKPointAnnotation()
    
    //var locationManager: CLLocationManager!
    
    var locations = ["Airport", "Police Station", "Hospital", "Bank", "Market", "Petrol Station"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.pickerView.backgroundColor = UIColor.orange
        
        // centre map on lagos
        let coordinate = CLLocationCoordinate2D(latitude: 6.4844, longitude: 3.3992)
        let region = MKCoordinateRegionMake(coordinate, MKCoordinateSpanMake(0.1, 0.1))
        mapView.setRegion(region, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locations.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locations[row]
    }
    
    /* Catpure the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let valSelect = locations[row]
        if valSelect == locations[2] {
            myAnnotation.coordinate = CLLocationCoordinate2D(latitude: 6.4845, longitude: 3.3767)
            mapView.addAnnotation(myAnnotation)
        }
        print(valSelect)
    }*/
    
    // Catpure the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let valSelect = locations[row]
        switch valSelect {
        case locations[0]:
            //airport
            myAnnotation.coordinate = CLLocationCoordinate2D(latitude: 6.5818, longitude: 3.3211)
            mapView.addAnnotation(myAnnotation)
        case locations[1]:
            // osborne road
            myAnnotation.coordinate = CLLocationCoordinate2D(latitude: 6.4431, longitude: 3.4229)
            mapView.addAnnotation(myAnnotation)
        case locations[2]:
            // ebute metta
            MKCoordinateRegionMake(myAnnotation.coordinate, MKCoordinateSpanMake(0.01, 0.01))
            myAnnotation.coordinate = CLLocationCoordinate2D(latitude: 6.4845, longitude: 3.3767)
            mapView.addAnnotation(myAnnotation)
        case locations[3]:
            // wharf road
            myAnnotation.coordinate = CLLocationCoordinate2D(latitude: 6.4621, longitude: 3.3641)
            mapView.addAnnotation(myAnnotation)
        case locations[4]:
            // ikoyi road
            MKCoordinateRegionMake(myAnnotation.coordinate, MKCoordinateSpanMake(0.01, 0.01))
            myAnnotation.coordinate = CLLocationCoordinate2D(latitude: 6.4548, longitude: 3.4347)
            mapView.addAnnotation(myAnnotation)
        default:
            print("Error occurred")
        }
        print(valSelect)
    }
    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = locations[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font:UIFont(name: "Copperplate", size: 15.0)!,NSAttributedStringKey.foregroundColor:UIColor.white])
        return myTitle
    }


}// end of view controller class

