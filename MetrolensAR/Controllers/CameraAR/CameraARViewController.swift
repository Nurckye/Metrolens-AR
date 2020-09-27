import UIKit
import ARCL
import CoreLocation

class CameraARViewController: UIViewController, LNTouchDelegate {
    func locationNodeTouched(node: LocationNode) {
         
    }
    
    var sceneLocationView = SceneLocationView()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func annotationNodeTouched(node: AnnotationNode) {
        if let node = node.parent as? LocationNode {
            guard let tag = node.tag else {
                return
            }
            
            let payload = PresentationInfo(
                isCamera: false,
                isPresented: true,
                locationId: tag)
            StateManager.manager.publish(key: LOCATION_SELECTED_EVENT, payload: payload)
        }
    }
    
    func generateLocationPoints() {
        var filteredEntries = filterCoordinatesInProximity(locations: MemStorage.locations)
        for entry in filteredEntries {
            let location = CLLocation(coordinate: entry.coordinates, altitude: CLLocationDistance(LocationService.currentAltitude + 4) )
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
