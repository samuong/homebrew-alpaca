class Alpaca < Formula
    desc "A local HTTP proxy for command-line tools. Supports PAC scripts and NTLM authentication."
    homepage "https://github.com/samuong/alpaca"
    if OS.mac? && Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.7/alpaca_v2.0.7_darwin-amd64"
        sha256 "e0eb9b07e151cb071d163ea23f8744f006cfb1b06c73c0c488ea6d8894068986"
    end
    if OS.mac? && !Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.7/alpaca_v2.0.7_darwin-arm64"
        sha256 "d4359749be6e46317381da80c8a5b41715ce75957a2a2752561267f2cf624abe"
    end
    version "2.0.7"

    def install
        if OS.mac? && Hardware::CPU.intel?
            bin.install "alpaca_v2.0.7_darwin-amd64" => "alpaca"
        
        end
        if OS.mac? && !Hardware::CPU.intel?
            bin.install "alpaca_v2.0.7_darwin-arm64" => "alpaca"
        end
    end
    
    service do
        run opt_bin/"alpaca"
        error_log_path var/"log/alpaca.log"
    end
end
