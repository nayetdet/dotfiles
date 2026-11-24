{ pkgs, src }: {
  format = pkgs.runCommand "format-check" { nativeBuildInputs = [ pkgs.nixfmt-tree ]; } ''
    cd ${src}
    treefmt --ci
    mkdir -p $out
  '';

  statix = pkgs.runCommand "statix-check" { nativeBuildInputs = [ pkgs.statix ]; } ''
    cd ${src}
    statix check
    mkdir -p $out
  '';

  deadnix = pkgs.runCommand "deadnix-check" { nativeBuildInputs = [ pkgs.deadnix ]; } ''
    deadnix --no-lambda-pattern-names --fail ${src}
    mkdir -p $out
  '';
}
