{ ... }: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "soldafons";
      user.email = "201345216+soldafons@users.noreply.github.com";
    };
  };
}
