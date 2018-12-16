class BobaMapController < UIViewController
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('BaboMap', image:UIImage.imageNamed('map.png'), tag:1)
    end
    self
  end

  def loadView
    self.view = MKMapView.alloc.init
    view.delegate = self
  end

  def viewDidLoad
    view.frame = tabBarController.view.bounds

    # Center on Brussels.
    region = MKCoordinateRegionMake(CLLocationCoordinate2D.new(35.658033, 139.701635), MKCoordinateSpanMake(0.02, 0.02))
    self.view.setRegion(region)

    Boba::All.each { |boba| self.view.addAnnotation(boba) }
  end

  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(true, animated:true)
  end    

  ViewIdentifier = 'ViewIdentifier'
  def mapView(mapView, viewForAnnotation:boba)
    if view = mapView.dequeueReusableAnnotationViewWithIdentifier(ViewIdentifier)
      view.annotation = boba
    else
      view = MKPinAnnotationView.alloc.initWithAnnotation(boba, reuseIdentifier:ViewIdentifier)
      view.canShowCallout = true
      view.animatesDrop = true
      button = UIButton.buttonWithType(UIButtonTypeDetailDisclosure)
      button.addTarget(self, action: :'showDetails:', forControlEvents:UIControlEventTouchUpInside)
      view.rightCalloutAccessoryView = button
    end
    view
  end

  def showDetails(sender)
    if view.selectedAnnotations.size == 1
      boba = view.selectedAnnotations[0]
      controller = UIApplication.sharedApplication.delegate.boba_details_controller
      navigationController.pushViewController(controller, animated:true)
      controller.showDetailsForBoba(boba)
    end
  end
end
