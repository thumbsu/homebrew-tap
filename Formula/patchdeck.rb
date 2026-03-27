class Patchdeck < Formula
  desc "Review-first console for multi-worktree Git workflows"
  homepage "https://github.com/thumbsu/patchdeck"
  url "https://github.com/thumbsu/patchdeck/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "c83bfb78e76bb78191b8bd388bad26186375b8f7e6e9992a70e1167435cd4b8f"
  version "0.1.1"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/patchdeck"
  end

  test do
    output = shell_output("#{bin}/patchdeck current 2>&1", 1)
    assert_match "no default repo configured", output
  end
end
