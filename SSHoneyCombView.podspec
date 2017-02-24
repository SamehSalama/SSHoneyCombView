#
# Be sure to run `pod lib lint SSHoneyCombView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SSHoneyCombView'
  s.version          = '0.1.0'
  s.summary          = 'A honey comb View that looks like a collection view with hexagon shaped items written in Swift 3.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A honey comb View that looks like a collection view with hexagon shaped items written in Swift 3.
Very Simple to use.
                       DESC

  s.homepage         = 'https://github.com/samehsalama@hotmail.com/SSHoneyCombView'
  # s.screenshots     = 'https://dl.dropboxusercontent.com/u/100318614/SSHoneyCombView/SSHoneyCombView.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'samehsalama@hotmail.com' => 'samehsalama@hotmail.com' }
  s.source           = { :git => 'https://github.com/samehsalama@hotmail.com/SSHoneyCombView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SSHoneyCombView/Classes/**/*'
  
  s.resource_bundles = {
  #   'SSHoneyCombView' => ['SSHoneyCombView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
