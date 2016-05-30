
import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate{
    
    var AddressData : String?
    var annotation:MKAnnotation!
    var localSearchRequest:MKLocalSearchRequest!
    var localSearch:MKLocalSearch!
    var localSearchResponse:MKLocalSearchResponse!
    var pointAnnotation:MKPointAnnotation! //핀이 꽂힌 지점
    var MKRegion:MKCoordinateRegion!
    @IBOutlet weak var MapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        MKRegion = MKCoordinateRegion()
        MKRegion?.span.latitudeDelta = 0.005 // 0.005가 적당히 보여서
        MKRegion?.span.longitudeDelta = 0.005
        MapView.setRegion(MKRegion, animated: true)
        localSearchRequest = MKLocalSearchRequest() //요청을 하기위한 설정하는 변수
        localSearchRequest.naturalLanguageQuery = AddressData
        localSearchRequest.region = MKRegion
        localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.startWithCompletionHandler { (localSearchResponse, error) -> Void in //검색
            self.pointAnnotation = MKPointAnnotation()
            self.pointAnnotation.coordinate = (localSearchResponse?.mapItems[0].placemark.location?.coordinate)!
            self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation,
                reuseIdentifier: nil)
            self.MapView.centerCoordinate = self.pointAnnotation.coordinate
            self.MapView.addAnnotation(self.pinAnnotationView.annotation!)
            
        }
        
    }

}
