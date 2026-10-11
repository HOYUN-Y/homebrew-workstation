cask "workstation-agent" do
  version "0.10.5"
  sha256 "1e7616a10bb887223d02384d59226e6fe3f29a3d9919ac4ae4422d22e0ad62b1"

  url "https://github.com/HOYUN-Y/homebrew-workstation/releases/download/v#{version}/Workstation-Agent-#{version}-arm64.zip"
  name "Workstation Agent"
  desc "Menu bar companion for Workstation local skill execution"
  homepage "https://github.com/HOYUN-Y/homebrew-workstation"

  depends_on formula: "uv"
  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "Workstation Agent.app"

  uninstall launchctl: "xyz.devprofessional.workstation-agent",
            quit: "xyz.devprofessional.workstation-agent.app"

  caveats <<~EOS
    This app is ad-hoc signed and not notarized by Apple.
    On first launch, macOS may require manual approval in Privacy & Security.
    Open the app to prepare Python, connect your account, and register project folders.
    Install and sign in to Claude Code or Codex CLI separately for the engine you use.
    Codex requires version 0.162.0 or newer and app-server permissions support.
    Before upgrading or uninstalling, pause new requests and finish/cancel active runs.
    Device identity, folders, logs, and Keychain login are preserved on uninstall.
  EOS
end
