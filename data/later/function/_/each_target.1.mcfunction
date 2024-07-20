#>later:_/each_target.1

data modify entity @s Owner set from storage later:var check.this_target
data modify storage later:data current.target set from storage later:var check.this_target
data modify storage later:data current.data set from storage later:var check.this_task.data
data modify storage later:data current.task_id set from storage later:var check.this_task.task_id

kill @s
execute on origin run scoreboard players set *run.found_target -later 1
$execute on origin at @s run $(command)