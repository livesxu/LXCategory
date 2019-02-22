
Pod::Spec.new do |s|

  s.name         = "LXCategory"
  s.version      = "0.2.0"
  s.summary      = "LXCategory"
  s.homepage     = "https://github.com/livesxu/LXCategory"
  s.license      = "MIT"
  s.author       = { "livesxu" => "livesxu@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/livesxu/LXCategory.git", :tag => s.version }
  s.source_files  = "LXCategory/*.{h,m}"
  s.public_header_files = 'LXCategory/*.{h}'
  s.frameworks    = 'UIKit'
  s.requires_arc  = true

  non_arc_files = 'LXCategory/FCXSafeCollection.{h,m}'
  s.ios.exclude_files = non_arc_files
  s.subspec 'no-arc' do |sna|
    sna.requires_arc = false
    sna.source_files = non_arc_files
  end

end