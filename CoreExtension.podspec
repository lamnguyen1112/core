#
#  Be sure to run `pod spec lint CoreExtension.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "CoreExtension"
  spec.version      = "0.0.1"
  spec.summary      = "Core Extension"

  spec.description  = <<-DESC
  Core Extension have common extension Foundation, UIKit, SwiftUIs, etc...
                   DESC

  spec.homepage     = "https://github.com/lamnguyen1112/core"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Lam Nguyen" => "lamnguyen1112@gmail.com" }

  spec.ios.deployment_target = "12.1"
  spec.swift_version = "5.0"

  spec.source        = { :git => "https://github.com/lamnguyen1112/core.git", :tag => "#{spec.version}" }
  spec.source_files  = "CoreExtension/**/*.{h,m,swift}"
  
  # spec.resources = "CoreExtension/Resources/*.png"

end
