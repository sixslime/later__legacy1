#> later:_/impl/delay/append_target
#--------------------
# ./do
#--------------------

data modify storage later:var delay.task.targets append value {}
data modify storage later:var delay.task.targets[-1].UUID set from entity @s UUID 
