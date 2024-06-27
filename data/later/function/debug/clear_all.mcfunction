#> later:debug > clear_all
#--------------------
#> cancels all delayed tasks. (wipes {later:data -> tasks})
#--------------------

data modify storage later:data tasks set value []
data modify storage later:data current set value {data:{}, task_id:0}
scoreboard players set *max_id --later 0