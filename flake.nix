{
  description = "A development environment for CPP Project with latest and greatest cmake, gcc and clang";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    forAllSystems = f: nixpkgs.lib.genAttrs allSystems ( system: f{
        pkgs = import nixpkgs { inherit system; };
      });
  in
  {
    devShells = forAllSystems ({ pkgs }: {
      default = pkgs.mkShell {
        buildInputs = [
          pkgs.gcc
          pkgs.cmake
          pkgs.llvmPackages.clang
          # Debug
          pkgs.gdb
        ];

        shellHook = ''
        echo "--- C++ Development Environment ---"
        echo "GCC version: $(gcc --version | head -n 1)"
        echo "Clang version: $(clang --version | head -n 1)"
        echo "CMake version: $(cmake --version | head -n 1)"
        echo "GDB version: $(gdb --version | head -n 1)"
        '';
      };
    });
  };
}
