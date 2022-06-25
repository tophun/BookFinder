# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def networking_pods
  # https://github.com/Alamofire/Alamofire
  pod 'Alamofire'
end

def image_pods
  # https://github.com/onevcat/Kingfisher
  pod 'Kingfisher', '~> 7.0'
end

def autolayout_dsl_pods
  # https://github.com/SnapKit/SnapKit
  pod 'SnapKit', '~> 5.6.0'
end

def etc_pods
  # https://github.com/devxoul/Then
  pod 'Then'
end

target 'BookFinder' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for BookFinder
  networking_pods
  image_pods
  autolayout_dsl_pods
  etc_pods

  target 'BookFinderTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
