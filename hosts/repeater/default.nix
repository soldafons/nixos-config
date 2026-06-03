{ config, pkgs, ... }: {
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../modules
  ];
  # Hostname
  networking.hostName = "repeater";
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # System version
  system.stateVersion = "25.11";
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Enable earlyOOM
  services = {
    earlyoom.enable = true;
    xserver.videoDrivers = [ "amdgpu" ];
    hardware.openrgb = {
      motherboard = "amd";
    };
  };
  # Microcode + firmware
  hardware = {
    # Microcode
    cpu.amd.updateMicrocode = true;
    # Firmware
    enableRedistributableFirmware = true;
    # Enable OpenGL
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
  boot = {
    kernelParams = [ "amd_pstate=active" ];
    initrd.kernelModules = [ "amdgpu" ];
  };
}

