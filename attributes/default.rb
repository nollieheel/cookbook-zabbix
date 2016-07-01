#
# Author:: Earth U (<iskitingbords @ gmail.com>)
# Cookbook Name:: cookbook-zabbix
# Attribute:: default
#
# Copyright 2016, Earth U
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

cb = 'cookbook-zabbix'

# The repository url and filename will determine the version of Zabbix.
# Version 2.2 is only used on Ubuntu 12.04
repo_24 = 'http://repo.zabbix.com/zabbix/2.4'
repo_22 = 'http://repo.zabbix.com/zabbix/2.2'
main_repo = value_for_platform(
  ['redhat', 'centos', 'amazon'] => {
    'default' => {
      :repo => "#{repo_24}/rhel/6/x86_64/zabbix-release-2.4-1.el6.noarch.rpm",
      :name => 'zabbix-release-2.4-1.el6.noarch'
    }
  },
  'debian' => {
    'default' => {
      :repo => "#{repo_24}/debian/pool/main/z/zabbix-release/zabbix-release_2.4-1+wheezy_all.deb",
      :name => 'zabbix-release'
    }
  },
  'ubuntu' => {
    '12.04' => {
      :repo => "#{repo_22}/ubuntu/pool/main/z/zabbix-release/zabbix-release_2.2-1+precise_all.deb",
      :name => 'zabbix-release'
    },
    'default' => {
      :repo => "#{repo_24}/ubuntu/pool/main/z/zabbix-release/zabbix-release_2.4-1+trusty_all.deb",
      :name => 'zabbix-release'
    }
  }
)

default[cb]['repos'] = value_for_platform_family(
  'rhel' => [
    main_repo,
    {
      :repo => "#{repo_24}/rhel/6/x86_64/zabbix-get-2.4.1-1.el6.x86_64.rpm",
      :name => 'zabbix-get-2.4.1-1.el6.x86_64'
    },
    {
      :repo => "#{repo_24}/rhel/6/x86_64/zabbix-sender-2.4.1-1.el6.x86_64.rpm",
      :name => 'zabbix-sender-2.4.1-1.el6.x86_64'
    }
  ],
  'debian' => [main_repo]
)

default[cb]['server']['packages'] = [
  value_for_platform_family(
    'rhel'   => 'zabbix-web-mysql',
    'debian' => 'zabbix-frontend-php'
  ),
  'zabbix-server-mysql',
  'zabbix-get'
]

default[cb]['agent']['packages'] = [
  'zabbix-agent',
  'zabbix-sender'
]
default[cb]['agent']['service_name'] = 'zabbix-agent'

default[cb]['agent']['listen_port'] = '10050'
default[cb]['agent']['hostname']    = 'Some Zabbix Node'
default[cb]['agent']['server_ip']   = '127.0.0.1'

default[cb]['agent']['enable_active_checks']   = true
default[cb]['agent']['refresh_active_checks']  = 120
default[cb]['agent']['enable_remote_commands'] = '0'

default[cb]['agent']['advanced_params'] = {}
default[cb]['agent']['user_params']     = {}
