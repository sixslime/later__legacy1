#>later:_/each_target.1

data modify entity @s Owner set from storage later:var check.this_target
data modify storage later:data current.data set from storage later:var check.this_task.data

kill @s
$execute on origin at @s run $(command)