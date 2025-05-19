Pod::Spec.new do |s|
  s.name             = 'ffmpeg_kit_flutter'
  s.version          = '6.0.3'
  s.summary          = 'FFmpeg Kit for Flutter'
  s.description      = 'A Flutter plugin for running FFmpeg and FFprobe commands.'
  s.homepage         = 'https://github.com/arthenica/ffmpeg-kit'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'ARTHENICA' => 'open-source@arthenica.com' }

  s.platform            = :ios
  s.requires_arc        = true
  s.static_framework    = true

  s.source              = { :path => '.' }
  s.source_files        = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'

  s.dependency          'Flutter'
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }

  # Dummy subspecs to satisfy plugin structure
  ['min', 'min-lts', 'min-gpl', 'min-gpl-lts',
   'https', 'https-lts', 'https-gpl', 'https-gpl-lts',
   'audio', 'audio-lts', 'video', 'video-lts',
   'full', 'full-lts', 'full-gpl', 'full-gpl-lts'].each do |variant|
    s.subspec variant do |ss|
      ss.source_files         = 'Classes/**/*'
      ss.public_header_files  = 'Classes/**/*.h'
      ss.ios.deployment_target = '12.1'
    end
  end
end
