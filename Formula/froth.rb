class Froth < Formula
  desc "Live lexical language for programmable devices"
  homepage "https://frothlang.org"
  url "https://github.com/nikokozak/froth/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "e4d671031c7356403b435e39cf7701557c52e7fed337eb9a90541a8aebab164d"
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
