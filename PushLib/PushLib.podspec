Pod::Spec.new do |s|
s.name             = "PushLib"
s.version          = "0.0.1"
s.summary          = "PushLib, Objective-C library to use the Zup Push Platform"
s.description      = "Objective-C library to use the Zup Push Platform integration, by using pod install and calling the sdk passing the needed data."
s.homepage         = "https://github.com/SamuelHFerreira/push-lib"
s.license          = 'MIT'
s.author           = { "samuel.ferreira" => "samuel.ferreira@zup.com.br" }
s.source           = { :git => "https://github.com/SamuelHFerreira/push-lib.git", :tag => s.version.to_s }

s.ios.deployment_target = '7.0'

s.source_files = 'PushLib/Classes/**/*'
s.resource_bundles = {
'PushLib' => ['PushLib/Assets/*.png']
}

s.dependency 'AFNetworking', '~> 2.6.3'
end