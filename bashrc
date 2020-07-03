export DM_BIN=/opt/dm/bin
export PATH=$PATH:$DM_BIN

alias_targets=$(find $DM_BIN -name '*.exe')

for target in $(find $DM_BIN -name '*.exe'); do
  alias $(basename $target | cut -d '.' -f 1)="wine $target"
done

alias cc="wine $DM_BIN/dmc.exe"
alias exe2bin="wine $DM_BIN/EXE2BIN.COM"
