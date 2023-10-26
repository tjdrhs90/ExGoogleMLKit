# Uncomment the next line to define a global platform for your project
platform :ios, '17.0'

target 'ExGoogleMLKit' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for ExGoogleMLKit
  
  pod 'GoogleMLKit/Translate', '3.2.0'
  
end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      # Needed for building for simulator on M1 Macs
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '17.0'
    end
  end
end
