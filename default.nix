
let

  pkgs = import ./nixpkgs.nix {};
  compiler = import ./compiler.nix { inherit pkgs; };
  vscode = import ./vscode.nix { inherit pkgs; };

  tools-used-by-hie = with pkgs.haskellPackages; [
    Cabal_2_4_1_0
    cabal-install
    apply-refact
    hasktags
    hlint
    hoogle
    brittany
  ];

  drv = { };
  
in pkgs.stdenv.mkDerivation {
  pname = "haskell-dev-container";
  version = "0.1.0.0";
  src = "./*.nix";
  description = "A docker container for building Haskell applications.";
  license = "GPL";
  buildDepends = (drv.buildDepends or []) ++ [
    (compiler.hoogleLocal {
      packages = (drv.libraryHaskellDepends or []) ++
        (drv.executableHaskellDepends or []) ++
        (drv.testHaskellDepends or []) ;
    })
  ];
  buildTools = (drv.buildTools or []) ++ tools-used-by-hie;
  buildInputs = [
    vscode
  ];
}

