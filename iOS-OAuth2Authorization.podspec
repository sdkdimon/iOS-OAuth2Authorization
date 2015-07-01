Pod::Spec.new do |s|
  s.name         = "iOS-OAuth2Authorization"
  s.version      = "0.0.1"
  s.summary      = "Abstract iOS OAuth2 authorization library."
  s.homepage     = "https://github.com/sdkdimon/iOS-OAuth2Authorization"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Dmitry Lizin" => "sdkdimon@gmail.com" }
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/sdkdimon/iOS-OAuth2Authorization.git", :tag => "0.0.1" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.public_header_files = "Classes/**/*.h"
end
