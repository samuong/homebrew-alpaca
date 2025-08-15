class Alpaca < Formula
    desc "A local HTTP proxy for command-line tools. Supports PAC scripts and NTLM authentication."
    homepage "https://github.com/samuong/alpaca"
    if OS.mac? && Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.11/alpaca_v2.0.11_darwin-amd64"
        sha256 "9a874476c66ad13f172d92ddd5bdda0addce0f8f446d4667b5fff7fd06d1c1ba"
    end
    if OS.mac? && !Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.11/alpaca_v2.0.11_darwin-arm64"
        sha256 "bb9f927bee487ad0b75443b6b81da2599ede6e549e0f8e2d85528ae2659bee37"
    end
    version "2.0.11"

    def install
        if OS.mac? && Hardware::CPU.intel?
            bin.install "alpaca_v2.0.11_darwin-amd64" => "alpaca"
        
        end
        if OS.mac? && !Hardware::CPU.intel?
            bin.install "alpaca_v2.0.11_darwin-arm64" => "alpaca"
        end
    end
    
    service do
        run opt_bin/"alpaca"
        error_log_path var/"log/alpaca.log"
    end
end
