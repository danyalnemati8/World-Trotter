//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Danyal Nemati
//

import UIKit
import MapKit
class MapViewController: UIViewController {
    //var mapView: MKMapView! declares a property named mapView of type MKMapView, which is used to display a map.
 var mapView: MKMapView!
    //used to set up the initial view hierarchy of the view controller
    override func loadView() {
        // creates an instance of MKMapView and assigns it to the mapView property.
        mapView = MKMapView()
        // Set it as *the* view of this view controller
        view = mapView
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let satelliteString
                = NSLocalizedString("Satellite", comment: "Satellite map view")
        //creates a segmented control (UISegmentedControl) with three segments: Standard, Hybrid, and Satellite
        let segmentedControl
                = UISegmentedControl(items: [standardString, hybridString, satelliteString])
        //appearance is customized to match the system background
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        //Event handling is set up to call the mapTypeChanged(_:) method when the user changes the selected segment
        segmentedControl.addTarget(self,
                                   action: #selector(mapTypeChanged(_:)),
                                   for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        //Constraints are added to position the segmented control at the top of the view, aligned with safe area layout guides and margins
        let topConstraint =
         segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
         constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint =
            segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint =
            segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    // method is called when the user selects a different map type from the segmented control
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        //updates the map type of the mapView based on the selected segment index (0 for Standard, 1 for Hybrid, 2 for Satellite)
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
    break }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view.")
    }
}
