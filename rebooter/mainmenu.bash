#!/bin/bash
OPTION=$(whiptail --title "Меню обслуживания рабочей станции" --menu "Версия: $(cat $(pwd)/data/version)" 14 60 6 --notags --nocancel \
"1" "Состояние сети" \
"2" "Выполнить сценарий" \
"3" "Резервное восстановление системы" \
"4" "Резервное копирование системы" \
"5" "Дополнительные возможности" \
"6" "Завершение работы"  3>&1 1>&2 2>&3)

case $OPTION in
1)
source $(pwd)/network.fn; network
exit 0
;;
2)
source $(pwd)/scenario.fn; scenario
exit 0
;;
3)
bash $(pwd)/restorer.fn
exit 0
;;
4)
bash $(pwd)/backuper.bash
exit 0
;;
5)
bash $(pwd)/anotheroptions
exit 0
;;
6)

	OPTION2=$(whiptail --title "Завершение работы" --menu "Сделайте ваш выбор" 10 60 2 --notags --cancel-button Назад \
	"1" "Выполнить завершение работы" \
	"2" "Выполнить выполнить перезагрузку" 3>&1 1>&2 2>&3)
	exitstatus=$?

	if [ $exitstatus = 0 ]; then

		case $OPTION2 in
		1)
		echo "sudo shutdown -h now"
		;;
		2)
		echo "sudo reboot"
		;;
		esac
	else
		bash $(pwd)/mainmenu.bash
		exit 0
	fi
	exit 0
;;
esac

