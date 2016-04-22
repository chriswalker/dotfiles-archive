#
# Set up path
# -----------------------------------------------------------------------------

export PATH=~/Dev/Clients/SITA/lib/apache-maven-3.0.5/bin:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_67.jdk/Contents/Home
# Apple's own JRE 1.6
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
export JDK_HOME=$JAVA_HOME
export M2_REPO=~/.m2/repository


#
# Functions
# -----------------------------------------------------------------------------

# SITA/GSL-related functions

gslComp() {
  cd $SITA_HOME/Components/$1
}

gslUtil() {
  cd $SITA_HOME/Utils/$1
}

gslApps() {
  cd $SITA_HOME/../Apps/$1
}

mvnDeps() {
  mvn dependency:tree $1
}

#
# Aliases
# -----------------------------------------------------------------------------

# SITA-related aliases
export SITA_HOME=~/Dev/Clients/SITA/GSL/
alias gslcomp=gslComp
alias gslutil=gslUtil
alias gslapps=gslApps
alias gslinf='cd $SITA_HOME/Infrastructure'
alias mvndeps=mvnDeps


