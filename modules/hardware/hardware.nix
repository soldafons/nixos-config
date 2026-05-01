{ config, pkgs, ... }: {
  # Enable ZRam
  zramSwap = {
    enable = true;
    priority = 100;
    algorithm = "lz4";
    memoryPercent = 50;
  };
  # Enable earlyOOM
  services.earlyoom.enable = true;
  # CPU governor
  powerManagement.cpuFreqGovernor = "performance";
  # Microcode + firmware
  hardware = {
    # Microcode
    cpu.intel.updateMicrocode = true;
    # Firmware
    enableRedistributableFirmware = true;
    # Razer setup
    openrazer = {
      enable = true;
      users = ["soldafon"];
    };
    rtl-sdr.enable = true;
    # Enable OpenGL
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    # NVIDIA setup
    nvidia = {
      open = false; # open-source drivers are broken on GTX750
      modesetting.enable = true;
      nvidiaSettings = true;
      powerManagement.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;
    };
  };
  nixpkgs.config.nvidia.acceptLicense = true;
}

