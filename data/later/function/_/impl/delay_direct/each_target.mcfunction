#> later:_/impl/delay_direct/each_target
#--------------------
# ./do
#--------------------

data modify storage later:var delay_direct.task.targets append value {}
data modify storage later:var delay.task.targets[-1].UUID set from storage later:var delay_direct.targets[-1]

data remove storage later:var delay_direct.targets[-1]
execute if data storage later:var delay_direct.targets[0] run function later:_/impl/delay_direct/each_target