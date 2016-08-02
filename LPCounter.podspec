Pod::Spec.new do |s|

#
s.platform = :ios

s.ios.deployment_target = '8.0'

s.name = "LPCounter"

s.summary = "LPCounter - permormace counter."

s.requires_arc = true

#
s.version = "0.1.0"

#
s.license = { :type => "MIT", :file => "LICENSE" }

#
s.author = { "Liubomyr Hlozhyk" => "lyubomyr.hlozhyk@gmail.com" }

s.homepage = "https://github.com/lyupko/LPCounter.git"

#
s.source = { :git => "https://github.com/lyupko/LPCounter.git", :tag => "#{s.version}"}

#
s.framework = "Foundation"

#
s.source_files = "LPCounter/**/*.{swift}"

#
s.resources = "LPCounter/**/*.{png,jpeg,jpg,storyboard,xib}"

end