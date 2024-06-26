#>later:_/load
#--------------------
# @PRE_LOAD
#--------------------

# load
scoreboard players set *delay load-status 1

# settings
execute unless data storage later:settings {PERSIST:true} run function later:settings

#declare storage later:var
#declare storage later:in
#declare storage later:out
#declare storage later:data

# scoreboards
scoreboard objectives add -delay dummy
scoreboard objectives add --delay dummy

# tick
schedule clear later:_/tick
function later:_/tick