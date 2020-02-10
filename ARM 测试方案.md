# ARM 测试方案

## 添加CCE集群
#### 测试各选项
- Business
- Management Scale count
- High Availability
- Container Network Mode
- Container Network Cidr
- VPC Name
- Subnet Name
- Cluster Label
- Zone
- Billing Mode
- Data Volume Type
- Data Volume Size
- Root Volume Type
- Root Volume Size
- Node Flavor
- Node Count
- Node Operation System
- Login Mode
- Eip
- Pre Install bash
- Certificate
- Node Label
- Cluster Type --> Zone --> Node Flavor 联动

## 导入集群
- 可以导入集群，system project下各workload启动成功

## Monitoring
- cattle-prometheus namespace下的所有workload成功启动
- 	验证prometheus-server；使用prometheus-server开放的NodePort访问，并且可以查询到相关监控数据
- 验证prometheus-node-exporter；可通过 curl ip:port/metrics 访问到监控指标
- 验证	prometheus-alertmanager；使用prometheus-alertmanager开放的NodePort访问页面，页面显示内容正确即可。

## Logging
- cattle-logging namespace 下的所有workload成功启动
- 配置项目级别logging，项目日志可发送到 指定的endpoint（只测试splunk）
- 配置集群级别logging，集群日志可发送到 指定的endpoint（只测试splunk）

## 华为版本独立功能
- business

## 开源版功能
- 保证每个功能可用，不做过多详细测试
