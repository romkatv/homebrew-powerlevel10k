class Powerlevel10k < Formula
  desc "A Zsh Theme"
  homepage "https://github.com/romkatv/powerlevel10k"
  url "https://github.com/romkatv/powerlevel10k/archive/v1.6.0.tar.gz"
  sha256 "43b15d5e8a347d0e210a86ba2398671215b7280038fc8b3c591dc06bd0469e81"

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
