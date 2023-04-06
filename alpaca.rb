class Alpaca < Formula
    desc "A local HTTP proxy for command-line tools. Supports PAC scripts and NTLM authentication."
    homepage "https://github.com/samuong/alpaca"
    if OS.mac? && Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.1/alpaca_v2.0.1_darwin-amd64"
        sha256 "7bea68a345967229ad62333e095075021bdfda07b5967b7e7f27257268b33670"
    end
    if OS.mac? && !Hardware::CPU.intel?
        url "https://github.com/samuong/alpaca/releases/download/v2.0.1/alpaca_v2.0.1_darwin-arm64"
        sha256 "a27fa971397bdf893230571ebe2b5d0871104739a7619b7dcbad756297cfd4dc"
    end
    version "2.0.1"

    def install
        if OS.mac? && Hardware::CPU.intel?
            bin.install "alpaca_v2.0.1_darwin-amd64" => "alpaca"
        
        end
        if OS.mac? && !Hardware::CPU.intel?
            bin.install "alpaca_v2.0.1_darwin-arm64" => "alpaca"
        end
    end
    
    service do
        run opt_bin/"alpaca"
        error_log_path var/"log/alpaca.log"
    end
end
