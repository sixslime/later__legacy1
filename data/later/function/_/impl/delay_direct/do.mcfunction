#> later:_/impl/delay_direct/do
#--------------------
# @api
#--------------------

scoreboard players operation *delay_direct.ticks -later += *time --later
$execute store result storage later:var delay_direct.task.time int 1 run schedule function later:_/check $(ticks)t append

data modify storage later:var delay_direct.task.command set from storage later:in delay_direct.command
data modify storage later:var delay_direct.task.data set from storage later:in delay_direct.data
data modify storage later:var delay_direct.task.failsafe set from storage later:in delay_direct.failsafe

data modify storage later:var delay_direct.targets set from storage later:in delay_direct.targets
execute if data storage later:in delay_direct.targets[0] run function later:_/impl/delay_direct/each_target

execute store result storage later:var delay_direct.task.task_id int 1 run scoreboard players get *max_id --later
data modify storage later:out delay_direct.result set from storage later:var delay_direct.task.task_id
scoreboard players add *max_id --later 1

data modify storage later:data tasks append from storage later:var delay_direct.task