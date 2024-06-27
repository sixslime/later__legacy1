#> later:api > cancel
#--------------------
# -> task_id: TaskId
#--------------------
# -> result: Task
#--------------------
#> cancels the execution of the delayed command (task) that has <task_id>.
#--------------------
#- a task's TaskId is returned from later:api/delay
#--------------------
# 1 - success
# 0 - no task with <task_id> exists. (it may have already been executed)
#--------------------

function later:_/impl/cancel/do with storage later:in cancel

data remove storage later:in cancel

return run scoreboard players get *cancel.return --later