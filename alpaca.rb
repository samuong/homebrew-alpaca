class Alpaca < Formula
    desc "A local HTTP proxy for command-line tools. Supports PAC scripts and NTLM authentication."
    homepage "https://github.com/samuong/alpaca"
    if OS.mac? && Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v1.3.2/alpaca_v1.3.2_darwin-amd64"
        sha256 "7e7941c0642d582305b768c587bddb29236f1a0d6cb27125a05725da7d0c3e74"
    end
    if OS.mac? && !Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v1.3.2/alpaca_v1.3.2_darwin-arm64"
        sha256 "99865686fbb2b17d24ecb9f19dc846282c4d6049c3bae771118819b2e04699df"
    end
    version "1.3.2"

    def install
        if OS.mac? && Hardware::CPU.intel?
            bin.install "alpaca_v1.3.2_darwin-amd64" => "alpaca"
        
        end
        if OS.mac? && !Hardware::CPU.intel?
            bin.install "alpaca_v1.3.2_darwin-arm64" => "alpaca"
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
