Pod::Spec.new do |s|
  s.name                  = 'AdaptiveUI'
  s.version               = '0.1.0'
  s.homepage              = 'https://github.com/nktssk/AdaptiveUI.git'
  s.authors               = { 'Nikita Sosyuk' => 'nikitashelov@gmail.com' }
  s.summary               = 'Backend Driven UI for iOS based on UIKit'
  s.source                = { :git => 'https://github.com/nktssk/AdaptiveUI.git', :tag => '1.0.0' }
  s.module_name           = 'AdaptiveUI'
  s.swift_version         = '5.5'
  s.ios.deployment_target = '13.0'
  s.source_files          = "AdaptiveUI/**/*"
  s.framework             = 'AdaptiveUI'
  s.ios.framework         = 'UIKit'
  s.user_target_xcconfig = { 'ONLY_ACTIVE_ARCH[sdk=iphonesimulator*]' => 'YES' }
  s.static_framework = true
  s.module_map = false
end
