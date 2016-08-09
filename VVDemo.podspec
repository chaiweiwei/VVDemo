Pod::Spec.new do |s|

  s.name         = "VVDemo"
  s.version      = "1.0.0"
  s.summary      = "VVDemo"
  s.license = "MIT"

  s.homepage     = "https://github.com/chaiweiwei/VVDemo"
  s.author             = { "chaiweiwei" => "email@address.com" }
  s.source       = { :git => "https://github.com/chaiweiwei/VVDemo.git", :tag => "1.0.0" }
  s.source_files  = "VV_Demo", "VV_Demo/**/*.{h,m}"
  s.platform     = :ios, "8.0"

  s.dependency 'YYText'
  s.dependency 'TTTAttributedLabel'
  s.dependency 'MJRefresh'
  s.dependency 'YYWebImage'
  s.dependency 'Mantle'
  s.dependency 'UITableView+FDTemplateLayoutCell'
  s.dependency 'FBRetainCycleDetector'
  s.dependency 'EDColor'
  s.dependency 'SDCycleScrollView'

  s.requires_arc = true
 
end
