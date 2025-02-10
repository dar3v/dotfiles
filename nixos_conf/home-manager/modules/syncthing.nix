{...}: {
  services.syncthing = {
    enable = true;
    overrideDevices = false;
    overrideFolders = false;
    settings.options.localAnnounceEnabled = true;
  };
}
