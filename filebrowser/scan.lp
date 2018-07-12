<% 
response_contenttype = "application/json"
local lfs = _G.require("lfs")
local luaext = _G.require("luaext")
function scan(rootPath)
local files = {}
    for entry in lfs.dir(rootPath) do
        if entry~='.' and entry~='..' then
            local path = rootPath .."/" ..entry
            local attr = lfs.attributes(path)
            --assert(type(attr)=="table") --如果获取不到属性表则报错
            -- PrintTable(attr)
            if(attr.mode == "directory") then
							 local temp = {}
							 files[#files + 1] = temp
               temp.name = luaext.a2u8(entry)
							 temp.type = "folder" 
               temp.path = luaext.a2u8(rootPath .. "/" .. entry)
							 temp.items = scan(rootPath .. "/" .. entry)
            elseif attr.mode=="file" then
							 local temp =  {}
							 files[#files + 1] = temp
							 temp.name = luaext.a2u8(entry) 
							 temp.type = "file"
							 temp.path = luaext.a2u8(rootPath .. "/" .. entry)
							 temp.size = attr.size
            end
        end
    end
return files
end

local rootpath = "files"
local allFilePath = scan(rootpath)
local t = {}
t.name = "files"
t.type = "folder"
t.path = "files"	
t.items = allFilePath
%>
<%=json.encode(t) %>
