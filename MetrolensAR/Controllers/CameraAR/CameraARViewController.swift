import UIKit
import ARCL
import CoreLocation

class CameraARViewController: UIViewController, LNTouchDelegate {
    var sceneLocationView = SceneLocationView()

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
    
    func generateLocationPoints() {
        var filteredEntries = filterCoordinatesInProximity(locations: MemStorage.locations)
        for entry in filteredEntries {
            let location = CLLocation(coordinate: entry.coordinates, altitude: 212)
            let arPointView = ARLocationPoint(
                frame: CGRect(x: 0, y: 0, width: 250, height: 100),
                name: entry.name
            )
            let annotationNode = LocationAnnotationNode(location: location, view: arPointView)
            sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sceneLocationView.run()
        view.addSubview(sceneLocationView)
        
        self.generateLocationPoints()
        self.sceneLocationView.locationNodeTouchDelegate = self
    }
    
    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()

      sceneLocationView.frame = view.bounds
    }
}
