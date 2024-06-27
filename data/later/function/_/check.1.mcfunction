#>later:_/check.1

$data modify storage later:var check.executing_tasks append from storage later:data tasks[{time:$(current_time)}]
$data remove storage later:data tasks[{time:$(current_time)}]