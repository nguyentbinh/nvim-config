local M = {}

local client_notifs = {}

local function get_notif_data(client_id, token)
  if not client_notifs[client_id] then
    client_notifs[client_id] = {}
  end

  if not client_notifs[client_id][token] then
    client_notifs[client_id][token] = {}
  end

  return client_notifs[client_id][token]
end

local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

local function update_spinner(client_id, token)
  local notif_data = get_notif_data(client_id, token)

  if notif_data.spinner then
    local new_spinner = (notif_data.spinner + 1) % #spinner_frames
    notif_data.spinner = new_spinner

    notif_data.notification = vim.notify(nil, nil, {
      hide_from_history = true,
      icon = spinner_frames[new_spinner],
      replace = notif_data.notification,
    })

    vim.defer_fn(function()
      update_spinner(client_id, token)
    end, 100)
  end
end

local function format_title(title, client_name)
  return client_name .. (#title > 0 and ": " .. title or "")
end

local function format_message(message, percentage)
  return (percentage and percentage .. "%\t" or "") .. (message or "")
end

function M.setup_progress(_, result, ctx)
  local client_id = ctx.client_id
  local client_name = vim.lsp.get_client_by_id(client_id).name

  local enable_notif = client_name ~= "null-ls"

  local val = result.value

  if not val.kind then
    return
  end

  local notif_data = get_notif_data(client_id, result.token)

  if enable_notif then
    if val.kind == "begin" then
      local message = format_message(val.message, val.percentage)

      notif_data.notification = vim.notify(message, "info", {
        title = format_title(val.title, client_name),
        icon = spinner_frames[1],
        timeout = false,
        hide_from_history = false,
      })

      notif_data.spinner = 1
      update_spinner(client_id, result.token)
    elseif val.kind == "report" and notif_data then
      notif_data.notification = vim.notify(format_message(val.message, val.percentage), "info", {
        replace = notif_data.notification,
        hide_from_history = false,
      })
    elseif val.kind == "end" and notif_data then
      notif_data.notification =
      vim.notify(val.message and format_message(val.message) or "Complete", "info", {
        icon = "",
        replace = notif_data.notification,
        timeout = 2000,
      })

      notif_data.spinner = nil
    end
  end
end

function M.setup_message(err, method, params, client_id)
  local client = vim.lsp.get_client_by_id(client_id)
  local severity = ({
    'ERROR',
    'WARN',
    'INFO',
    'DEBUG',
  })[params.type]
  vim.notify(method.message, severity, {
    title = 'LSP - ' .. client.name,
  })
end

return M
