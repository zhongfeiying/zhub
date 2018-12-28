function mkdir(...)
end
function trace_out(...)
end
require "trade"
local str = trade.get_trades_str("gxy")
print(str)
print(string.len(str) .. "\n")
