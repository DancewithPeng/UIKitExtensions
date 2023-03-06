Pod::Spec.new do |spec|
  spec.name = "DPUIKitExtensions"
  spec.version = "1.4.1"
  spec.summary = "UIKit的相关扩展"
  spec.description = <<-DESC
                      UIKit的相关扩展，为了方便使用UIKit的API
                   DESC
  spec.homepage = "https://github.com/DancewithPeng/UIKitExtensions.git"
  spec.license = { :type => "MIT", :file => "LICENSE" }
  spec.author = { "DP" => "dancewithpeng@gmail.com" }

  spec.platform = :ios, "12.0"
  spec.swift_version = "5.7"

  spec.source = { :git => "https://github.com/DancewithPeng/UIKitExtensions.git", :tag => "#{spec.version}" }
  spec.source_files = "UIKitExtensions/Sources", "UIKitExtensions/Sources/**/*.{swift}"
  spec.resource_bundle = {
    "DPUIKitExtensions" => ["UIKitExtensions/Resources/*.*"],
  }

  spec.dependency "DPLog", "~> 3.0.0"
  spec.dependency "DPKeychain", "~> 1.0.0"
  spec.dependency "DPFoundationExtensions", "~> 1.0.1"
end
