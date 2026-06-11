{ config, pkgs, ... }: {
  imports = [
    ./hardware.nix
    ../../modules
  ];
  # Hostname
  networking.hostName = "repeater_nv";
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # System version
  system.stateVersion = "25.11";
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Enable earlyOOM
  services = {
    earlyoom.enable = true;
    xserver.videoDrivers = ["nvidia"];
    hardware.openrgb = {
      motherboard = "intel";
    };
  };

  # CPU governor
  powerManagement.cpuFreqGovernor = "performance";
  # boot
  boot = {
    kernelParams = [
      "nvidia-drm.modeset=1"
    ];
  };
  # steam
  environment.sessionVariables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
  # Microcode + firmware
  hardware = {
    # Microcode
    cpu.intel.updateMicrocode = true;
    # Firmware
    enableRedistributableFirmware = true;
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
      package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    };
  };
  nixpkgs.config.nvidia.acceptLicense = true;
}

