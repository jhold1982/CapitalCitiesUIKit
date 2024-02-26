//
//  ViewController.swift
//  CapitalCitiesUIKit
//
//  Created by Justin Hold on 2/22/24.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

	// MARK: - @IBOUTLET
	@IBOutlet var mapView: MKMapView!
	
	
	
	// MARK: - VIEWDIDLOAD
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		let london = Capital(
			title: "London",
			coordinate: CLLocationCoordinate2D(
				latitude: 51.507222,
				longitude: -0.1275),
			info: "Home to the 2012 Summer Olympics"
		)
		
		let oslo = Capital(
			title: "Oslo",
			coordinate: CLLocationCoordinate2D(
				latitude: 59.95,
				longitude: 10.75),
			info: "Founded over 1,000 years ago"
		)
		
		let paris = Capital(
			title: "Paris",
			coordinate: CLLocationCoordinate2D(
				latitude: 48.8567,
				longitude: 2.3508),
			info: "Often called the City of Lights"
		)
		
		let rome = Capital(
			title: "Rome",
			coordinate: CLLocationCoordinate2D(
				latitude: 41.9,
				longitude: 12.5),
			info: "Has a whole ass country up in there"
		)
		
		let washingtonDC = Capital(
			title: "Washington D.C.",
			coordinate: CLLocationCoordinate2D(
				latitude: 38.895111,
				longitude: -77.036667),
			info: "Fuck Joe Biden"
		)
		
		// MARK: - ANNOTATIONS
//		mapView.addAnnotation(london)
//		mapView.addAnnotation(oslo)
//		mapView.addAnnotation(paris)
//		mapView.addAnnotation(rome)
//		mapView.addAnnotation(washingtonDC)
		
		mapView.addAnnotations([london, oslo, paris, rome, washingtonDC])
		
		
	}

	// MARK: - FUNCTIONS
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		guard annotation is Capital else { return nil }
		
		let identifier = "Capital"
		
		var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
		
		if annotationView == nil {
			annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
			annotationView?.canShowCallout = true
			
			let bttn = UIButton(type: .detailDisclosure)
			annotationView?.rightCalloutAccessoryView = bttn
		} else {
			annotationView?.annotation = annotation
		}
		return annotationView
	}
	
	func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
		guard let capital = view.annotation as? Capital else { return }
		
		let placeName = capital.title
		let placeInfo = capital.info
		
		let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default))
		present(ac, animated: true)
	}

}

