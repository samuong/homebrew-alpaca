class Alpaca < Formula
    desc "A local HTTP proxy for command-line tools. Supports PAC scripts and NTLM authentication."
    homepage "https://github.com/samuong/alpaca"
    if OS.mac? && Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.4/alpaca_v2.0.4_darwin-amd64"
        sha256 "541ce7b19e3bb2131190985e3305d4af3ce6460c06f425a62a9710049e4d4ae0"
    end
    if OS.mac? && !Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.4/alpaca_v2.0.4_darwin-arm64"
        sha256 "b3350c38ca0fa5668400b70ac432840f6aaee1776afbaa76421ac0e0f53be44c"
    end
    version "2.0.4"

    def install
        if OS.mac? && Hardware::CPU.intel?
            bin.install "alpaca_v2.0.4_darwin-amd64" => "alpaca"
        
        end
        if OS.mac? && !Hardware::CPU.intel?
            bin.install "alpaca_v2.0.4_darwin-arm64" => "alpaca"
        end
    end
    
    service do
        run opt_bin/"alpaca"
        error_log_path var/"log/alpaca.log"
    end
end
