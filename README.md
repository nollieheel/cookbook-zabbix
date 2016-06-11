# cookbook-zabbix-cookbook

This cookbook is supposed to install the Zabbix server and agent. A direct rewrite of [this cookbook](https://github.com/nollieheel/ga/tree/master/cookbooks/chef-zabbix).

For now, there is only the `agent_package` recipe, which installs the agent. Server installation is future TODO.

## Supported Platforms

Redhat, Centos, Ubuntu

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['cookbook-zabbix']['agent']['listen_port']</tt></td>
    <td>String</td>
    <td>Port number where the Zabbix agent will listen on.</td>
    <td><tt>'10050'</tt></td>
  </tr>
  <tr>
    <td><tt>['cookbook-zabbix']['agent']['hostname']</tt></td>
    <td>String</td>
    <td>Human-friendly name for a monitored Zabbix node, also known in the Zabbix UI as hostname.</td>
    <td><tt>'Some Zabbix Node'</tt></td>
  </tr>
  <tr>
    <td><tt>['cookbook-zabbix']['agent']['server_ip']</tt></td>
    <td>String</td>
    <td>Location of the Zabbix server/s. Multiple IPs can be comma-separated.</td>
    <td><tt>'127.0.0.1'</tt></td>
  </tr>
  <tr>
    <td><tt>['cookbook-zabbix']['agent']['enable_active_checks']</tt></td>
    <td>Boolean</td>
    <td>Whether to enable active checks for this particular node or not.</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['cookbook-zabbix']['agent']['refresh_active_checks']</tt></td>
    <td>Integer</td>
    <td>Frequency (in seconds) of active checks, if enabled.</td>
    <td><tt>120</tt></td>
  </tr>
  <tr>
    <td><tt>['cookbook-zabbix']['agent']['enable_remote_commands']</tt></td>
    <td>String</td>
    <td>Whether to enable remote commands from the Zabbix server. Accepts the strings '1' for true, or '0' for false.</td>
    <td><tt>'0'</tt></td>
  </tr>
  <tr>
    <td><tt>['cookbook-zabbix']['agent']['advanced_params']</tt></td>
    <td>Hash</td>
    <td>Key-value pairs of strings to be included in the agent config file as advanced parameters.</td>
    <td><tt>{}</tt></td>
  </tr>
  <tr>
    <td><tt>['cookbook-zabbix']['agent']['user_params']</tt></td>
    <td>Hash</td>
    <td>Key-value pairs of strings to be included in the agent config file as user parameters.</td>
    <td><tt>{}</tt></td>
  </tr>
  <tr>
    <td><tt>['cookbook-zabbix']['agent']['packages']</tt></td>
    <td>Array</td>
    <td>Array of packages to be installed by an agent.</td>
    <td><tt>['zabbix-agent', 'zabbix-sender']</tt></td>
  </tr>
</table>

## Usage

### cookbook-zabbix::agent_package

After specifying the proper agent attributes, especially `server_ip` and `hostname`, include `cookbook-zabbix::agent_package` in your node's `run_list` to install the agent:

```json
{
  "run_list": [
    "recipe[cookbook-zabbix::agent_package]"
  ]
}
```

## License and Authors

Author:: Earth U (<iskitingbords @ gmail.com>)
