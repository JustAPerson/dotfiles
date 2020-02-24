local awful = require('awful');

local memory = {}

local function client_focus(c)
  -- do nothing if focusing client under cursor
  if mouse.current_client == c then
    return
  end

  -- move mouse either to memory or centered over window
  local coords = memory[c] or { x = c.width / 2, y = c.height / 2};
  coords.x = coords.x + c.x;
  coords.y = coords.y + c.y;
  mouse.coords(coords);
end

local function client_unfocus(c)
  -- are we leaving the client under the mouse
  if mouse.current_client == c then
    -- yes then remember the relative coords
    mcoords = mouse.coords();
    memory[c] = {
      x = mcoords.x - c.x,
      y = mcoords.y - c.y,
    };
  else
    -- no then we've already moved the mouse off this window so
    -- we should clear memory
    memory[c] = nil;
  end
end

local function client_unmanage(c)
  print("test")
  memory[c] = nil;
end

client.connect_signal('focus', client_focus);
client.connect_signal('unfocus', client_unfocus);
client.connect_signal('unmanage', client_unmanage);
