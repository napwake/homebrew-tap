# Written by the release workflow of https://github.com/napwake/napwake
# with its hack/brewformula, for each release: change that, not this.
class KubectlNapwake < Formula
  desc "Find idle Kubernetes workloads, and pause and wake them with Napwake"
  homepage "https://github.com/napwake/napwake"
  version "0.2.0-rc.11"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/napwake/napwake/releases/download/v0.2.0-rc.11/kubectl-napwake-darwin-arm64.tar.gz"
      sha256 "e581eceab1d199f2ef218dd36b081df92bd53eb9e195ecfbbb7531823abef03e"
    end
    on_intel do
      url "https://github.com/napwake/napwake/releases/download/v0.2.0-rc.11/kubectl-napwake-darwin-amd64.tar.gz"
      sha256 "f965bd0e82d4d2b8122b89243a0eae90b893a685a47ea8f7bf005107dfaf9b2b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/napwake/napwake/releases/download/v0.2.0-rc.11/kubectl-napwake-linux-arm64.tar.gz"
      sha256 "7090afa179e1a42be3fb80267bdad5777bf13403b802155728c8d7a9082aaeba"
    end
    on_intel do
      url "https://github.com/napwake/napwake/releases/download/v0.2.0-rc.11/kubectl-napwake-linux-amd64.tar.gz"
      sha256 "f9c1a6f0fbe732bdaec33019ad626d9ff96951365c1e69653e24d0bdc5f2e8f0"
    end
  end

  def install
    bin.install Dir["kubectl-napwake-*"].first => "kubectl-napwake"
  end

  test do
    assert_match "kubectl-napwake v#{version}", shell_output("#{bin}/kubectl-napwake version")
  end
end
