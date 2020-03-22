class Powerlevel10k < Formula
  desc "A Zsh Theme"
  homepage "https://github.com/romkatv/powerlevel10k"
  url "https://github.com/romkatv/powerlevel10k/archive/v1.5.0.tar.gz"
  sha256 "e2297f5c2f804c0a5eedf804296dc0e1dbbe5e9532b8cd3af276588d71e9121d"

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
