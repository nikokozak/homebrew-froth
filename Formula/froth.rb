class Froth < Formula
  desc "Live lexical language for programmable devices"
  homepage "https://frothlang.org"
  url "https://github.com/nikokozak/froth/archive/7533c8167ad591f01a7e1bcddda827536efdb9f7.tar.gz"
  version "0.1.0"
  sha256 "2a915503548a6423e6ee813e6f993f9a219bacc6e7535a3544508cf46eb57b8e"
  license "MIT"

  head "https://github.com/nikokozak/froth.git", branch: "main"

  depends_on "go" => :build

  def install
    cd "tools/cli" do
      system "go", "run", "./internal/sdk/cmd/generate",
             "-repo", buildpath.to_s,
             "-out", "internal/sdk/generated"
      system "go", "build", "-o", bin/"froth", "."
    end
  end

  test do
    output = shell_output("#{bin}/froth --version")
    assert_match "froth ", output
  end
end
