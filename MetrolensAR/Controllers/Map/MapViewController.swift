import UIKit
import MapKit
import SwiftUI
import Foundation

class MapViewController: UIViewController, MKMapViewDelegate {
    var window: UIWindow?
    var mapView: MKMapView?
    var gesture: UIGestureRecognizer?
    var mapInstantiated: Bool = false
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    func setMapProps() {
        self.mapView = MKMapView(frame: CGRect(x: 0, y: 20, width: (self.window?.frame.width)!, height: (self.window?.frame.height)!))
        self.mapView?.isRotateEnabled = false
        self.mapView?.delegate = self
    }
    
    

 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.view.backgroundColor = .white
        
        if (!mapInstantiated) {
            setMapProps()
            mapInstantiated = true
        }
        
        self.view.addSubview(self.mapView!)
        
   

        
//        for annotation in MapUtils.generateCountiesCoordinates() {
//            mapView?.addAnnotation(annotation)
//        }
        
//        let coordinate = CLLocationCoordinate2D(latitude: 45.397, longitude: 24.9632)
//        let region = self.mapView?.regionThatFits(MKCoordinateRegion(center: coordinate, latitudinalMeters: 1450000, longitudinalMeters: 145000))
//        self.mapView?.setRegion(region!, animated: true)
    }
}

struct MapViewController_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
