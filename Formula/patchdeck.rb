class Patchdeck < Formula
  desc "Review-first console for multi-worktree Git workflows"
  homepage "https://github.com/thumbsu/patchdeck"
  url "https://github.com/thumbsu/patchdeck/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "12ec8c9b78b200a99f45923c67b3a1c65054acee8dbf8f094b5e2b25eeb21fd4"
  version "0.1.2"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/patchdeck"
  end

  test do
    output = shell_output("#{bin}/patchdeck current 2>&1", 1)
    assert_match "no default repo configured", output
  end
end
