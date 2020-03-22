class Powerlevel10k < Formula
  desc "A Zsh Theme"
  homepage "https://github.com/romkatv/powerlevel10k"
  url "https://github.com/romkatv/powerlevel10k/archive/v1.5.0.tar.gz"
  sha256 "233d817229731d80076d0c8312fb0130bf2d3e4300de1b8265866e43abc87c3c"

  bottle :unneeded

  def install
    prefix.install Dir["*"]
  end

  def caveats
    <<~EOS
      To activate powerlevel10k, add the following line to .zshrc:

        source #{opt_prefix}/powerlevel10k.zsh-theme
    EOS
  end

  test do
    assert_match "OK",
      shell_output("zsh -dfic '. #{opt_prefix}/powerlevel10k.zsh-theme && (( ${+P9K_SSH} )) && echo OK'")
  end
end
