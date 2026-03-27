class Patchdeck < Formula
  desc "Review-first console for multi-worktree Git workflows"
  homepage "https://github.com/thumbsu/patchdeck"
  url "https://github.com/thumbsu/patchdeck/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "d4a2a593397972fea5551b41d18e452705d49da20fc3c8da5447e87856fa3f7e"
  version "0.1.3"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/patchdeck"
  end

  test do
    output = shell_output("#{bin}/patchdeck current 2>&1", 1)
    assert_match "no default repo configured", output
  end
end
