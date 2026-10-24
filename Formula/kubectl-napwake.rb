# Written by the release workflow of https://github.com/napwake/napwake
# with its hack/brewformula, for each release: change that, not this.
class KubectlNapwake < Formula
  desc "Find idle Kubernetes workloads, and pause and wake them with Napwake"
  homepage "https://github.com/napwake/napwake"
  version "0.2.0-rc.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/napwake/napwake/releases/download/v0.2.0-rc.9/kubectl-napwake-darwin-arm64.tar.gz"
      sha256 "7abe08594d997dceaa02d57f7f2b1ec9d5c2ee2d59bad84325606352c9d4c2bf"
    end
    on_intel do
      url "https://github.com/napwake/napwake/releases/download/v0.2.0-rc.9/kubectl-napwake-darwin-amd64.tar.gz"
      sha256 "6fa0883b773cfbbb7cb5fc19e904805159f8144e6c21e0a2049e06d857c85a48"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/napwake/napwake/releases/download/v0.2.0-rc.9/kubectl-napwake-linux-arm64.tar.gz"
      sha256 "5c2af76a5e7e723e84c90886e811d6003c701142d41ff828069afac2c7cc0c60"
    end
    on_intel do
      url "https://github.com/napwake/napwake/releases/download/v0.2.0-rc.9/kubectl-napwake-linux-amd64.tar.gz"
      sha256 "4ca5c80d1a818d1cbf0841e06365d83b844b22cc974629476cd8ce8157afd744"
    end
  end

  def install
    bin.install Dir["kubectl-napwake-*"].first => "kubectl-napwake"
  end

  test do
    assert_match "kubectl-napwake v#{version}", shell_output("#{bin}/kubectl-napwake version")
  end
end
