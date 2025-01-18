
# Later | later
> Dead-simple library/framework to delay commands while retaining entity context.
### Dependencies
- [load](https://github.com/sixslime/load)


# Usage
### Delay
The primary usage of Later is through the `later:api/delay` function. \
`later:api/delay` takes the following inputs, stored under the `later:in` storage namespace:
| NBT path | Type | Default Value |
|--|--|--|
| `delay.ticks` | int | *(none)* |
| `delay.command` | string (command) | *(none)* |
| `delay.selector` | string (selector) | "@s" |
| `delay.data` | any | {} |
| `delay.failsafe` | string (command) | "" |

Running `later:api/delay` immediatly stores the entities specified by **\<selector\>** and schedules **\<command\>** to execute AS and AT those entities after a **\<ticks\>** tick delay. \
**\<data\>** is stored in `later:data -> current.data` when the delayed command is executed. \
If an entity captured by **\<selector\>** is missing when the delay ends, **\<failsafe\>** runs with server/no context instead (once each missing entity). \
Additionally, the UUID of the intended execution target is stored in `later:data -> current.target` when the delayed command is executed. (intended for use with **\<failsafe\>**).

`later:api/delay` will store the Task ID of the created "task" to `later:out delay.result`.

### Delay (UUID List)
Alternatively, `later:api/delay_direct` can be used with a list of entity UUIDs instead of a selector to specify targets:
| NBT path | Type | Default Value |
|--|--|--|
| `delay_direct.ticks` | int | *(none)* |
| `delay_direct.command` | string ($command) | *(none)* |
| `delay_direct.targets` | UUID[] | *(none)* |
| `delay_direct.data` | any | {} |
| `delay_direct.failsafe` | string ($command) | "" |

In all other aspects, `later:api/delay_direct` is equivalent to `later:api/delay`. (storing the Task ID in `later:out delay_direct.result`).

### Cancellation
To cancel a delayed execution, use `later:api/cancel`; which takes a single input:
| NBT path | Type | Default value |
|--|--|--|
| `cancel.task_id` | int (Task ID) | *(none)* |

This returns `0` and does nothing if no task with **\<task_id\>** is found or is already executed.

___

All `later:api/...` function reset their input values upon execution. This is important to take note of especially if multi-selectors are used, as seen in the Examples section.

## Examples

Basic usage:
```mcfunction
# make the executing entity say "hi!" in 5 seconds:
data merge storage later:in {delay:{ticks:100, command:"say hi!"}}
function later:api/delay
```
Data example:
```mcfunction
# summon test creeper:
summon creeper ~ ~ ~ {Tags:["example"]}

# pass in it's *current* health as 'data.oldhealth' input, 
data modify storage later:in delay.data.old_health set from entity @s Health
# execute a 2-second delayed tellraw command from the creeper, referencing the passed data:
data merge storage later:in {delay:{ticks:40, command:'tellraw @a ["","My health was",{"nbt":"current.data.old_health","storage":"later:data"}," two seconds ago, but now it is ",{"nbt":"Health","entity":"@s"}]', selector:"@n[type=creeper,tag=example]"}}
function later:api/delay

# say the creeper takes 5 damage in the 2-second delay window.
# the following message would appear in chat at the end of the delay:
#> My health was 20 two seconds ago, but now it is 15
```
Failsafe example:
```mcfunction
# summon test cows:
summon cow ~ ~ ~ {Tags:["example", "one"]}
summon cow ~ ~ ~ {Tags:["example", "two"]}

# execute a 5-second delayed 'say' command on the two cows, providing a different 'say' command as a failsafe:
data merge storage later:in {delay:{ticks:100, command:"say I'm an example.", selector:"@e[type=cow,tag=example]", failsafe:"say No cow found!"}}
function later:api/delay

# kill cow two:
kill @e[type=cow,tag=two]

# After 5 seconds, the following messages would appear in chat:
#> [Cow] I'm an example.
#> [Server] No cow found!
# The "[Cow]" is cow one, while the failsafe was executed for cow two, because it no longer existed when the 5 second delay was over.
```
Bad usage:
```mcfunction
# Do NOT execute api functions AS multi-selectors!
execute as @e[tag=my_targets] run function later:api/delay
#           ^ ^ ^ ^ ^ ^ ^ ^ ^ Bad!
# The inputs for later:api/delay reset after execution as the first target entity and do nothing for the rest; use the "selector" input.
```

___

<p align="center">
  <img src="https://raw.githubusercontent.com/sixslime/sixslime.github.io/refs/heads/main/info/logos/temporary_documentation.svg" width="75%" alt="Temporary Documentation Tag"/>
</p>
