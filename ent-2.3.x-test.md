
1. 首先验证企业版独立功能，测试的深度大概是每个功能点都测到，重点是每个流程都跑通：
测试kubernetes version： 重点是1.16   1.15简单回归即可
- [ ] macvlan
- [ ] nodedriver
- [ ] webhook-receiver
- [ ] gpu
- [ ] 单节点安装
- [ ] ha安装
- [ ] 离线安装
- [ ] login安全增强
- [ ] harbor
- [ ] audilog
- [ ] rdns

2. 验证社区版新增功能，测试的深度大概是每个功能点都测到，重点是每个流程都跑通：
测试kubernetes version： 1.16
- [ ] windows 
- [ ] hpa
- [ ] istio
- [ ] rke template
- [ ] node pool 
- [ ] taint


3. 社区版原有功能，测试的深度：每个流程都跑通：
测试kubernetes version： 1.16
