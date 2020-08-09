#!/bin/bash
# Translate text with http://translate.yandex 
#usage:
#For translate en-ru exec srcipt without any parametres
#for translate another language just add this language as parametres.
#Example:
#`./yandex_translate fr-en ` will translate French text from buffer to english
text=`xclip -o`
if [[ $# -eq 0 ]] 
then
translate=en-ru
else
translate=$1
fi
wget -O - https://translate.yandex.net/api/v1.5/tr.json/translate --post-data="key=token_to_access_yandex_api&lang=${translate}&text=${text}" | grep -o -e "\[.\+\]" | zenity --text-info --width=450 --height=250 --title="Перевод для \"${text}\""
