{ pkgs, lib, config, ... }: {

  options = {
    option1 = mkOption {
      type = types.bool;
      default = false;
      description = "Enable option 1";
    };
    option2 = mkOption {
      type = types.str;
      default = "default value";
      description = "Set a value for option 2";
    };
    option3 = mkOption {
      type = types.int;
      default = 42;
      description = "Set a numerical value for option 3";
    };
  };
}
