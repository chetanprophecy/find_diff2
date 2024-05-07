for line in `find ./ -type f -name "*.appconf"`; do air sandbox lock $line; sed -i 's/pub_dxf_4_0_4_0/pub_dxf_4_0/g' $line; done
