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
    way:Layer("contour", false)
    way:AttributeNumeric("ele", ele)
end
