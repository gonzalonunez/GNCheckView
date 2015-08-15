#
# Be sure to run `pod lib lint GNCheckView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "GNCheckView"
  s.version          = "0.1.7"
  s.summary          = "A UIView subclass that neatly animates between a checked and an unchecked state."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
			A UIView subclass that neatly animates between a checked and an unchecked state. Serves as a nice alternative to UITableViewAccessoryTypeCheckmark or for any other of your check-marking needs!
                       DESC
  s.homepage         = "https://github.com/gonzalonunez/GNCheckView"
  s.license          = 'MIT'
  s.author           = { "Gonzalo Nunez" => "gonzi@tcpmiami.com" }
  s.source           = { :git => "https://github.com/gonzalonunez/GNCheckView.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/gonz_ponz'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'GNCheckView' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
end
