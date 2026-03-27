class Patchdeck < Formula
  desc "Review-first console for multi-worktree Git workflows"
  homepage "https://github.com/thumbsu/patchdeck"
  url "https://github.com/thumbsu/patchdeck/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "6d0d1cebab06a143566b5dedaccc3ab8e1317f786304dd5a13cac86b8582deb2"
  version "0.1.5"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/patchdeck"
  end

  test do
    output = shell_output("#{bin}/patchdeck current 2>&1", 1)
    assert_match "no default repo configured", output
  end
end
