logged_error = ""

function processOutput(result)
    if result.stdout == "" then
        if logged_error ~= result.stderr then
            local log_msg = string.format("command plugin error: %s", result.stderr)
            noctalia.log(log_msg)
            logged_error = result.stderr
        end
        barWidget.setText("<error>")
    else
        barWidget.setText(result.stdout)
    end
end

function update()
    noctalia.setUpdateInterval(1000)
    local command = noctalia.getConfig("command")
    noctalia.runAsync(command, processOutput)
end
