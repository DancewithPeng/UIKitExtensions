platform :ios, "10.0"               # 指定平台和最低版本
inhibit_all_warnings!               # 无视所有警告
use_frameworks!                     # 使用framework代替静态库

pod "DPLog", "~> 3.0.0"
pod "DPKeychain", "~> 1.0.0"
pod "DPFoundationExtensions", "~> 1.0.1"

target "UIKitExtensions" do # target对应Xcode中的target
end

target "UIKitExtensionsExample" do # target对应Xcode中的target
  pod "Toast-Swift", "~> 5.0.0"
  pod "SnapKit", "~> 5.0.1"
end

target "UIKitExtensionsExample-ObjC" do # target对应Xcode中的target
  pod "Toast-Swift", "~> 5.0.0"
  pod "SnapKit", "~> 5.0.1"
end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings["IPHONEOS_DEPLOYMENT_TARGET"] = "10.0"
      end
    end
  end
end
