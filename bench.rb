require 'benchmark'

require 'fast-aleck'
require 'rubypants'
require 'typogruby'

alice = File.read('../input/alice.txt')

Benchmark.bmbm do |r|
  r.report('alice-rubypants') do 
    100.times do
      RubyPants.new(alice).to_html
    end
  end
  r.report('alice-typogruby') do 
    100.times do
      Typogruby.improve(alice)
    end
  end
  r.report('alice-fast-aleck') do 
    100.times do
      config = FastAleck::Config.new
      config[:wrap_amps] = 1
      FastAleck.process(config, alice)
    end
  end
end

