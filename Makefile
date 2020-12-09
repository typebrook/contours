all: tiles

contours.o5m:
	curl -o $@ http://moi.kcwu.csie.org/osm_elevations/ele_taiwan_10_100_500-2020.o5m

contours.osm.pbf: contours.o5m
	osmconvert --out-pbf $< >$@

tiles: contours.osm.pbf
	tilemaker --input $< --output $@

contours.mbtiles: contours.osm.pbf 
	jq '.settings.compress="gzip"' config.json >tmp_config.json
	tilemaker --input $< --output $@ --config tmp_config.json
