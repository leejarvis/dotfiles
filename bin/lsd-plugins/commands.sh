## List all available lsd commands

for cmd in $(ls -1 $lsd_plugins_path)
do
  echo $cmd:r
done | sort