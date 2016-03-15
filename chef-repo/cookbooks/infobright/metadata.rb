name             'infobright'
maintainer       'Takeshi Mikami'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures infobright-ice'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{
  rhel
}.each do |os|
  supports os
end

