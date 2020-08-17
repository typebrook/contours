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
    local intervals = {
        z9 =500,
        z10=200,
        z11=100,
        z12=50,
        z13=20,
        z14=10
    }
	local ele = way:Find("ele")

    for zoom, interval in pairs(intervals) do

        if (ele % interval == 0) then 
            way:Layer("contour_" .. zoom, false)
            way:AttributeNumeric("height", ele)

            local index = ele / interval
            if     index % 10 == 0 then way:AttributeNumeric("nth_line", 10)
            elseif index %  5 == 0 then way:AttributeNumeric("nth_line",  5)
            elseif index %  2 == 0 then way:AttributeNumeric("nth_line",  2)
            else                        way:AttributeNumeric("nth_line",  1)
            end
        end
    end

end
