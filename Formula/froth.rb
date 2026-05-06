class Froth < Formula
  desc "Live lexical language for programmable devices"
  homepage "https://frothlang.org"
  url "https://github.com/nikokozak/froth/archive/fb618da89a5f7f65f3d5b45b671f9629b86dbd80.tar.gz"
  version "0.1.0"
  sha256 "53955689edff65f401b5efff9be20b3d43589ec9f0949a72b5abf385f9adef84"
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
