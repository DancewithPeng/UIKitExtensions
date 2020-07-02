# DPKeychain

苹果钥匙串基本操作封装



## 导入

```ruby
pod 'DPKeychain', '~> 1.0.0'
```



## 使用

保存密码到KeyChain

```swift
let password: String = ...
let keychainItem = KeychainPasswordItem(service: "com.dp.service.demo", account: "dpdemo", accessGroup: nil)
try keychainItem.savePassword(password)
```

从KeyChain中读取密码

```swift
let passwordItems = try KeychainPasswordItem.passwordItems(forService: "com.dp.service.demo", accessGroup: nil)
if let keychainItem = passwordItems.first(where: { (item) -> Bool in
		return item.account == "dpdemo"
}) {
  	let password = try deviceUUIDItem.readPassword()
}
```

> 这里可以都会抛出异常，需要放在try-catch代码块中处理



## LICENSE

此项目采用**MIT**开源协议，[点击查看详情](LICENSE)