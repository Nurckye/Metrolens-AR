import UIKit
import ARCL
import CoreLocation

class CameraARViewController: UIViewController, LNTouchDelegate {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func annotationNodeTouched(node: AnnotationNode) {
        print("annotation touched TOUCHED")
        print("annotation touched TOUCHED")
        print("annotation touched TOUCHED")
        print("annotation touched TOUCHED")
//        self.present(ExampleViewController(), animated: true)

    }
    
    func locationNodeTouched(node: LocationNode) {
        print("LOC ToUCHED")
        print("LOC ToUCHED")
        print("LOC ToUCHED")
        print("LOC ToUCHED")
        print("LOC ToUCHED")
    }
    
    var sceneLocationView = SceneLocationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        sceneLocationView.run()
        view.addSubview(sceneLocationView)
        let coordinate = CLLocationCoordinate2D(latitude: 44.4419, longitude: 26.00102)
        let location = CLLocation(coordinate: coordinate, altitude: 20)

        let coordinate2 = CLLocationCoordinate2D(latitude: 44.5419, longitude: 26.10102)
        let location2 = CLLocation(coordinate: coordinate2, altitude: 10)


        let coordinate3 = CLLocationCoordinate2D(latitude: 45.0551, longitude: 24.2209)
        let location3 = CLLocation(coordinate: coordinate3, altitude: 1)

        let uv1 = ARLocationPoint(frame: CGRect(x: 0, y: 0, width: 250, height: 100))
        let uv2 = ARLocationPoint(frame: CGRect(x: 0, y: 0, width: 250, height: 100))
        let uv3 = ARLocationPoint(frame: CGRect(x: 0, y: 0, width: 250, height: 100))


        let annotationNode = LocationAnnotationNode(location: location, view: uv1)
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)

        let annotationNode2 = LocationAnnotationNode(location: location2, view: uv2)
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode2)

        let annotationNode3 = LocationAnnotationNode(location: location3, view: uv3)
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode3)
        
        self.sceneLocationView.locationNodeTouchDelegate = self
    }
    
    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()

      sceneLocationView.frame = view.bounds
    }
}
