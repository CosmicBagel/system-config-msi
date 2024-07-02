function KeybindsNormal {
	echo "activating normal binds"
	sudo cp $HOME/dotfiles/keyd_normal.conf /etc/keyd/default.conf
	sudo systemctl restart keyd
}

function KeybindsGames {
	echo "activating gaming binds"
	sudo cp $HOME/dotfiles/keyd_gaming.conf /etc/keyd/default.conf
	sudo systemctl restart keyd
}

function SetPowerPerf {
	echo "activating performance power"
    sudo sed -i -E 's/^(ENABLE_LAPTOP_MODE_ON_AC=)[0-1]/\10/' /etc/laptop-mode/laptop-mode.conf
    sudo sed -i -E 's/^(ENABLE_LAPTOP_MODE_WHEN_LID_CLOSED=)[0-1]/\10/' /etc/laptop-mode/laptop-mode.conf
	sudo systemctl restart laptop-mode.service
}

function SetPowerBalanced {
	echo "activating balanced power"
    sudo sed -i -E 's/^(ENABLE_LAPTOP_MODE_ON_AC=)[0-1]/\11/' /etc/laptop-mode/laptop-mode.conf
    sudo sed -i -E 's/^(ENABLE_LAPTOP_MODE_WHEN_LID_CLOSED=)[0-1]/\11/' /etc/laptop-mode/laptop-mode.conf
	sudo systemctl restart laptop-mode.service
}

function SwitchGameConfigs {
	KeybindsGames && SetPowerPerf && sudo prime-switcher --set performance
}

function SwitchNormalConfigs {
	KeybindsNormal && SetPowerBalanced && sudo prime-switcher --set power-saving
}
