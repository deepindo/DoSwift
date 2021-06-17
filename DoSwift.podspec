#
# Be sure to run `pod lib lint DoSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

    s.name         = "DoSwift"
    s.version      = "0.0.1"
    s.summary      = "DoSwift is a library which in Swift language."
    s.description  = "DoSwift is a library which contain marco、utility、global、libs、modules、extensions & tools for Swift language"

    s.homepage     = "https://github.com/deepindo/DoSwift"
    s.license      = "MIT"
    s.author       = { "deepindo" => "732872042@qq.com" }
    s.platform     = :ios
    s.ios.deployment_target = "9.0"
    s.swift_version = '5.0'

    s.source       = { :git => "https://github.com/deepindo/DoSwift.git", :tag => "0.0.1" }
    # s.source_files  = "Classes", "Classes/**/*.{h,m}"
    s.source_files = 'DoSwift/Classes/**/*{swift,h,m}'

    s.requires_arc = true
    # s.dependency 'AFNetworking', '~> 4.0.1'
        
    # s.resource  = "icon.png"
    # s.resources = "Resources/*.png"
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

    # s.resource_bundles = {
    #   'DoSwift' => ['DoSwift/Assets/*.png']
    # }

    # s.exclude_files = "Classes/Exclude"
    # s.public_header_files = "Classes/**/*.h"
    
    # s.preserve_paths = "FilesToSave", "MoreFilesToSave"
    # s.framework  = "SomeFramework"
    # s.frameworks = "SomeFramework", "AnotherFramework"
    # s.library   = "iconv"
    # s.libraries = "iconv", "xml2"
    
    # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
    # s.dependency "JSONKit", "~> 1.4"
    # s.dependency 'AFNetworking', '~> 2.3'
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    
    # s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
  
    # all subspec-------------------
    #  s.subspec 'DoGlobal' do |c|
    #    c.source_files = 'DoKit/Classes/DoGlobal/**/*.{swift,h,m}'
    #  end

    #  s.subspec 'DoExtension' do |c|
    #    c.source_files = 'DoKit/Classes/DoExtension/**/*.{swift,h,m}'
    #    #c.dependency 'SDWebImage', '~> 4.3.3'
    #  end

    #  s.subspec 'DoTools' do |t|
    #    t.source_files = 'DoKit/Classes/DoTools/**/*{swift,h,m}'
    #  end

    #  s.subspec 'DoPresenter' do |t|
    #    t.source_files = 'DoKit/Classes/DoPresenter/**/*{swift,h,m}'
    #  end
  
end
