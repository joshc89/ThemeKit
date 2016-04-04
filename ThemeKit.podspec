Pod::Spec.new do |s|

  s.name         = "ThemeKit"
  s.version      = "0.2.1"
  s.summary      = "Simple theming of apps for consistent design."

  s.description  = <<-DESC
                   
	Simple theming of apps for consistent design.

                   DESC

  s.homepage     = "http://www.joshcampion.co.uk"
  s.license      = { :type => "Restricted Use License", :file => "../LICENSE" }
  s.author             = { "Josh Campion" => "joshcampion89@gmail.com" }
  s.platform     = :ios, "8.0"
  s.cocoapods_version = '>= 0.39'
  s.requires_arc = true
  s.vendored_frameworks = 'ThemeKitCore.framework'

end
