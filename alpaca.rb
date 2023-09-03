class Alpaca < Formula
    desc "A local HTTP proxy for command-line tools. Supports PAC scripts and NTLM authentication."
    homepage "https://github.com/samuong/alpaca"
    if OS.mac? && Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.2/alpaca_v2.0.2_darwin-amd64"
        sha256 "06c9ce88d17e806e0779ba7ac3a04cda0f7e0325c8e8786b155318df0baf9e25"
    end
    if OS.mac? && !Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.2/alpaca_v2.0.2_darwin-arm64"
        sha256 "89cd7ae7fad51332e951fc003e98fefd2c6fcc66b3a42fc0d6aa23877c23a80b"
    end
    version "2.0.2"

    def install
        if OS.mac? && Hardware::CPU.intel?
            bin.install "alpaca_v2.0.2_darwin-amd64" => "alpaca"
        
        end
        if OS.mac? && !Hardware::CPU.intel?
            bin.install "alpaca_v2.0.2_darwin-arm64" => "alpaca"
        end
    end
    
    service do
        run opt_bin/"alpaca"
        error_log_path var/"log/alpaca.log"
    end
end
