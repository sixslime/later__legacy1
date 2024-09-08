#>later:_/each_task
#--------------------
# ./check
#--------------------

data modify storage later:var check.this_task set from storage later:var check.executing_tasks[-1]

execute if data storage later:var check.this_task.targets[] run function later:_/each_target

data remove storage later:var check.executing_tasks[-1]
execute if data storage later:var check.executing_tasks[0] run function later:_/each_task