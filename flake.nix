{
  description = "ZK ACTUS proving design";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      packages.x86_64-linux.default = pkgs.stdenvNoCC.mkDerivation {
        name = "actus-proving-design";
        src = ./src;
        nativeBuildInputs = [ (pkgs.texlive.combine { inherit (pkgs.texlive) scheme-basic enumitem latexmk pgf stmaryrd; }) ];
        buildPhase = "latexmk -pdf";
        installPhase = ''
          mkdir $out
          install actus-proving-design.pdf $out/actus-proving-design.pdf
        '';
      };
    };
}

