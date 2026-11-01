# Written by the release workflow of https://github.com/napwake/napwake
# with its hack/brewformula, for each release: change that, not this.
class KubectlNapwake < Formula
  desc "Find idle Kubernetes workloads, and pause and wake them with Napwake"
  homepage "https://github.com/napwake/napwake"
  version "0.2.0-rc.13"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/napwake/napwake/releases/download/v0.2.0-rc.13/kubectl-napwake-darwin-arm64.tar.gz"
      sha256 "7f428afec8247bb643caee77e4039ee1e28a9b313d8246e1bd2c140a988db66e"
    end
    on_intel do
      url "https://github.com/napwake/napwake/releases/download/v0.2.0-rc.13/kubectl-napwake-darwin-amd64.tar.gz"
      sha256 "2d92675b3916adae16f01675f1aa136a539396fc656a4849c95ccbf16c2687db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/napwake/napwake/releases/download/v0.2.0-rc.13/kubectl-napwake-linux-arm64.tar.gz"
      sha256 "3797bdfe5ccf372ff0fab4a5441dc59f453770eea1a22d1e2bb3d152361fe496"
    end
    on_intel do
      url "https://github.com/napwake/napwake/releases/download/v0.2.0-rc.13/kubectl-napwake-linux-amd64.tar.gz"
      sha256 "239b0fa7af9dead42f32c765e14e48d1a7abb5afbe0663aa033821c335fb4543"
    end
  end

  def install
    bin.install Dir["kubectl-napwake-*"].first => "kubectl-napwake"
  end

  test do
    assert_match "kubectl-napwake v#{version}", shell_output("#{bin}/kubectl-napwake version")
  end
end
