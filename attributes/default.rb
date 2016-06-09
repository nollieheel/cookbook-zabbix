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

# The attribute 'package_url' will determine the version of zabbix.
# In this case, it's whatever is latest on the 2.4 line.
url_pref = 'http://repo.zabbix.com/zabbix/2.4'
default[cb]['repo']['package_url'] = value_for_platform(
  ['redhat', 'centos', 'amazon'] => {
    'default' => "#{url_pref}/rhel/6/x86_64/zabbix-release-2.4-1.el6.noarch.rpm"
  },
  'debian' => {
    'default' => "#{url_pref}/debian/pool/main/z/zabbix-release/zabbix-release_2.4-1+wheezy_all.deb"
  },
  'ubuntu' => {
    'default' => "#{url_pref}/ubuntu/pool/main/z/zabbix-release/zabbix-release_2.4-1+trusty_all.deb"
  }
)
default[cb]['repo']['package_name'] = value_for_platform_family(
  'rhel'   => 'zabbix-release-2.4-1.el6.noarch',
  'debian' => 'zabbix-release'
)

default[cb]['install']['agent_packages'] = ['zabbix-agent']

default[cb]['agent']['listen_port']            = '10050'
default[cb]['agent']['hostname']               = 'Some Zabbix Node'
default[cb]['agent']['server_ip']              = '127.0.0.1'
default[cb]['agent']['enable_active_checks']   = true
default[cb]['agent']['refresh_active_checks']  = 120
default[cb]['agent']['enable_remote_commands'] = '0'
default[cb]['agent']['advanced_params']        = {}
default[cb]['agent']['user_params']            = {}
default[cb]['agent']['service_name']           = 'zabbix-agent'
