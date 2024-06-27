#>later:_/each_target
#--------------------
# ./run_task
#--------------------

# has to be forward iterating to respect selector order
data modify storage later:var check.this_target set from storage later:var check.this_task.targets[0]

execute summon snowball run function later:_/each_target.1 with storage later:var check.this_task

data remove storage later:var check.this_task.targets[0]
execute if data storage later:var check.this_task.targets[] run function later:_/each_target