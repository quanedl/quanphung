-- Definition enviroment
local definition_counter = 0
function Div(def)
  if def.classes:includes("definition") then
    -- Increment the theorem counter for each definition
    definition_counter = definition_counter + 1

    -- Define colored and bold theorem title with numbering (without colon)
    local title = pandoc.RawInline("html", '<span style="color:#019af1; font-weight:bold;">Định nghĩa ' .. definition_counter .. '</span>')

    -- Insert the title at the beginning of the theorem block
    table.insert(def.content, 1, pandoc.Para({title}))

    -- Apply additional block styling without italic
    def.attributes["style"] = "border-left: 4px solid #019af1; padding-left: 10px;"

    return def
  end
end

-- Theorem enviroment
local theorem_counter = 0
function Div(thm)
  if thm.classes:includes("theorem") then
    -- Increment the theorem counter for each theorem
    theorem_counter = theorem_counter + 1

    -- Define colored and bold theorem title with numbering (without colon)
    local title = pandoc.RawInline("html", '<span style="color:#019af1; font-weight:bold;">Định lý ' .. theorem_counter .. '</span>')

    -- Insert the title at the beginning of the theorem block
    table.insert(thm.content, 1, pandoc.Para({title}))

    -- Apply additional block styling without italic
    thm.attributes["style"] = "border-left: 4px solid #019af1; padding-left: 10px;"

    return thm
  end
end