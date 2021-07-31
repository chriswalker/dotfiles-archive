#
# paths.fish - set up $PATH entries
#
# @author Chris Walker
#

# Golang
if test -e ~/Dev/Go
  set -x GOPATH ~/Dev/Go
  set -x GOBIN $GOPATH/bin

  # Sam for Linux + Darwin, provided we use standard installer
  # on Macs and not Homebrew
  set -g GOROOT /usr/local/go

  # Update path
  set PATH $GOROOT/bin $GOBIN $PATH

  # Set up proxy/checksum DB stuff
  # set -x GOPRIVATE "*"
  # set -x GONOSUMDB "*"
  # set -x GONOPROXY "*"
end

set PATH ~/bin $PATH

