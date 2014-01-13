FONTDIR ?= /usr/share/fonts/truetype/ttf-dejavu
FONTFILE ?= DejaVuSans.ttf

IMAGES = Vector_RGB_MirantisLogo.pdf ceph-rbd.pdf ceph-rbd-openstack.pdf openstack-components.pdf fuel-components.pdf openstack-nodes.pdf libvirt-p2p-migration.pdf osd-disks.pdf

all: fuel-ceph.pdf

fuel-ceph.pdf: fuel-ceph.tex $(IMAGES)
	pdflatex $<
	pdflatex $<

%.pdf: %.svg
	inkscape -f $< -A $*.pdf

%.svg: %.txt
	./asciitosvg $< $@
