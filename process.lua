node_keys = { "amenity", "shop" }

-- Initialize Lua logic

function init_function()
end

-- Finalize Lua logic()
function exit_function()
end

-- Assign nodes to a layer, and set attributes, based on OSM tags

function node_function(node)
end

-- Similarly for ways

function way_function(way)
	local ele = way:Find("ele")
    local interval = nil
    if     ele % 500 == 0 then way:Layer("contour",     false); interval = 500
    elseif ele % 200 == 0 then way:Layer("contour_z10", false); interval = 200
    elseif ele % 100 == 0 then way:Layer("contour_z11", false); interval = 100
    elseif ele %  50 == 0 then way:Layer("contour_z12", false); interval =  50
    elseif ele %  20 == 0 then way:Layer("contour_z13", false); interval =  20
    else                       way:Layer("contour_z14", false); interval =  10
    end
    way:AttributeNumeric("height", ele)

    local index = ele / interval
    if     index % 10 == 0 then way:AttributeNumeric("nth_line", 10)
    elseif index %  5 == 0 then way:AttributeNumeric("nth_line",  5)
    elseif index %  2 == 0 then way:AttributeNumeric("nth_line",  2)
    else                        way:AttributeNumeric("nth_line",  1)
    end
end
