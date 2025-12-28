local utils = require('new-file-template.utils')

local function config_template(relative_path, filename)
    local relative_path_list = vim.split(relative_path, '%/')
    local preceeding = relative_path_list[#relative_path_list - 1]
    local name = vim.split(filename, '%.')[1]
    return [[
{
  config,
  lib,
  ...
}:

{
  options = {
    service.]] .. preceeding .. '.' .. name .. [[.enable = lib.mkEnableOption "enables ]] .. name .. [[";
  };
  config = lib.mkIf config.service.]] .. preceeding .. '.' .. name .. [[.enable {
    |cursor|
  };
}
  ]]
end

local function base_template(relative_path, filename)
    return [[
{...}:

{
        |cursor|
}
  ]]
end

local function shell_template(relative_path, filename)
    return [[
{
  pkgs ? import <nixpkgs> { },
}:

with pkgs;

mkShell {
  nativeBuildInputs = [
    |cursor|
  ];

  buildInputs = [
  ];
}
]]
end

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function(opts)
    local template = {
        { pattern = 'shell', content = shell_template },
        { pattern = 'nixos/.*', content = config_template },
        { pattern = 'home/.*', content = config_template },
        { pattern = '.*', content = base_template },
    }

    return utils.find_entry(template, opts)
end
