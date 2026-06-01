class Alpaca < Formula
    desc "A local HTTP proxy for command-line tools. Supports PAC scripts and NTLM authentication."
    homepage "https://github.com/samuong/alpaca"
    if OS.mac? && Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.13/alpaca_v2.0.13_darwin-amd64"
        sha256 "09a3f444f2941d34bfbb1878a6eb6cd8e8d54203ec75fefdb285dd32eb40c3dc"
    end
    if OS.mac? && !Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.13/alpaca_v2.0.13_darwin-arm64"
        sha256 "7fd0adfcdcb3fca87be0db2e62f97e3887dcb08a28ef7f1d49cb9b2447e9ea38"
    end
    version "2.0.13"

    def install
        if OS.mac? && Hardware::CPU.intel?
            bin.install "alpaca_v2.0.13_darwin-amd64" => "alpaca"
        
        end
        if OS.mac? && !Hardware::CPU.intel?
            bin.install "alpaca_v2.0.13_darwin-arm64" => "alpaca"
        end
    end
    
    service do
        run opt_bin/"alpaca"
        error_log_path var/"log/alpaca.log"
    end
end
