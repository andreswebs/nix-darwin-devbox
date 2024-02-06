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

    ];

    taps = [

    ];

  };
}
