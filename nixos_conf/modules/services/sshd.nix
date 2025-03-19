{ lib, config, ... }: {
  options = {
    sshd.configure = lib.mkOption "configures and enables sshd";
  };
  config = lib.mkIf config.sshd.configure {
    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
      settings.PermitRootLogin = "no";
    };
  };
}
