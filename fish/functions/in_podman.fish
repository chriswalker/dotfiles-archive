function in_podman --description 'Determine whether fish shell is running in a Podman container'
  # Assumes Podman currently 
  if test -e /run/.containerenv
      echo "true"
      return
  end
  echo "false"
end
