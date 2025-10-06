{pkgs, config, ...}:
let
  amdgpu-kernel-module = pkgs.callPackage ./amdgpu-kernel-module.nix {
    # Make sure the module targets the same kernel as your system is using.
    kernel = config.boot.kernelPackages.kernel;
  };
  # linuxPackages_latest 6.13 (or linuxPackages_zen 6.13)
  amdgpu-stability-patch = pkgs.fetchpatch {
    name = "amdgpu-stability-patch";
    url = "https://github.com/SeryogaBrigada/linux/commit/d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3.diff";
    hash = "sha256-h/8Dr0oldOhXACed1JxyUU3oKcXaUSVDVF9cCtggRRw=";
  };
  /*
  # linuxPackages_zen 6.12
  amdgpu-stability-patch = pkgs.fetchpatch {
    name = "amdgpu-stability-patch-zen";
    url = "https://github.com/zen-kernel/zen-kernel/compare/fd00d197bb0a82b25e28d26d4937f917969012aa...WhiteHusky:zen-kernel:f4c32ca166ad55d7e2bbf9adf121113500f3b42b.diff";
    hash = "sha256-bMT5OqBCyILwspWJyZk0j0c8gbxtcsEI53cQMbhbkL8=";
  };
  */
in
{
  # amdgpu instability with context switching between compute and graphics
  # https://bbs.archlinux.org/viewtopic.php?id=301798
  # side-effects: plymouth fails to show at boot, but does not interfere with booting
  boot.extraModulePackages = [
    (amdgpu-kernel-module.overrideAttrs (_: {
      patches = [
        amdgpu-stability-patch
      ];
    }))
  ];
}
