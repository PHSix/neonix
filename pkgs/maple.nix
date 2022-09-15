{ lib, fetchzip }:
let
  version = "5.5";
  name = "Maple-font";
  url =
    "https://github.com/subframe7536/${name}/releases/download/v${version}/MapleMono-NF.zip";
  postFetch = ''
    mkdir -p $out/share/fonts/opentype
    unzip -j $downloadedFile \*.otf -d $out/share/fonts/opentype
  '';
  sha256 = "961779c0a1ba165416643e5bd8489162b1fa6a613ab1037e1a668512a370957c";
in {

}
