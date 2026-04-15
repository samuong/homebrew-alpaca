class Alpaca < Formula
    desc "A local HTTP proxy for command-line tools. Supports PAC scripts and NTLM authentication."
    homepage "https://github.com/samuong/alpaca"
    if OS.mac? && Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.12/alpaca_v2.0.12_darwin-amd64"
        sha256 "e4b8dd2aac5f860289b154a30e381215cc655d1031a17f6c22cf4dcdc7b6ce17"
    end
    if OS.mac? && !Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.12/alpaca_v2.0.12_darwin-arm64"
        sha256 "584ac2c941867d036b823b5b01012a3f748d0b161554f2254d0dbcc3764c49ab"
    end
    version "2.0.12"

    def install
        if OS.mac? && Hardware::CPU.intel?
            bin.install "alpaca_v2.0.12_darwin-amd64" => "alpaca"
        
        end
        if OS.mac? && !Hardware::CPU.intel?
            bin.install "alpaca_v2.0.12_darwin-arm64" => "alpaca"
        end
    end
    
    service do
        run opt_bin/"alpaca"
        error_log_path var/"log/alpaca.log"
    end
end
