{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    logiops
  ];

  # Config
  environment.etc."logid.cfg" = {
    mode = "0550";
    text = ''
      devices: (
      {
        name: "Wireless Mouse MX Master 3";
        smartshift:
        {
          on: false;
          threshold: 15;
        };
        hiresscroll:
        {
          hires: true;
          invert: false;
          target: false;
        };
        dpi: 1000;

        buttons: (
          {
            cid: 0xc3;
            action =
            {
              type: "Gestures";
              gestures: (
                {
                  direction: "None";
                  mode: "OnRelease";
                  action =
                  {
                    type: "Keypress";
                    keys: [ "KEY_LEFTCTRL", "KEY_LEFTSHIFT", "KEY_U" ]; //SHOW APPLICATIONS
                  };
                },
                {
                  direction: "Up";
                  mode: "OnRelease";
                  action =
                  {
                    type: "Keypress";
                    keys: ["KEY_LEFTMETA", "KEY_D"]; // PEEK AT DESKTOP
                  };
                }
              );
            };
          }
        );
      }
      );
    '';
  };
}
