Pod::Spec.new do |s|
  s.name = 'ipass-ios'
  s.module_name = 'ipass_ios'
  s.version = '0.0.1'
  s.license = 'LICENSE'
  s.summary = 'Elegant HTTP Networking in Swift'
  s.homepage = 'https://github.com/yazanalqasem/ipass-ios.git'
  s.author = { 'yazanalqasem' => 'yalqasem@ipass-mena.com' }
  s.source = { :git => 'https://github.com/yazanalqasem/ipass-ios.git', :tag => s.version }
  s.platform = :ios, '13.0'
  s.ios.deployment_target = '13.0'
  s.requires_arc = true
  s.swift_version = '5.0'
  s.source_files = 'ipass_ios/APIManager/*.swift', 'ipass_ios/Sources/Apis.swift', 'ipass_ios/Model/iPass/*.swift', 'ipass_ios/Model/SocialMedia/*.swift', 'ipass_ios/Model/PostData/*.swift', 'ipass_ios/Model/KYC/*.swift'
  s.frameworks = 'UIKit', 'Alamofire'
  s.xcconfig = { 'LIBRARY_SEARCH_PATHS' => '$(SDKROOT)/usr/lib/swift' }
  s.dependency 'Alamofire'
end

