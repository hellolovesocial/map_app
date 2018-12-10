class Beer
  def initialize(lat, long, name, link)
    @name = name
    @coordinate = CLLocationCoordinate2D.new
    @coordinate.latitude = lat
    @coordinate.longitude = long
    @url = NSURL.alloc.initWithString(link)
  end

  def title; @name; end
  def coordinate; @coordinate; end
  def url; @url; end

  All = [
    Beer.new(35.660138, 139.707438, 'MING TEA', 'https://localplace.jp/t200340454/'),
    Beer.new(35.661256, 139.698945, 'Gong Cha', 'https://www.gongcha.co.jp/'),
    Beer.new(35.660524, 139.698437, 'CoCo都可', 'https://cocofreshtokyo.amebaownd.com/'),
    Beer.new(35.660770, 139.696850, 'Piyanee', 'http://www.piyanee.com/'),
    Beer.new(35.659810, 139.695270, 'THE ALLEY', 'http://www.the-alley.jp/')
  ]
end
