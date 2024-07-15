#>later:_/each_task
#--------------------
# ./check
#--------------------

data modify storage later:var check.this_task set from storage later:var check.executing_tasks[-1]



scoreboard players set *check.found_targets -later 0
execute if data storage later:var check.this_task.targets[] run function later:_/each_target
execute if score *check.found_targets -later matches 0 unless data storage later:var check.this_task{failsafe:""} run function later:_/failsafe with storage later:var check.this_task

data remove storage later:var check.executing_tasks[-1]
execute if data storage later:var check.executing_tasks[] run function later:_/each_task