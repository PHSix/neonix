{ lib, fetchzip }:
let
  url = "https://codeload.github.com/PHSix/monego/zip/refs/heads/master";
  sha256 = "";
in fetchzip {
  name = "monego";

  postFetch = ''
    unzip -j $downloadedFile

    for i in *.ttf; do
      local destname="$(echo "$i" | sed -E 's|-[[:digit:].]+\.ttf$|.ttf|')"
      install -Dm 644 "$i" "$out/share/fonts/truetype/$destname"
    done

    install -Dm 644 COPYING "$out/share/doc/terminus-font-ttf/COPYING"
  '';

  inherit url;
  inherit sha256;

  meta = with lib; {
    description = "A font fork from Monaco.";
    longDescription = ''
      The beloved Monaco monospaced font, recreated with a bold and italic variant. 
    '';
    homepage = "https://files.ax86.net/terminus-ttf";
    license = licenses.ofl;
    maintainers = with maintainers; [ okasu ];
  };
}
