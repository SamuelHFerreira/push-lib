Pod::Spec.new do |s|
s.name             = "PushLib"
s.version          = "0.0.2"
s.summary          = "PushLib, Objective-C library to use the Zup Push Platform"
s.description      = "Objective-C library to use the Zup Push Platform integration, by using pod install and calling the sdk passing the needed data."
s.homepage         = "https://github.com/SamuelHFerreira/push-lib"
s.license          = { :type => 'MIT', :text => <<-LICENSE
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

LICENSE
}
s.author           = { "samuel.ferreira" => "samuel.ferreira@zup.com.br" }
s.source           = { :git => "https://github.com/SamuelHFerreira/push-lib.git", :tag => s.version.to_s }

s.ios.deployment_target = '7.0'

s.source_files = 'PushLib/PushLib/Classes/**/*'
s.resource_bundles = {
'PushLib' => ['PushLib/Assets/*.png']
}

s.dependency 'AFNetworking', '~> 2.6.3'
s.dependency 'OCMapper', '2.1'

end