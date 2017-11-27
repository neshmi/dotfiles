USER=$(whoami)
ROOT=/Users/${USER}/Library/Application\ Support/Steam/Steam.AppBundle/Steam/Contents/MacOS/

function fix_names(){
  pushd "$1"
  ls $2 | while read line
  do
    file=$(echo $line|tr '[:upper:]' '[:lower:]')
    mv "$line" "$file"
  done
  popd
}

for dir in public cached friends graphics servers
do
  if [ -d "$ROOT/$dir" ]; then
    echo -e "\nFixing $dir directory"
    for type in "*.tga" "*.res"
    do
      echo -e "\nFixing $type files"
      fix_names "$ROOT/$dir" $type
    done
  fi
done
