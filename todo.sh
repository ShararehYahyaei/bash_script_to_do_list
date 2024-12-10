#!/bin/bash

touch todolist.txt

show_nenu(){

    echo "----TODO APPLICATION------"
    echo "1.ADD NEW TASK"
    echo "2.lIST ALL TASKS"
    echo "3.MARK AS DONE "
    echo "4.SHOW DONE TASKS"
    echo "5.SHOW NOT DONE TASKS"
    echo "6.REMOVE TASK"
    echo "7.SEARCH"
    echo "8.EXIT"
}


add_task(){
    read -p "enter yout new task:" task
    echo "to do task is :$task" >> "todolist.txt"
    echo "new task added"

}


list_tasks(){
    echo "---all tasks ---"

  if [[ -s "todolist.txt" ]]; then

    nl "todolist.txt"
  else
  echo "there is no any tasks"
 
fi

}

mark_done(){

    list_tasks
    read -p "please enter your task Number :" task_number
    if  sed -n "$task_number p" "todolist.txt" | grep "to do task is"; then
    sed -i "$task_number s/to do task is/done/" "todolist.txt"
    echo "marked as done"
    else
    echo "not found"
    fi
}

show_all_donetasks(){
    echo "DONE TASKS"
    grep "done" "todolist.txt"

}
show_all_notdonetasks(){
    echo "ALL TASKS ARE NOT DONE YET"
    grep "to do task is" "todolist.txt"

}

remove_task(){

    list_tasks
    read -p "which one do you like to remove id:" remove_number
  if [[ -n "$remove_number" ]]; then
  sed -i "${remove_number}d" "todolist.txt"
  echo "YOUR TASK IS REMOVED"
 else
 echo "TASK NOT FOUND"
 fi
}
search_task(){
  list_tasks
 read -p "PLEASE ENTER YOUR SEARCH WORD: " word_key
   if [[ -f todolist.txt ]]; then
     grep -i "$word_key" "todolist.txt" || echo "No matching tasks found."
   fi
}




 while true; do
 show_nenu
 read -p "enter your request:" request
 if [[ "$request" -eq 1 ]]; then 
 echo "you chose to add new task"
 add_task

 elif [[ "$request" -eq 2 ]]; then
 
 list_tasks
 break
 elif [[ "$request" -eq 3 ]]; then
 mark_done
 break

elif [[ "$request" -eq 4 ]]; then
show_all_donetasks
break

 elif [[ "$request" -eq 5 ]]; then
 show_all_notdonetasks
 break


elif [[ "$request" -eq 6 ]]; then
remove_task
break
elif [[ "$request" -eq 7 ]]; then
  search_task
  break

elif [[ "$request" -eq 8 ]]; then

exit 0

break
 else
 echo "INVALID REQUEST"
 fi
 done