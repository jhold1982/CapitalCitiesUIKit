//
//  Capital.swift
//  CapitalCitiesUIKit
//
//  Created by Justin Hold on 2/22/24.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
	var title: String?
	var coordinate: CLLocationCoordinate2D
	var info: String
	
	init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
		self.title = title
		self.coordinate = coordinate
		self.info = info
	}
}
