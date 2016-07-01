name             'cookbook-zabbix'
maintainer       'Earth U'
maintainer_email 'iskitingbords @ gmail.com'
license          'Apache License'
description      'Installs/Configures cookbook-zabbix'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url       'https://github.com/nollieheel/cookbook-zabbix'
issues_url       'https://github.com/nollieheel/cookbook-zabbix/issues'
version          '1.0.1'

depends 'apt', '~> 2.9.2'

supports 'redhat'
supports 'centos'
supports 'ubuntu'
