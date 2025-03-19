{lib, config, ...}: {
  options = {
    config.bluetooth.configure = lib.mkEnableOption "configures and enables bluetooth";
  };

  config = lib.mkIf config.bluetooth.configure {
    services.blueman.enable = true;
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };
  };
}
