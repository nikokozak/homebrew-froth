class Froth < Formula
  desc "A stack-based language for microcontrollers"
  homepage "https://github.com/nikokozak/froth"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nikokozak/froth/releases/download/v#{version}/froth-v0.1.0-darwin-arm64.tar.gz"
      sha256 "c63d381accc28d26877d2375d33d3a57a07c1c28b8c55bcebbdb3e02c8435ef4"
    end
    on_intel do
      url "https://github.com/nikokozak/froth/releases/download/v#{version}/froth-v0.1.0-darwin-amd64.tar.gz"
      sha256 "0bd0d409f7ed1e93b9b7029d26f2973e7e9e37cf27d0860084fd6a66e5ad004a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nikokozak/froth/releases/download/v#{version}/froth-v0.1.0-linux-amd64.tar.gz"
      sha256 "193625f5b09f304eb6c35efe955043c641342d91ac66bdfe1d40435a5bd4741b"
    end
  end

  depends_on "cmake" => :recommended
  depends_on "make" => :recommended

  def install
    bin.install "froth"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/froth --version")
  end
end
