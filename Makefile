FONTDIR ?= /usr/share/fonts/truetype/ttf-dejavu
FONTFILE ?= DejaVuSans.ttf

IMAGES = Vector_RGB_MirantisLogo.pdf ceph-rbd.pdf ceph-rbd-openstack.pdf openstack-components.pdf

all: fuel-ceph.pdf

fuel-ceph.pdf: fuel-ceph.tex $(IMAGES)
	pdflatex $<
	pdflatex $<

%.pdf: %.svg
	inkscape -f $< -A $*.pdf

%.svg: %.txt
	./asciitosvg $< $@
