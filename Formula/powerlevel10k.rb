class Powerlevel10k < Formula
  desc "A Zsh Theme"
  homepage "https://github.com/romkatv/powerlevel10k"
  url "https://github.com/romkatv/powerlevel10k/archive/v1.11.0.tar.gz"
  sha256 "a1cf2c2d6afbc9c1f5ea69f722cf15bae6011d320b1166809f036d876016e723"

  depends_on "zsh"

  def install
    system 'zsh', '-fc', 'unset -m "GITSTATUS_*"; GITSTATUS_CACHE_DIR="$PWD"/gitstatus/usrbin ./gitstatus/install -f'
    system 'zsh', '-fc', 'emulate zsh -o no_aliases; for f in *.zsh-theme internal/*.zsh gitstatus/*.zsh gitstatus/install; do zcompile -R -- $f.zwc $f || exit; done'
    prefix.install Dir["*"]
  end

  def caveats
    <<~EOS
      To activate powerlevel10k, add the following line to .zshrc:

        source #{opt_prefix}/powerlevel10k.zsh-theme
    EOS
  end

  test do
    assert_match "SUCCESS",
      shell_output("zsh -fic '. #{opt_prefix}/powerlevel10k.zsh-theme && (( ${+P9K_SSH} )) && echo SUCCESS'")
  end
end
