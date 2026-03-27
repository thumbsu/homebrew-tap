class Patchdeck < Formula
  desc "Review-first console for multi-worktree Git workflows"
  homepage "https://github.com/thumbsu/patchdeck"
  url "https://github.com/thumbsu/patchdeck/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c057fa933251b4e90043fba84b93357f0b69753a6785e0665dd414289c11c91c"
  version "0.1.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/patchdeck"
  end

  test do
    output = shell_output("#{bin}/patchdeck current 2>&1", 1)
    assert_match "no default repo configured", output
  end
end
