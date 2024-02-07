{ pkgs, ... }: {
  homebrew = {
    enable = true;

    caskArgs.no_quarantine = true;
    global.brewfile = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "none"; ## be careful if changing this
    };

    masApps = { };

    casks = [
      "android-platform-tools"
      "jetbrains-toolbox"
      "pgadmin4"
      "postman"
      "vnc-viewer"
      "google-chrome"
      "docker"
      "visual-studio-code"
      "zoom"
      "virtualbox"
    ];

    brews = [
      "argocd"
      "gnupg"
      "curl"
      "git"
      "htop"
      "inetutils"
      "mtr"
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
      "nvm"
      "krew"
      "k9s"
    ];

    taps = [

    ];

  };
}


# https://stackoverflow.com/questions/44654216/correct-way-to-install-psql-without-full-postgres-on-macos
