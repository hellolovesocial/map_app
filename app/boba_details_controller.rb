class BobaDetailsController < UIViewController
  def loadView
    self.view = UIWebView.alloc.init
  end

  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(false, animated:true)
  end

  def showDetailsForBoba(boba)
    navigationItem.title = boba.title
    request = NSURLRequest.requestWithURL(boba.url)
    view.loadRequest(request)
  end 
end
