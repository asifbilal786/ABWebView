Pod::Spec.new do |s|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
s.name             = 'ABWebView'
s.version          = '0.2'
s.summary          = 'This is web view controller which can be used for loading URL using WKWebView.'
s.description      = <<-DESC
A utility control which is using fast WKWebView in replacement of UIWebView which is introduced in iOS8. Just set URL to load and it will do the rest. Very easy to implement. This is very useful when loading 'Terms of Services' OR 'Privacy Policy' web pages.
DESC

s.homepage         = 'https://github.com/asifbilal786/ABWebView'
s.frameworks       = 'UIKit'
s.requires_arc     = true


# ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
s.license          = { :type => 'MIT', :file => 'LICENSE' }



# ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
s.author           = { 'Asif Bilal' => 'asifbilal786@gmail.com' }


# ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
s.platform     = :ios, "8.0"


# ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
s.source           = { :git => 'https://github.com/asifbilal786/ABWebView.git', :tag => s.version }
s.social_media_url = 'https://twitter.com/asifbilal786'

s.default_subspec  = 'Source'

s.subspec 'Source' do |sp|

sp.source_files = 'Pod', 'ABWebView/Source/*.swift', 'ABWebView/Source/*.xib'
end


end
