EXCLUDES = [ 'Rakefile' ]
NOT_CONFIG = [ 'bin' ]

desc 'install system symlinks'
task :install do
  files = Dir.glob('*').reject { |f| EXCLUDES.include? f }
  files.map! do |f|
    filename = File.join(ENV['HOME'], NOT_CONFIG.include?(File.basename(f)) ? f : ".#{f}")
    [File.expand_path(f), filename]
  end
  paths = Hash[files]

  paths.each do |from, to|
    sh "ln -s #{from} #{to}" unless File.symlink?(to)
  end
end

task :default => :install