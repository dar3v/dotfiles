function lock --wraps='systemctl suspend && hyprlock' --wraps='hyprlock && systemctl suspend' --description 'alias lock=systemctl suspend && hyprlock'
  systemctl suspend && hyprlock $argv
        
end
