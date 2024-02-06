{ pkgs, ... }: {
  homebrew = {
    enable = true;

    caskArgs.no_quarantine = true;
    global.brewfile = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "none";
    };

    masApps = { };

    casks = [

    ];


    brews = [
      "argocd"
      "gnupg"
      "curl"
      "git"
      "htop"
      "inetutils"
      "jq"
      "p7zip"
      "unzip"
      "ossp-uuid"
      # "gcc" 
      # "make" 
      # "python@2" 
      "expect"
      "scrcpy"
      "vim"
      "wireguard-tools"
      "dotnet"
      "postgresql"
    ];

    taps = [

    ];

  };
}
