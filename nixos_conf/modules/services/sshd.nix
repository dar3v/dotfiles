{ lib, config, ... }: {
  options = {
    sshd.configure = lib.mkEnableOption "configures and enables sshd";
  };
  config = lib.mkIf config.sshd.configure {
    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
      settings.PermitRootLogin = "no";
    };
  };
}
