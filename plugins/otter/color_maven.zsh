#!zsh

#--------------------------------------------------------------------------
# Colorize Maven Output
#--------------------------------------------------------------------------


mvn(){
  if [ -z $OTTER_MAVEN_HOME ]; then
    echo "Please set \$OTTER_MAVEN_HOME to your Maven install location"
  else 
    color_maven
  fi
}


color_maven() {
  $OTTER_MAVEN_HOME/mvn $* | sed -e "s/\(\[WARN.*\].*\)/$fg[yellow]\1$reset_color/g" \
    -e "s/\(\[INFO\].*\)/$fg[cyan]\1$reset_color/g" \
    -e "s/\(\[STDERR\].*\)/$fg[red]\1$reset_color/g" \
    -e "s/\(\[ERROR\].*\)/$fg[red]\1$reset_color/g" \
    -e "s/\(\[STDOUT\].*\)/$fg[green]\1$reset_color/g" \
}

