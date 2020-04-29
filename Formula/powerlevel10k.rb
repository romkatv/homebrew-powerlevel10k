class Powerlevel10k < Formula
  desc "A Zsh Theme"
  homepage "https://github.com/romkatv/powerlevel10k"
  url "https://github.com/romkatv/powerlevel10k/archive/v1.7.0.tar.gz"
  sha256 "e4148d2ac921defb2039f0dfc127d56043f592fb3736787a057a18a15196a60e"

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
