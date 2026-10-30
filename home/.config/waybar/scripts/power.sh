#!/usr/bin/env bash

main() {
	local list=(
    "Lock" "Logout" "Suspend" "Hibernate" "Reboot" "Shutdown"
  )

	local opts=(
		--border-label=" Power Menu "
		--border="sharp"
		--cycle
		--ghost="Search"
		--highlight-line
		--info="inline-right"
		--reverse
	)

	local selected
	selected=$(printf "%s\n" "${list[@]}" | fzf "${opts[@]}")

	case $selected in
		Lock)      loginctl lock-session ;;
		Logout)    loginctl terminate-session "$XDG_SESSION_ID" ;;
		Suspend)   systemctl suspend ;;
		Hibernate) systemctl hibernate ;;
		Reboot)    systemctl reboot ;;
		Shutdown)  systemctl poweroff ;;
		*)         return 1 ;;
	esac
}

main
