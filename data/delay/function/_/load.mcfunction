#>delay:_/load
#--------------------
# @PRE_LOAD
#--------------------

# load
scoreboard players set *delay load-status 1

# settings
execute unless data storage delay:settings {PERSIST:true} run function delay:settings

#declare storage delay:var
#declare storage delay:in
#declare storage delay:out
#declare storage delay:data

# scoreboards
scoreboard objectives add -delay dummy
scoreboard objectives add --delay dummy

# tick
schedule clear delay:_/tick
function delay:_/tick