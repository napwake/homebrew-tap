# Written by the release workflow of https://github.com/napwake/napwake
# with its hack/brewformula, for each release: change that, not this.
class KubectlNapwake < Formula
  desc "Find idle Kubernetes workloads, and pause and wake them with Napwake"
  homepage "https://github.com/napwake/napwake"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/napwake/napwake/releases/download/v0.2.0/kubectl-napwake-darwin-arm64.tar.gz"
      sha256 "f9f23d2529f6b41998fe1ea0623f2b06183db269b754f7cfe3bfb668a7d88d84"
    end
    on_intel do
      url "https://github.com/napwake/napwake/releases/download/v0.2.0/kubectl-napwake-darwin-amd64.tar.gz"
      sha256 "bf708701b3aa82967c5ab9750fb044e6bc715e8452e5dcfa646436e82f54efd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/napwake/napwake/releases/download/v0.2.0/kubectl-napwake-linux-arm64.tar.gz"
      sha256 "f7d378276f91d2bc78ec75674c29bed2e8b995454f2ec65d52472ac436e6063e"
    end
    on_intel do
      url "https://github.com/napwake/napwake/releases/download/v0.2.0/kubectl-napwake-linux-amd64.tar.gz"
      sha256 "bd1ec6f1490435b0465f3be9d5413c64f0496db054bc02d62e8243b97826ab9b"
    end
  end

  def install
    bin.install Dir["kubectl-napwake-*"].first => "kubectl-napwake"
  end

  test do
    assert_match "kubectl-napwake v#{version}", shell_output("#{bin}/kubectl-napwake version")
  end
end
