#
# Be sure to run `pod lib lint HHDraggableView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HHDraggableView'
  s.version          = '0.1.2'
  s.summary          = 'A customizable UIView for iOS that can be dragged around the screen, with options for inertia and snapping to edges.'
  s.swift_versions = ['5.0', '5.1', '5.2']

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
HHDraggableUIView is a highly customizable, easy-to-use draggable UIView for iOS apps, perfect for creating interactive components that can be freely moved around the screen. This UIView subclass supports enabling and disabling drag capabilities, applying inertia to movements, and optionally snapping the view to the sides of the screen once dragging ends.

Features include:
- Simple to integrate with just a few lines of code.
- Full support for @IBDesignable properties, making it easy to configure via Interface Builder.
- Optional inertia that simulates a natural continuation of movement based on initial drag speed.
- An option to snap the view to the nearest side, enhancing the UI experience by aligning views neatly.
- Customizable friction for inertia and boundary conditions to keep the view within screen limits.

Ideal for apps requiring interactive elements like sliders, floating action buttons, panels, or any component that benefits from on-screen repositioning.
DESC

  s.homepage         = 'https://github.com/shamzahasan88/HHDraggableView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Hamza Hasan' => 'shamzahasan88@gmail.com' }
  s.source           = { :git => 'https://github.com/shamzahasan88/HHDraggableView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files = 'HHDraggableView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HHDraggableView' => ['HHDraggableView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
