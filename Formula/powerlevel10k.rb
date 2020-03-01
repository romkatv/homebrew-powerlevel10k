class ZshAutosuggestions < Formula
  desc "A Zsh Theme"
  homepage "https://github.com/romkatv/powerlevel10k"
  url "https://github.com/romkatv/powerlevel10k/archive/v1.2.0.tar.gz"
  sha256 "0dd3af523643e3238a1f92e5c2b540ce06d350dd15544e0926144b6cf23ea58e"

  bottle :unneeded

  def install
    pkgshare.install "powerlevel10k.zsh-theme"
  end

  def caveats
    <<~EOS
      To activate powerlevel10k, add the following at the end of your .zshrc:

        source #{HOMEBREW_PREFIX}/share/powerlevel10k/powerlevel10k.zsh-theme
    EOS
  end

  test do
    assert_match "OK",
      shell_output("zsh -ic '. #{pkgshare}/powerlevel10k.zsh-theme && (( ${+P9K_SSH} )) && echo OK'")
  end
end
