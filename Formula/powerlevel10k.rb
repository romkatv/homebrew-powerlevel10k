class Powerlevel10k < Formula
  desc "A Zsh Theme"
  homepage "https://github.com/romkatv/powerlevel10k"
  url "https://github.com/romkatv/powerlevel10k/archive/v1.14.4.tar.gz"
  sha256 "63d34ebc127a808a7c53ab1c6a269782f4586baa90dfcc5f080b3e3f6bc31769"

  depends_on "zsh"

  def install
    system 'make', 'pkg'
    prefix.install Dir["*"]
  end

  def caveats
    <<~EOS
      To activate powerlevel10k, add the following line to .zshrc:

        source #{opt_prefix}/powerlevel10k.zsh-theme

      If your .zshrc sets ZSH_THEME, remove that line.
    EOS
  end

  test do
    assert_match "SUCCESS",
      shell_output("zsh -fic '. #{opt_prefix}/powerlevel10k.zsh-theme && (( ${+P9K_SSH} )) && echo SUCCESS'")
  end
end
