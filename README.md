## Dev Setup
export ANDROID_HOME=/Users/rknuszka/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$HOME/development/flutter/bin:$PATH

flutter clean
flutter pub get
flutter build apk --debug

flutter build macos --release