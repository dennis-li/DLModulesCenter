Pod::Spec.new do |s|
  s.name         = "DLModulesCenter"
s.version      = "0.0.2"
  s.summary      = "DLModulesCenter"
  s.description  = <<-DESC
	                    React description.
			                       DESC
  s.homepage     = "https://scm.qiyi.domain/#/admin/projects/mobile-ios/pods/React"
  s.license      = { :type => 'MIT', :text => <<-LICENSE
							                       LICENSE
										                          }

  s.author       = { "Dennis Lee" => "lixu.dennislee@gmail.com" }

  s.platform     = :ios
  s.ios.deployment_target = '7.0'

  s.source       = { :git => "https://github.com/dennis-li/DLModulesCenter.git", :tag => s.version }

  s.source_files = 'Include/*.h'
  s.public_header_files = 'Include/*.h'
#  s.resources = ['React.xcassets']

  s.dependency 'React'

# s.framework = 'SystemConfiguration'
 s.preserve_paths = 'Release'
 s.ios.vendored_libraries = 'Release/libDLModulesCenter.a'
					         
# s.library = 'c++'

 s.requires_arc = true
			
  end

