stack_file="/tmp/hide-unhide-windows.txt"


function hide_window(){
	process=$(hyprctl activewindow -j| jq '. | {pid: .pid, class: .class, title: .title}' -c)
	pid=$(echo $process | jq '.pid')
	hyprctl dispatch movetoworkspacesilent 88,pid:$pid
	echo $process >> $stack_file
}

function show_window(){
	process=$(cat $stack_file |wofi -dmenu -i -p "select window to restore")
	[ -z $process ] && exit

	pid=$(echo $process | jq '.pid')
	[ -z $pid ] && exit

	current_workspace=$(hyprctl activeworkspace -j | jq '.id')
	hyprctl dispatch movetoworkspacesilent $current_workspace,pid:$pid

	stack=$(grep -v "$process" $stack_file)
	echo $stack> $stack_file
}


if [ ! -z $1 ]
then
	if [ "$1" == "h" ]
	then
		hide_window >> /dev/null
	else
		show_window >> /dev/null
	fi
fi
