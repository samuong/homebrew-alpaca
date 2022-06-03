class Alpaca < Formula
    desc "A local HTTP proxy for command-line tools. Supports PAC scripts and NTLM authentication."
    homepage "https://github.com/samuong/alpaca"
    if OS.mac? && Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v1.3.0/alpaca_v1.3.0_darwin-amd64"
        sha256 "437d34dce41bead8534451d2181b307a0f4620181de0d9ccba819b59fd6aac16"
    end
    if OS.mac? && !Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v1.3.0/alpaca_v1.3.0_darwin-arm64"
        sha256 "b326a86523ec081fce8a84ff1e80b9bb8769e2b26665a4bcebfbdabcfc68e513"
    end
    version "1.3.0"

    def install
        if OS.mac? && Hardware::CPU.intel?
            bin.install "alpaca_v1.3.0_darwin-amd64" => "alpaca"
        
        end
        if OS.mac? && !Hardware::CPU.intel?
            bin.install "alpaca_v1.3.0_darwin-arm64" => "alpaca"
        end
    end

    plist_options :startup => true

    def plist
        <<~EOS
            <?xml version="1.0" encoding="UTF-8"?>
            <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
            <plist version="1.0">
                <dict>
                    <key>Label</key>
                    <string>#{plist_name}</string>
                    <key>ProgramArguments</key>
                    <array>
                        <string>#{opt_bin}/alpaca</string>
                    </array>
                    <key>KeepAlive</key>
                    <false/>
                    <key>RunAtLoad</key>
                    <true/>
                    <key>StandardErrorPath</key>
                    <string>/dev/null</string>
                    <key>StandardOutPath</key>
                    <string>/dev/null</string>
                </dict>
            </plist>
        EOS
    end
end
