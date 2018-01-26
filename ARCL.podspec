Pod::Spec.new do |s|
  s.name         = "ARCL"
  s.version      = "1.0.2"
  s.summary      = "ARKit + CoreLocation combines the high accuracy of AR with the scale of GPS data."
  s.homepage     = "https://github.com/ProjectDent/arkit-corelocation"
  s.author       = { "Andrew Hart" => "Andrew@ProjectDent.com" }
  s.license      = { :type => 'MIT', :file => 'LICENSE'  }
  s.source       = { :git => "https://ProjectDent@github.com/ProjectDent/ARKit-CoreLocation.git", :tag => s.version.to_s, :submodules => false }
  s.platform     = :ios, '9.0'
  s.requires_arc = true
  s.source_files = 'ARKit+CoreLocation/Source/*.swift', 'ARKit+CoreLocation/Views/*.{swift,xib}'
  s.resource_bundles = {
     'ARCL' => ['ARKit+CoreLocation/Views/*.xib', 'ARKit+CoreLocation/Assets/*.xcassets', 'ARKit+CoreLocation/Assets.xcassets/**/*.{png}']
  }
  s.subspec 'Resources' do |resources|
    resources.resource_bundle = {'ARCL' => ['Resources/**/*.{png}']}
  end
  s.frameworks   = 'Foundation', 'UIKit', 'ARKit', 'CoreLocation', 'MapKit', 'SceneKit'
  s.ios.deployment_target = '9.0'
end
