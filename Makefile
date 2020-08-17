contour.o5m:
	curl -o $@ http://moi.kcwu.csie.org/osm_elevations/ele_taiwan_10_100_500-2019.7.o5m

contour.osm.pbf: contour.o5m
	osmconvert --out-pbf $< >$@

tiles: contour.osm.pbf
	tilemaker --input $< --output $@
