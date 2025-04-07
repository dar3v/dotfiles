{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    tuigreet.configure = lib.mkEnableOption "configures and enables greetd with tuigreet";
  };

  # greetd dm
  config = lib.mkIf config.tuigreet.configure {
    services.greetd.enable = true;
    services.greetd.settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --remember-user-session";
        user = "greeter";
      };
    };
  };
}
