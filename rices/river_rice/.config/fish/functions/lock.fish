function lock --wraps='systemctl suspend && waylock' --description 'alias lock=systemctl suspend && waylock'
  systemctl suspend && waylock $argv
        
end
