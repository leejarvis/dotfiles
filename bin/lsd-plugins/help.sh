## Print this help message

for file in "$lsd_plugins_path/"*
do
  echo $(basename $file:r) - $(head -10 $file | grep '^##' | sed 's/^## //' | sort)
done