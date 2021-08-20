#!/bin/bash 

# to enable debug trace
# set -x

# execute when inside the directory containing the actual files

git submodule update --init --recursive

BASE=$PWD

# sed removes the lines containing '#' assuming a comment
cat $BASE/fileList | sed '/#.*$/d' | while read l
do
  echo "l = $l";

  if [[ "$l" == "" ]]; then
    echo "Skipping empty line: $l"
    continue;
  fi;

  # first is source, 2nd destination
  SF=$(echo $l | awk '{print $1}')
  SF="${BASE}/${SF}"

  DF=$(echo $l | awk '{print $2}')
  DF="${HOME}/${DF}"
 
  if [[ -z "$SF" ]]; then
    echo "Bad line with empty col 1: $l";
    exit -1;
  fi

  if [[ -z "$DF" ]]; then
    echo "Bad line with empty col 2: $l";
    exit -1;
  fi

  echo "SF=$SF, DF=$DF";

  # if is a symbolic link
  if [ -h "$DF" ]; then
    echo "removing symbolic link $DF"
    rm "$DF"
  else
    DF_BAK="${DF}.bak"
    echo "backing up ${DF} to ${DF_BAK}"
    mv "$DF" "$DF_BAK"
  fi

  echo "linking to $SF from $DF"
  ln -s "$SF" "$DF"

done

VIM_BAKDIR="$HOME/.backup"
# make a .backup dir for storing vim backups
mkdir $VIM_BAKDIR

# zsh powerlevel10k theme
if [[ -f $PWD/zsh/powerlevel10k ]]; then
  ln -s $PWD/zsh/powerlevel10k/ $PWD/zsh/oh-my-zsh/themes/powerlevel10k
fi

# update font cache
fc-cache 
