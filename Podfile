source 'https://github.com/CocoaPods/Specs.git'

workspace 'FoodSearch'
platform :ios, '13.0'

def dependencyManager
    pod 'Dip'
end

def network
    pod 'Alamofire'
end

def autolayout
    pod 'TinyConstraints'
end

target 'FoodSearch' do

  dependencyManager
  network
  autolayout

  pod 'NVActivityIndicatorView'

  target 'FoodSearchTests' do
    inherit! :search_paths
  end
end
