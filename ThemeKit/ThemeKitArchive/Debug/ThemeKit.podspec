Pod::Spec.new do |s|
  s.name                    = 'ThemeKit'
  s.version                 = '0.0.1'
  s.license      	    = { :type => "Commercial", :file => "LICENSE" }
  s.summary                 = 'Simple theming of apps for consistent design based on Google's Material Design Guidelines.'
  s.platform                = :ios, '8.1'
  s.ios.vendored_library    = 'ThemeKit.framework'
end