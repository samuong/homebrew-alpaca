class Alpaca < Formula
    desc "A local HTTP proxy for command-line tools. Supports PAC scripts and NTLM authentication."
    homepage "https://github.com/samuong/alpaca"
    if OS.mac? && Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v1.2.1/alpaca_v1.2.1_darwin-amd64"
        sha256 "6c0b0afc5edab9665a5f2a23e9718deef0cb50e9a1263e42f3c9af90b011ca97"
    end
    if OS.mac? && !Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v1.2.1/alpaca_v1.2.1_darwin-arm64"
        sha256 "eee463d3be1b451fdfba784d69f2e02677e9ace83c122af2a12f9fd0024e675b"
    end
    version "1.2.1"

    def install
        if OS.mac? && Hardware::CPU.intel?
            bin.install "alpaca_v1.2.1_darwin-amd64" => "alpaca"
        
        end
        if OS.mac? && !Hardware::CPU.intel?
            bin.install "alpaca_v1.2.1_darwin-arm64" => "alpaca"
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
