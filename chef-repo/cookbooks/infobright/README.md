infobright Cookbook
========================

このCookbookはInfobrightCommunityEditionをインストールします。

InfobrightCommunityEditionについては以下をご覧下さい。
 http://www.infobright.org/

Requirements
------------

対応するOSは、CentOSです。

Attributes
----------
#### chef-infobright::install
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['infobright']['version']</tt></td>
    <td>String</td>
    <td>InfobrightCommunityEditionのバージョン</td>
    <td><tt>4.0.7</tt></td>
  </tr>
</table>

Usage
-----
#### chef-infobright::install
Infobrightのインストールと自動起動設定を行います。

Just include `chef-infobright:install` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chef-infobright:install]"
  ]
}
```

License and Authors
-------------------
Authors: Takeshi Mikami
