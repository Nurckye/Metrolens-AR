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
        
        let alert = UIAlertView()
        alert.title = "Alert"
        alert.message = "Here's a message from annotation"
        alert.addButton(withTitle: "Understood")
        alert.show()
        
//        let payload = PresentationInfo(
//            isCamera: false,
//            isPresented: true,
//            locationId: "3")
//        StateManager.manager.publish(key: LOCATION_SELECTED_EVENT, payload: payload)
    }
    
    func locationNodeTouched(node: LocationNode) {
        print("LOC ToUCHED")
        print("LOC ToUCHED")
        print("LOC ToUCHED")
        print("LOC ToUCHED")
        print("LOC ToUCHED")
        
        let alert = UIAlertView()
        alert.title = "Alert"
        alert.message = "Here's a message from location"
        alert.addButton(withTitle: "Understood")
        alert.show()
        
        let payload = PresentationInfo(
            isCamera: false,
            isPresented: true,
            locationId: node.tag)
        StateManager.manager.publish(key: LOCATION_SELECTED_EVENT, payload: payload)
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
            annotationNode.tag = entry.id
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
