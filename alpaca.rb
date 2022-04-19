class Alpaca < Formula
    desc "A local HTTP proxy for command-line tools. Supports PAC scripts and NTLM authentication."
    homepage "https://github.com/samuong/alpaca"
    if OS.mac? && Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v1.2.0/alpaca_v1.2.0_darwin-amd64"
        sha256 "d21e2119e907a212e7b3ea28a6b9e7fd2723dc44be94b2d6c4b5c13398078172"
    end
    if OS.mac? && !Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v1.2.0/alpaca_v1.2.0_darwin-arm64"
        sha256 "0231da653167609b77ee3ee8d2542bf700a85cdb3270aa72e8c2fc91e761bc84"
    end
    version "1.2.0"

    def install
        if OS.mac? && Hardware::CPU.intel?
            bin.install "alpaca_v1.2.0_darwin-amd64" => "alpaca"
        
        end
        if OS.mac? && !Hardware::CPU.intel?
            bin.install "alpaca_v1.2.0_darwin-arm64" => "alpaca"
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
