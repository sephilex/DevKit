#
# Be sure to run `pod lib lint DevKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DevKit'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DevKit.'
  s.homepage         = 'https://github.com/sephilex/DevKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sephilex' => 'sephilex@gmail.com' }
  s.source           = { :git => 'https://github.com/sephilex/DevKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '14.0'
  s.default_subspec    = 'Full'
  # s.source_files = 'DevKit/Classes/**/*'

  s.subspec 'CommonError' do |ss|
    ss.source_files   = "Sources/DevKit/CommonError/**/*.{swift}"
    ss.dependency 'Moya'
    ss.dependency 'SwifterSwift'
  end

  s.subspec 'TestPod' do |ss|
    ss.source_files   = "Sources/DevKit/TestPod/**/*.{swift}"
  end

  s.subspec 'Networking' do |ss|
    ss.source_files   = "Sources/DevKit/Networking/**/*.{swift}"
    ss.dependency 'Moya'
    ss.dependency 'Toaster'
    ss.dependency 'DevKit/CommonError'
    ss.dependency 'DevKit/Core'
  end

  s.subspec 'Core' do |ss|
    ss.source_files   = "Sources/DevKit/Core/**/*.{swift}"
    ss.dependency 'RxSwift'
    ss.dependency 'RxCocoa'
    ss.dependency 'RxSwiftExt'
    ss.dependency 'NSObject+Rx'
    ss.dependency 'RxDataSources'
    ss.dependency 'Kingfisher'
    ss.dependency 'TinyConstraints'
    ss.dependency 'Then'
  end

  s.subspec 'Full' do |full|
    full.dependency 'DevKit/CommonError'
    full.dependency 'DevKit/Networking'
    full.dependency 'DevKit/Core'
  end
  
  # s.resource_bundles = {
  #   'DevKit' => ['DevKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
