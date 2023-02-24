class Alpaca < Formula
    desc "A local HTTP proxy for command-line tools. Supports PAC scripts and NTLM authentication."
    homepage "https://github.com/samuong/alpaca"
    if OS.mac? && Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.0/alpaca_v2.0.0_darwin-amd64"
        sha256 "a63b23a3ea3df130d4cab9e122d033d7f4a1b532b0cb7c80aa94d68227c63eba"
    end
    if OS.mac? && !Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.0/alpaca_v2.0.0_darwin-arm64"
        sha256 "ae98d17d0e4a2ba5660d64f79a02795810f1f5dae870ce16be4f7815cdf6bbe1"
    end
    version "2.0.0"

    def install
        if OS.mac? && Hardware::CPU.intel?
            bin.install "alpaca_v2.0.0_darwin-amd64" => "alpaca"
        
        end
        if OS.mac? && !Hardware::CPU.intel?
            bin.install "alpaca_v2.0.0_darwin-arm64" => "alpaca"
        end
    end
    
    service do
        run opt_bin/alpaca
        log_path var/"log/alpaca.log"
        error_log_path var/"log/alpaca-error.log"
    end
end
