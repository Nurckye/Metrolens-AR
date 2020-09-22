import UIKit
import MapKit
import SwiftUI
import Foundation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    var window: UIWindow?
    var mapView: MKMapView?
    var gesture: UIGestureRecognizer?
    var mapInstantiated: Bool = false
    
    var locationKVO: CurrentLocationObserver? = nil
        
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    func setMapProps() {
        self.mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: (self.window?.frame.width)!, height: (self.window?.frame.height)!))
        self.mapView?.isRotateEnabled = false
        self.mapView?.delegate = self
        self.mapView?.showsCompass = true
        self.mapView?.showsUserLocation = true
    }
    
   
    private func generatePins() {
        for location in MemStorage.locations {
            let annotation = MKPointAnnotation()
            annotation.title = location.name
            annotation.coordinate = location.coordinates
            mapView?.addAnnotation(annotation)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.view.backgroundColor = .white
        
        self.setMapProps()
        
        self.locationKVO = LocationService.shared.addObserver(callback: { coordinates in
            let coordinateRegion = MKCoordinateRegion(
                center: coordinates,
                latitudinalMeters: 800,
                longitudinalMeters: 800)
            self.mapView?.setRegion(coordinateRegion, animated: true)
        })

        
        self.generatePins()
        self.view.addSubview(self.mapView!)
    }
}
   

        
//        for annotation in MapUtils.generateCountiesCoordinates() {
//            mapView?.addAnnotation(annotation)
//        }
        
//        let coordinate = CLLocationCoordinate2D(latitude: 45.397, longitude: 24.9632)
//        let region = self.mapView?.regionThatFits(MKCoordinateRegion(center: coordinate, latitudinalMeters: 1450000, longitudinalMeters: 145000))
//        self.mapView?.setRegion(region!, animated: true)



//extension MapViewController: CLLocationManagerDelegate {
//     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let location = locations.last! as CLLocation
//        let currentLocation = location.coordinate
//        let coordinateRegion = MKCoordinateRegion(center: currentLocation, latitudinalMeters: 800, longitudinalMeters: 800)
//        mapView.setRegion(coordinateRegion, animated: true)
//        locationManager.stopUpdatingLocation()
//     }
//
//     func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print(error.localizedDescription)
//     }
//}

struct MapViewController_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
