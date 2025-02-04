require_relative "lib/torch/version"

Gem::Specification.new do |spec|
  spec.name          = "torch-rb"
  spec.version       = Torch::VERSION
  spec.summary       = "Deep learning for Ruby, powered by LibTorch"
  spec.homepage      = "https://github.com/ankane/torch-rb"
  spec.license       = "MIT"

  spec.author        = "Andrew Kane"
  spec.email         = "andrew@chartkick.com"

  spec.files         = Dir["*.{md,txt}", "{ext,lib}/**/*"]
  spec.require_path  = "lib"
  spec.extensions    = ["ext/torch/extconf.rb"]

  spec.required_ruby_version = ">= 2.4"

  spec.add_dependency "rice"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "minitest", ">= 5"
  spec.add_development_dependency "numo-narray"
end
