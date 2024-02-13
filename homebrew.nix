{ pkgs, ... }: {
  homebrew = {
    enable = true;

    caskArgs.no_quarantine = true;
    global.brewfile = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      # cleanup = "none"; ## be careful if changing this
      cleanup = "zap";
    };

    masApps = { };

    casks = [
      "android-studio"
      "jetbrains-toolbox"
      "pgadmin4"
      "postman"
      "vnc-viewer"
      "google-chrome"
      "./casks/docker.rb"
      "visual-studio-code"
      "zoom"

      ## used by EC2 MacOS
      "amazon-ssm-agent"
      "ec2-macos-init"
      "ec2-macos-utils"
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
      "dotnet"
      "postgresql@16"
      "kubernetes-cli"
      "minikube"
      "nvm"
      "krew"
      "k9s"
      "sdkman-cli"
    ];

    taps = [
      "sdkman/tap"
    ];

  };
}


# https://stackoverflow.com/questions/44654216/correct-way-to-install-psql-without-full-postgres-on-macos
