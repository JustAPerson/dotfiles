local gears = require 'gears';
local awful = require 'awful';

--- Move a client to a location within a grid
-- @param c the client to move
-- @param gx the number of columns in the grid
-- @param gy the number of rows in the grid
-- @param px the zero-indexed destination column
-- @param py the zero-indexed destination row
-- @param sx the x-size in grid-units
-- @param sy the y-size in grid-units
function client_move_to_grid(c, gx, gy, px, py, sx, sy)
  local workarea = awful.screen.focused().workarea;
  local ux = workarea.width / gx;
  local uy = workarea.height / gy;

  sx = sx or 1
  sy = sy or 1

  local geometry = {
    width = sx * ux,
    height = sy * uy,
    x = workarea.x + px * ux,
    y = workarea.y + py * uy,
  };
  c:geometry(geometry);
end

function move_to_grid(gx, gy, px, py, sx, sy)
  return function()
    if client.focus then
      client_move_to_grid(client.focus, gx, gy, px, py, sx, sy);
    end
  end;
end

local gtile_mod = { 'Mod1', 'Shift', 'Control' };
local gtile_keys = gears.table.join(
  root.keys(),
  -- full screen
  awful.key(gtile_mod, 'g', move_to_grid(1, 1, 0, 0),
            {description = 'Maximize', group = 'gTile'}),

  -- vertical halves
  awful.key(gtile_mod, 'Left', move_to_grid(2, 1, 0, 0),
    {description = '2x1 0:0 Left half', group = 'gTile'}),
  awful.key(gtile_mod, 'Right', move_to_grid(2, 1, 1, 0),
    {description = '2x1 1:0 Right half', group = 'gTile'}),

  -- horizontal halves
  awful.key(gtile_mod, 'Up', move_to_grid(1, 2, 0, 0),
            {description = '2x1 0:0 Left half', group = 'gTile'}),
  awful.key(gtile_mod, 'Down', move_to_grid(1, 2, 0, 1),
            {description = '2x1 1:0 Right half', group = 'gTile'}),

  -- four corners
  awful.key(gtile_mod, 'a', move_to_grid(2, 2, 0, 0),
           {description = '2x2 0:0 Top-left', group = 'gTile'}),
  awful.key(gtile_mod, 's', move_to_grid(2, 2, 0, 1),
           {description = '2x2 0:1 Bottom-left', group = 'gTile'}),
  awful.key(gtile_mod, 'd', move_to_grid(2, 2, 1, 0),
           {description = '2x2 1:0 Top-right', group = 'gTile'}),
  awful.key(gtile_mod, 'f', move_to_grid(2, 2, 1, 1),
           {description = '2x2 1:1 Bottom-right', group = 'gTile'}),

  -- top 4
  awful.key(gtile_mod, 'q', move_to_grid(4, 2, 0, 0),
           { description = 'Top 4', group = 'gTile' }),
  awful.key(gtile_mod, 'w', move_to_grid(4, 2, 1, 0),
           { description = 'Top 4', group = 'gTile' }),
  awful.key(gtile_mod, 'e', move_to_grid(4, 2, 2, 0),
           { description = 'Top 4', group = 'gTile' }),
  awful.key(gtile_mod, 'r', move_to_grid(4, 2, 3, 0),
           { description = 'Top 4', group = 'gTile' }),

  -- bottom 4
  awful.key(gtile_mod, 'z', move_to_grid(4, 2, 0, 1),
           { description = 'Bottom 4', group = 'gTile' }),
  awful.key(gtile_mod, 'x', move_to_grid(4, 2, 1, 1),
           { description = 'Bottom 4', group = 'gTile' }),
  awful.key(gtile_mod, 'c', move_to_grid(4, 2, 2, 1),
           { description = 'Bottom 4', group = 'gTile' }),
  awful.key(gtile_mod, 'v', move_to_grid(4, 2, 3, 1),
           { description = 'Bottom 4', group = 'gTile' }),

  -- top 8
  awful.key(gtile_mod, '1', move_to_grid(4, 4, 0, 0),
            { description = 'Top 8', group = 'gTile' }),
  awful.key(gtile_mod, '2', move_to_grid(4, 4, 0, 1),
            { description = 'Top 8', group = 'gTile' }),
  awful.key(gtile_mod, '3', move_to_grid(4, 4, 1, 0),
            { description = 'Top 8', group = 'gTile' }),
  awful.key(gtile_mod, '4', move_to_grid(4, 4, 1, 1),
            { description = 'Top 8', group = 'gTile' }),
  awful.key(gtile_mod, '5', move_to_grid(4, 4, 2, 0),
            { description = 'Top 8', group = 'gTile' }),
  awful.key(gtile_mod, '6', move_to_grid(4, 4, 2, 1),
            { description = 'Top 8', group = 'gTile' }),
  awful.key(gtile_mod, '7', move_to_grid(4, 4, 3, 0),
            { description = 'Top 8', group = 'gTile' }),
  awful.key(gtile_mod, '8', move_to_grid(4, 4, 3, 1),
            { description = 'Top 8', group = 'gTile' }),


  awful.key(gtile_mod, '9', move_to_grid(4, 4, 0, 2),
            { description = 'Misc', group = 'gTile' }),
  awful.key(gtile_mod, '0', move_to_grid(4, 4, 0, 3),
            { description = 'Misc', group = 'gTile' }),

  -- vertical 3/4ths
  awful.key(gtile_mod, ',', move_to_grid(4, 1, 0, 0, 3, 1),
            { description = 'Left 3/4ths vertical', group = 'gTile' }),
  awful.key(gtile_mod, '.', move_to_grid(4, 1, 1, 0, 3, 1),
            { description = 'Right 3/4ths vertical', group = 'gTile' })


);
root.keys(gtile_keys);
