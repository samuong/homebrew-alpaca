class Alpaca < Formula
    desc "A local HTTP proxy for command-line tools. Supports PAC scripts and NTLM authentication."
    homepage "https://github.com/samuong/alpaca"
    url "https://github.com/samuong/alpaca/releases/download/v1.1.0/darwin-amd64"
    sha256 "e8ab7248e00ab3fcdff6a94444ea7fe408287dfd077f303a4fc4805eed85605a"
    version "1.1.0"

    def install
        bin.install "darwin-amd64" => "alpaca"
    end
end
