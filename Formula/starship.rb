class Starship < Formula
  desc "The cross-shell prompt for astronauts"
  homepage "https://starship.rs"
  url "https://github.com/starship/starship/archive/v0.26.5.tar.gz"
  sha256 "a69837a8b6b99a4ac756e946d504056a456ea9cbc69a85f2f38f3e1189a62826"
  head "https://github.com/starship/starship.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "65e8b9c035b1115c6f98b98d8f29028ea408fb81beace97f50c31521a8a9f5e7" => :catalina
    sha256 "fa41f1cfce65db7ff76b7d44b9ce384d095336a60d86f0529b78468346b4262f" => :mojave
    sha256 "96d5fd0088778191fb2e9c55b928e994eb0f3575a7392b3773f89ed754726df9" => :high_sierra
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    ENV["STARSHIP_CONFIG"] = ""
    assert_equal "[1;32m❯[0m ", shell_output("#{bin}/starship module character")
  end
end
