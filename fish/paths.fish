#
# paths.fish - set up $PATH entries
#
# @author Chris Walker
#

set PATH ~/.local/bin $PATH

# Golang, provided we're in a toolbox container
if string match -q "true" (in_podman)
  set -x GOPATH /opt/go
  set -x GOBIN $GOPATH/bin

  # set -g GOROOT /usr/lib/golang

  # Update path
  set PATH $GOROOT/bin $GOBIN $PATH

  # Set up proxy/checksum DB stuff
  # set -x GOPRIVATE "*"
  # set -x GONOSUMDB "*"
  # set -x GONOPROXY "*"
end
