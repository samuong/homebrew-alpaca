class Alpaca < Formula
    desc "A local HTTP proxy for command-line tools. Supports PAC scripts and NTLM authentication."
    homepage "https://github.com/samuong/alpaca"
    if OS.mac? && Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.5/alpaca_v2.0.5_darwin-amd64"
        sha256 "dd90a893434b28cfff2640ff02d85ca211cea9f657c1969281a64ef1675f8a69"
    end
    if OS.mac? && !Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.5/alpaca_v2.0.5_darwin-arm64"
        sha256 "bb85f2b5d84e8d3db133d7226ec044dc3bac9ade815fa469b226299eeb297d70"
    end
    version "2.0.5"

    def install
        if OS.mac? && Hardware::CPU.intel?
            bin.install "alpaca_v2.0.5_darwin-amd64" => "alpaca"
        
        end
        if OS.mac? && !Hardware::CPU.intel?
            bin.install "alpaca_v2.0.5_darwin-arm64" => "alpaca"
        end
    end
    
    service do
        run opt_bin/"alpaca"
        error_log_path var/"log/alpaca.log"
    end
end
