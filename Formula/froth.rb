class Froth < Formula
  desc "A stack-based language for microcontrollers"
  homepage "https://github.com/nikokozak/froth"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nikokozak/froth/releases/download/v#{version}/froth-v0.1.0-darwin-arm64.tar.gz"
      sha256 "5fe48026ba0988fe75072a2e8488d267807ea0d7b0c03b46b08e2b0685b1b5f8"
    end
    on_intel do
      url "https://github.com/nikokozak/froth/releases/download/v#{version}/froth-v0.1.0-darwin-amd64.tar.gz"
      sha256 "53dcb589bd88f1dc4124dbc2ed8324b158e3fe0a554f7a25929d29d3c8c4e445"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nikokozak/froth/releases/download/v#{version}/froth-v0.1.0-linux-amd64.tar.gz"
      sha256 "a0121e7b1f87c56423778f71ba163bbbfc473f5eaf14a992978efe2f966c643f"
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
