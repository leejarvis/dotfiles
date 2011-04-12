EXCLUDES = [ 'Rakefile' ]

desc 'install system symlinks'
task :install do
  files = Dir.glob('*').reject { |f| EXCLUDES.include? f }
  files.map! { |f| [File.expand_path(f), File.join(ENV['HOME'], ".#{f}")] }
  paths = Hash[files]

  paths.each do |from, to|
    sh "ln -s #{from} #{to}"
  end
end