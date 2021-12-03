//
//  LocationViewController.swift
//  Settings
//
//  Created by Dany on 25.11.2021.
//

import UIKit
import MapKit
import CoreLocation

public class LocationViewController: UIViewController, CLLocationManagerDelegate {
    
    public func locationName(with location: CLLocation,
                             complition: @escaping((String?) -> Void)) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, preferredLocale: .current) { placemarks,
                                                                               error in
            guard let place = placemarks?.first, error == nil else {
                complition(nil)
                return
            }
            print(place)
            var name = ""
            if let locality = place.locality {
                name += locality
            }
            if let adminRegion = place.administrativeArea {
                name += ", \(adminRegion)"
            }
            complition(name)
        }
    }
    let manager = CLLocationManager()
    
    let snitch: UISwitch = {
        let snitch = UISwitch()
        snitch.translatesAutoresizingMaskIntoConstraints = false
        return snitch
    }()
    
    let snitchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Add my location to prifile"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    let viewPrivate: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2971151471, green: 0.3021475077, blue: 0.3019965291, alpha: 0.5)
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.3490176499, green: 0.3479395211, blue: 0.3498669863, alpha: 0.863741503)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let someView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var mapView: MKMapView = {
        let map = MKMapView()
        map.layer.cornerRadius = 20
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    public let currentLocationName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let currentLocation: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Current Location"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy =  kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.showsUserLocation = true
        self.view.addSubview(someView)
        someView.addSubview(mapView)
        someView.addSubview(currentLocationName)
        someView.addSubview(currentLocation)
        someView.addSubview(viewPrivate)
        self.viewPrivate.addSubview(snitch)
        self.viewPrivate.addSubview(snitchLabel)
        snitch.addTarget(self, action: #selector(location), for: .touchUpInside)
        setUpViews()
        
    }
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.someView.backgroundColor = UIColor(patternImage: backgroundImage!)
        
    }
    
    
    
    func setUpViews() {
        let constraints = [
            someView.topAnchor.constraint(equalTo: self.view.topAnchor),
            someView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            someView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            someView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            currentLocation.topAnchor.constraint(equalTo: someView.safeAreaLayoutGuide.topAnchor, constant: 50),
            currentLocation.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 20),
            currentLocation.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: -20),
            currentLocation.heightAnchor.constraint(equalToConstant: 50),
            
            currentLocationName.topAnchor.constraint(equalTo: currentLocation.bottomAnchor, constant: 20),
            currentLocationName.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 20),
            currentLocationName.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: -20),
            currentLocationName.heightAnchor.constraint(equalToConstant: 60),
            
            mapView.topAnchor.constraint(equalTo: currentLocationName.bottomAnchor, constant: 100),
            mapView.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 10),
            mapView.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: -10),
            mapView.bottomAnchor.constraint(equalTo: someView.bottomAnchor, constant: -300),
            
            viewPrivate.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 30),
            viewPrivate.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: -3),
            viewPrivate.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: 3),
            viewPrivate.heightAnchor.constraint(equalToConstant: 50),
            
            snitchLabel.leadingAnchor.constraint(equalTo: viewPrivate.leadingAnchor, constant: 10),
            snitchLabel.centerYAnchor.constraint(equalTo: viewPrivate.centerYAnchor),
            
            snitch.trailingAnchor.constraint(equalTo: viewPrivate.trailingAnchor, constant: -10),
            snitch.centerYAnchor.constraint(equalTo: viewPrivate.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            render(location)
        }
    }
    
    func render(_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        locationName(with: location) { [weak self] locationName in
            self?.currentLocationName.text = locationName
            locationText = locationName
        }
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
        
    }
    
}



extension LocationViewController: MKMapViewDelegate {
    
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "pin"
        if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            annotationView.annotation = annotation
            return annotationView
        }
        return nil
    }
    @objc func location() {
        hiden = false
    }
    
}
