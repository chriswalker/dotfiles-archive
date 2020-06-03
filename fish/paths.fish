#
# paths.fish - set up $PATH entries
#
# @author Chris Walker
#

# Golang
if test -e ~/Dev/Go
  set -x GOPATH ~/Dev/Go
  set -x GOBIN $GOPATH/bin

  switch (uname)
  case Linux
    set -g GOROOT /usr/local/go
  case Darwin
    set -g GOROOT /usr/local/Cellar/go@1.13/1.13.9/libexec
  end

  # Update path
  set PATH $GOROOT/bin $GOBIN $PATH

  # Set up proxy/checksum DB stuff
  # set -x GOPRIVATE "*"
  # set -x GONOSUMDB "*"
  # set -x GONOPROXY "*"
end

set PATH ~/bin $PATH

# GCP
switch (uname)
case Darwin
  set PATH ~/Dev/Work/google-cloud-sdk/bin $PATH
end
