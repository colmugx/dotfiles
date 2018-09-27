# go
set -gx GOPATH $HOME/go
if test -d $GOPATH/bin
  set -gx PATH $GOPATH/bin $PATH
end

# rust
if test -d $HOME/.cargo/bin
  set -gx PATH $HOME/.cargo/bin $PATH
end

# android
if test -d /sdk
  set -gx ANDROID_HOME /sdk
  set -gx PATH /sdk/tools /sdk/platform-tools $PATH
end

