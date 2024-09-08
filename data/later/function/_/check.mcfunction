#>later:_/check
#--------------------
# @scheduled : api/delay
#--------------------

execute store result storage later:var check.current_time int 1 run time query gametime

function later:_/check.1 with storage later:var check

execute if data storage later:var check.executing_tasks[0] run function later:_/each_task

data remove storage later:var check
scoreboard players reset *check.found_targets -later