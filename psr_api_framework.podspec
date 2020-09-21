#
# Be sure to run `pod lib lint psr_api_plugin.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'psr_api_framework'
  s.swift_version = "5.2.4"
  s.version          = '1.0.1'

  s.summary = "psr_api_framework vous permettant d'intégrer plus facile l'API PSR de PayDunya dans votre projet Swift"
  s.description = "Afin de permettre de facilité l'intégration de l'API PSR de PayDunya, Cette librairie est mise en place. Vous pouvez désormais utiliser cette API en faisant un simple import. "

  s.homepage         = 'https://github.com/mhdcamara/psr_api_framework'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mhdcamara' => 'camara.mouhamed@paydunya.com' }
  s.source           = { :git => 'https://github.com/mhdcamara/psr_api_framework.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files = 'psr_api_framework/**/*.{h,m,swift}'
  
  s.resources = 'psr_api_framework/**/*.xib'

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'Foundation'
   s.dependency 'Alamofire', '~> 4.8.2'
   s.dependency 'SwiftyJSON'
   s.dependency 'EzPopup'
   s.dependency 'SKCountryPicker'
   s.dependency 'MaterialComponents/TextControls+OutlinedTextAreas'
   s.dependency 'MaterialComponents/TextControls+OutlinedTextFields'
   s.dependency 'EasyTipView', '~> 2.0.4'
end
