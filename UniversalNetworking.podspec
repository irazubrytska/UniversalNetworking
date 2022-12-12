Pod::Spec.new do |spec|

spec.name = 'UniversalNetworking'
spec.version = '1.0.2'
spec.author = 'Iryna Zubrytska'
spec.license = { :type => 'MIT', :text => <<-LICENSE
                   Copyright (c) 2022, Iryna Zubrytska
                   All rights reserved.
                 LICENSE
               }
spec.homepage = 'https://github.com/irazubrytska/UniversalNetworking'
spec.source = { :git => 'https://github.com/irazubrytska/UniversalNetworking.git', :tag => '1.0.2' }
spec.summary = 'This is framework for networking.'
spec.swift_version = '5.7'
spec.platform = :ios, '14'
spec.source_files = 'Sources/UniversalNetworking/*'

end
