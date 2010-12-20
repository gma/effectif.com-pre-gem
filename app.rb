module Nesta
  class App
    get "/safari-extensions.plist" do
      content_type "text/xml", :charset => "utf-8"
      %Q{<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Extension Updates</key>
    <array>
      <dict>
        <key>CFBundleIdentifier</key>
        <string>com.effectif.safari.basecamp-link-shrinker</string>
        <key>Developer Identifier</key>
        <string>PCEBZ777VN</string>
        <key>CFBundleVersion</key>
        <string>1</string>
        <key>CFBundleShortVersionString</key>
        <string>1.0</string>
        <key>URL</key>
        <string>http://github.com/downloads/gma/basecamp-link-shrinker/basecamp-link-shrinker.safariextz</string>
      </dict>
    </array>
  </dict>
</plist>
}
    end
  end
end
