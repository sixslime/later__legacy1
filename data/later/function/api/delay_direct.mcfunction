#> later:api > delay_direct
#--------------------
# -> command: $command
# -> ticks: int
# => targets[]: uuid
# => data: any = {}
# => failsafe: $command = ""
#--------------------
# <- result: TaskId
#--------------------
#> exactly like later:api/delay, but instead of a selector, directly specify uuid <targets>.
#--------------------
#- see later:api/delay.
#- this function is not necessarily more performant than later:api/delay, should only be used if UUIDs are already within storage data.
#--------------------
# 1 - success
# 0 - failure, <ticks> zero or negative.
#--------------------

execute unless data storage later:in delay_direct.data run data modify storage later:in delay_direct.data set value {}
execute unless data storage later:in delay_direct.failsafe run data modify storage later:in delay_direct.failsafe set value ""

execute store result score *delay_direct.ticks -later run data get storage later:in delay_direct.ticks
execute if score *delay_direct.ticks -later matches ..0 run return run function later:_/impl/delay_direct/end

function later:_/impl/delay_direct/do with storage later:in delay_direct

data remove storage later:var delay_direct
data remove storage later:in delay_direct
scoreboard players reset *delay_direct.ticks -later

return 1