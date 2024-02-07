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
      "jetbrains-toolbox"
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
      "gcc"
      "make"
      # "python@2"
      "expect"
      "scrcpy"
      "vim"
      "wireguard-tools"
      "dotnet@6"
      "dotnet@7"
      "postgresql"
      "kubernetes-cli"
      "minikube"
    ];

    taps = [

    ];

  };
}


# https://stackoverflow.com/questions/44654216/correct-way-to-install-psql-without-full-postgres-on-macos
