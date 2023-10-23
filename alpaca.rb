class Alpaca < Formula
    desc "A local HTTP proxy for command-line tools. Supports PAC scripts and NTLM authentication."
    homepage "https://github.com/samuong/alpaca"
    if OS.mac? && Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.3/alpaca_v2.0.3_darwin-amd64"
        sha256 "ebc0f07daa4f01fd4ee6d9b14eaefb7d9eee54933042f696cd72aae4997c401f"
    end
    if OS.mac? && !Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.3/alpaca_v2.0.3_darwin-arm64"
        sha256 "81430fd65e28baddaafc6d8fc1fc7ccd3afe84621d0084d0897007ec29e6679e"
    end
    version "2.0.3"

    def install
        if OS.mac? && Hardware::CPU.intel?
            bin.install "alpaca_v2.0.3_darwin-amd64" => "alpaca"
        
        end
        if OS.mac? && !Hardware::CPU.intel?
            bin.install "alpaca_v2.0.3_darwin-arm64" => "alpaca"
        end
    end
    
    service do
        run opt_bin/"alpaca"
        error_log_path var/"log/alpaca.log"
    end
end
