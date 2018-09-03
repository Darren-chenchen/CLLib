Pod::Spec.new do |s|
  s.name = 'CLLib'
  s.version = '1.0.0'
  s.swift_version = '4.0'
  s.license = 'MIT'
  s.summary = 'This is a components'
  s.homepage = 'https://github.com/Darren-chenchen/CLLib'
  s.authors = { 'Darren-chenchen' => '1597887620@qq.com' }
  s.source = { :git => 'https://github.com/Darren-chenchen/CLLib.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'CLLib/CLLib/**/*.swift'
  s.resource_bundles = { 
	'CLLib' => ['CLLib/CLLib/Images/**/*.png','CLLib/CLLib/**/*.{xib,storyboard}','CLLib/CLLib/**/*.{lproj,strings}']
  }
  s.dependency 'MJRefresh', '~> 3.1.15'
  s.dependency 'RxSwift',    '~> 4.0'
  s.dependency 'RxCocoa',    '~> 4.0'
  s.dependency 'RxDataSources', '~> 3.0.0'
  s.dependency 'IQKeyboardManager'
  s.dependency 'Alamofire', '~> 4.7.3'
  s.dependency 'ObjectMapper', '~> 3.3.0'
  s.dependency 'SnapKit', '~> 4.0.0'
  s.dependency 'SVProgressHUD', '~> 2.2.5'
  s.dependency 'ICDMaterialActivityIndicatorView', '~> 0.1.3'

end
