cask "justhide" do
  version "1.5.1"
  sha256 "5299f5973b9323f16a2af3422d282b3dc1aa35e3d109f5792a79ba0ff95e924a"

  url "https://github.com/benjustjammin/justhide/releases/download/v#{version}/JustHide-#{version}.zip"
  name "JustHide"
  desc "Hides menu bar icons until you want them"
  homepage "https://github.com/benjustjammin/justhide"

  livecheck do
    url :url
    strategy :github_latest
  end

  # 27 or newer (a bare symbol means ">=" here; the ">= :golden_gate" string
  # form is deprecated). Nothing older, on purpose: the concealment facility it
  # uses does not exist before 27, and the layout-based fallback is a developer
  # option rather than something to ship to people.
  depends_on macos: :golden_gate

  # Moved into /Applications, which is not merely convention here -- macOS only
  # honours the concealment allowlist for an app running from an Applications
  # folder, so JustHide installed anywhere else appears to work and hides
  # nothing.
  app "JustHide.app"

  # Quit before replacing the bundle: a running copy is holding a concealment
  # assertion, and swapping the app from under it leaves the menu bar in
  # whatever state that copy last applied.
  uninstall quit: "dev.justhide.app"

  zap trash: [
    "~/Library/Preferences/dev.justhide.app.plist",
    "~/Library/Preferences/dev.nook.bar.plist",
  ]
end
