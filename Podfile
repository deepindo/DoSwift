source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git' #国内公有索引库
source 'https://github.com/deepindo/DoSpecs.git' #私有索引库
platform :ios, '9.0'

target 'DoSwift' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for DoSwift

# 忽略引入库的所有警告, 也可以在bulid-setting中设置YES
  inhibit_all_warnings!

  # Pods for SalaryManagement
# private spec
  pod 'DoKit'
  
  # Auto Layout
  pod 'SnapKit'
  
  # Networking
  pod 'Alamofire'

  # JSON Mapping
  pod 'SwiftyJSON'
  pod 'HandyJSON'

  # UI
  pod 'MJRefresh'
  pod 'EmptyKit'
  pod 'Toast-Swift'
  pod 'BRPickerView'
  pod 'SVProgressHUD'
  pod 'NVActivityIndicatorView'
  
  # Keyboard
  pod 'IQKeyboardManagerSwift'

  target 'DoSwiftTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'DoSwiftUITests' do
    # Pods for testing
  end

end
