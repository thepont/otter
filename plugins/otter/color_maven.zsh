#!zsh

#--------------------------------------------------------------------------
# Colorize Maven Output
#--------------------------------------------------------------------------

# Remap the mvn shortcut
mvn(){
  if [ -z $OTTER_MAVEN_HOME ]; then
    echo "Please set \$OTTER_MAVEN_HOME to your Maven install location"
  else 
    color_maven $@
  fi
}

# The actual coloring
color_maven() {
  $OTTER_MAVEN_HOME/mvn $@ | sed -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/$fg[green]Tests run: \1$reset_color, Failures: $fg[red]\2$reset_color, Errors: $fg[yellow]\3$reset_color, Skipped: $fg[blue]\4$reset_color/g" \
    -e "s/\(\[WARN.*\].*\)/$fg[yellow]\1$reset_color/g" \
    -e "s/\(WARN.*\)/$fg[yellow]\1$reset_color/g" \
    -e "s/\(\[INFO\].*\)/$fg[cyan]\1$reset_color/g" \
    -e "s/\(INFO.*\)/$fg[cyan]\1$reset_color/g" \
    -e "s/\(\[STDERR\].*\)/$fg[red]\1$reset_color/g" \
    -e "s/\(\[ERROR\].*\)/$fg[red]\1$reset_color/g" \
    -e "s/\(ERROR.*\)/$fg[red]\1$reset_color/g" \
    -e "s/\(\[STDOUT\].*\)/$fg[green]\1$reset_color/g" \
}