#> later:_/impl/delay/do
#--------------------
# @api
#--------------------

scoreboard players operation *delay.ticks -later += *time --later
execute store result storage later:var delay.task.time int 1 run scoreboard players get *delay.ticks -later

data modify storage later:var delay.task.command set from storage later:in delay.command
data modify storage later:var delay.task.data set from storage later:in delay.data

$execute as $(selector) run data modify storage later:var delay.task.targets append from entity @s UUID

execute store result storage later:var delay.task.task_id int 1 run scoreboard players get *max_id --later
scoreboard players add *max_id --later 1

data modify storage later:data tasks append from storage later:var delay.task

$schedule function later:_/check $(ticks)t