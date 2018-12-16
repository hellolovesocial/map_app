class BobaListController < UITableViewController
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('BobaList', image:UIImage.imageNamed('list.png'), tag:1)
    end
    self
  end

  def viewDidLoad
    view.dataSource = view.delegate = self
  end

  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(true, animated:true)
  end    

  def tableView(tableView, numberOfRowsInSection:section)
    Boba::All.size
  end

  CELLID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CELLID)
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton
      cell.selectionStyle = UITableViewCellSelectionStyleNone
      cell
    end

    # boba = Boba::All[indexPath.row]
    # cell.textLabel.text = .title
    # cell

    boba = Boba::All[indexPath.row]
    cell.textLabel.text = boba.title
    cell
  end

  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    boba = Boba::All[indexPath.row]
    controller = UIApplication.sharedApplication.delegate.boba_details_controller
    navigationController.pushViewController(controller, animated:true)
    controller.showDetailsForBoba(boba)
  end
end
