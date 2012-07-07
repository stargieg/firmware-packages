--[[
LuCI - Lua Configuration Interface

Copyright 2012 Patrick Grimm <patrick@lunatiki.de>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id$
]]--

require("luci.sys")
require("luci.util")
require("luci.tools.webadmin")
require("luci.fs")
local arg1 = arg[1]
local uci = luci.model.uci.cursor()
local uci_state = luci.model.uci.cursor_state()
if not arg1 then
	return
end
if not luci.fs.access("/etc/config/linknx_varlist_"..arg1) then
	if not luci.sys.exec("touch /etc/config/linknx_varlist_"..arg1) then
		return
	end
end

if arg1 then
	m = Map("linknx_varlist_"..arg1, "Variablen", "Variablen")
--else
--	m = Map("linknx_varlist", "Variablen", "Variablen")
end

s = m:section(TypedSection, "pvar", arg1 or 'Variablen')
s.addremove = true
s.anonymous = true
s.template = "cbi/tblsection"

s:option(Flag, "disable", "Disable")
-- en.optional = true
s:option(Value, "name", "Name")
sval = s:option(DummyValue, "Value","Wert")
function sval.value(self, section)
	value = self.map:get(section)
	return uci_state:get('linknx_varlist',value[".name"],'value')
end

sva = s:option(ListValue, "tagname",  "Zugrifsname")
uci:foreach("linknx", "daemon",
	function (section)
			sva:value(section.tagname)
	end)

s:option(Value, "addr", "Addr")
s:option(Value, "initv", "Init Value")

sva = s:option(ListValue, "group",  "Gruppe")
local uci = luci.model.uci.cursor()
uci:foreach("linknx_group", "group",
	function (section)
			sva:value(section.name)
	end)

s:option(Value, "comment", "Anzeige Name")
s:option(Flag, "log", "Logging")
svc = s:option(Value, "event", "Alarm/Warnung/Meldung/nichts")
svc.rmempty = true
svc:value("alarm")
svc:value("warnung")
svc:value("meldung")
svc:value("nichts")
s:option(Value, "url", "Web Addresse")

return m

