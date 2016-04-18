#
# Be sure to run `pod lib lint PushLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PushLib"
  s.version          = "0.0.1"
  s.summary          = "PushLib, Objective-C library to use the Zup Push Platform"

  s.description      = <<-DESC
                       DESC

  s.homepage         = "https://github.com/SamuelHFerreira/push-lib"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "samuel.ferreira" => "samuel.ferreira@zup.com.br" }
  s.source           = { :git => "https://github.com/<SamuelHFerreira/push-lib.git", :tag => s.version.to_s }

  s.ios.deployment_target = '7.0'

  s.source_files = 'PushLib/Classes/**/*'
  s.resource_bundles = {
    'PushLib' => ['PushLib/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
