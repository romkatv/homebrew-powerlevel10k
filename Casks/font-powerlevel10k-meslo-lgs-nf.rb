cask "font-powerlevel10k-meslo-lgs-nf" do
  version "2020.4.15"
  sha256 "b237985878c5588443010f5e8cd3e9a5849c2f8ca6806d68f406bec2bab8bbaa"

  url "https://github.com/thecesrom/powerlevel10k-media/releases/download/v#{version}/MesloLGS-NF.zip"
  name "Meslo Nerd Font patched for Powerlevel10k"
  desc "Released under Apache License, Version 2.0"
  homepage "https://github.com/thecesrom/powerlevel10k-media"

  livecheck do
    url :url
    strategy :github_latest
  end

  font "MesloLGS NF Bold Italic.ttf"
  font "MesloLGS NF Bold.ttf"
  font "MesloLGS NF Italic.ttf"
  font "MesloLGS NF Regular.ttf"
end
