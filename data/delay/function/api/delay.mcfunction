#> delay:api > delay
#--------------------
# -> command: $command
# -> ticks: int
# => selector: $selector = "@s"
# => data: any = {}
#--------------------
# <- result: TaskId
#--------------------
#> schedules <command> to run AS and AT <selector> after an amount of <ticks>.
#> {gelay:data -> current.data} will hold <data> when <command> is executed.
#--------------------
#- <selector> is evaluated using the *current* context, not the context when <command> is executed.
#- >result< is the assigned TaskId, and is used when cancelling a scheduled command.
#- <ticks> cannot be zero or negative.
#--------------------
# 1 - success
# 0 - failure, <ticks> zero or negative.
#--------------------

execute store result score *delay.ticks -delay run data get storage delay:in delay.ticks
execute if score *delay.ticks -delay matches ..-1 run return run function delay:_/impl/delay/end

function delay:_/impl/delay/do with storage delay:in delay