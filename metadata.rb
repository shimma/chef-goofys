name             'goofys'
maintainer       'Shimma'
maintainer_email 'shimma.dev@gmail.com'
license          'Apache 2.0'
description      'Goofys'
long_description 'Goofys'
version          '0.1.0'

%w{ubuntu centos}.each do |os|
  supports os
end
