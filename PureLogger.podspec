Pod::Spec.new do |s|


s.platform = :ios
s.name = "PureLogger"
s.summary = "Elegant replacement of Swift.print()"
s.requires_arc = true
s.version = "0.2"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Mikhail Panfilov & Serhii Kharauzov" => "wwrs69@gmail.com" }
s.homepage = "https://github.com/Kharauzov/PureLogger"
s.source = { :git => "https://github.com/Kharauzov/PureLogger.git",
:tag => s.version }
s.source_files = "PureLogger/**/*.{swift}"
s.swift_version = "5.0"
s.ios.deployment_target = '10.0'
s.tvos.deployment_target = '10.0'
s.osx.deployment_target = '10.12'
end

