cask "workstation-agent" do
  version "0.2.0"
  sha256 "7c7e9254bbc9633840b033afbb930d7a402d5ec664fa71f86d632c23038dc88b"

  url "https://github.com/HOYUN-Y/homebrew-workstation/releases/download/v#{version}/Workstation-Agent-#{version}-arm64.zip"
  name "Workstation Agent"
  desc "Menu bar companion for Workstation local skill execution"
  homepage "https://github.com/HOYUN-Y/homebrew-workstation"

  depends_on formula: "uv"
  depends_on macos: ">= :sequoia"
  depends_on arch: :arm64

  app "Workstation Agent.app"

  uninstall launchctl: "xyz.devprofessional.workstation-agent",
            quit: "xyz.devprofessional.workstation-agent.app"

  caveats <<~EOS
    This app is ad-hoc signed and not notarized by Apple.
    On first launch, macOS may require manual approval in Privacy & Security.
    Open the app to prepare Python, connect your account, and register project folders.
    Claude Code must be installed and signed in separately.
    Before upgrading or uninstalling, pause new requests and finish/cancel active runs.
    Device identity, folders, logs, and Keychain login are preserved on uninstall.
  EOS
end
