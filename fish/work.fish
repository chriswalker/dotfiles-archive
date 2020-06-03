#
# work.fish - work-related stuff, may delete in future
#
# @author Chris Walker
#

set -gx K8S_MANIFESTS_DIR $HOME/Dev/Projects/karhoo/k8s-manifests
set -gx K8S_VPN_USERNAME chris.walker
set -gx DATA_DIR $HOME/Dev/tmp

switch (uname)
case Linux
  # The next line updates PATH for the Google Cloud SDK.
  if [ -f '/home/chris/Downloads/google-cloud-sdk/path.fish.inc' ]; 
    . '/home/chris/Downloads/google-cloud-sdk/path.fish.inc'; 
  end
end

# Work stuff added to path
set PATH ~/Dev/Projects/karhoo/k-tools/bin $PATH
