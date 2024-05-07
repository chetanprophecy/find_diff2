#!/bin/ksh
#
# /Projects/clinical/pub_clinical - $PUB_CLINICAL_BIN/setup/full/data/create-day-zero-pm-files.ksh
#
# --- CHANGELOG --------------------------------------------------------------------------------------------------------
#  2016/11/12   Paul Thompson      Initial version
# --- CHANGELOG --------------------------------------------------------------------------------------------------------
#

# Derive the script name/path and include the setup initialisation script
SCRIPT_NAME=$(basename $0)
SCRIPT_PATH=$(dirname $(whence ${0}))
. ${SCRIPT_PATH%/clinical/pub_clinical/bin/*}/clinical/pub_clinical/bin/setup/include/setup-init.inc.ksh

# Print                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                a heading
print
print - "${YELLOW}Clinical Environmental Setup${PLAIN} -- Create Day Zero Files"
print -          "-----------------------------------------------------"
print

# Define a usage function
function script_usage {
	print "Usage: $SCRIPT_NAME"
	print
}

# Load the Enrichments sandbox
load_sandbox patient_matching

m_touch -m 664 $AI_MFS/mbr_match_icff_ch13.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch13.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch14.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch14.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch11.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch11.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch10p1.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch10p1.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch9p1.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch9p1.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ssn2.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ssn2.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch3.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch3.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch10.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch10.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch6.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch6.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch4.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch4.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch2.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch2.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_czip4.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_czip4.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch9.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch9.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_hic2.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_hic2.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch5.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch5.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch1.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch1.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_czip3.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_czip3.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch8.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch8.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch17p1.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch17p1.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch17.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch17.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch7.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch7.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch15.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch15.idx
m_touch -m 664 $AI_MFS/mbr_match_icff_ch19.lkp.gz
m_touch -m 664 $AI_MFS/mbr_match_icff_ch19.idx

#/*** Patient matching ref data lkp files

m_touch -m 664 $AI_MFS/mbr_first_last_nm_loc_aka.lkp
m_touch -m 664 $AI_MFS/mbr_first_nm_master_aka.lkp
m_touch -m 664 $AI_MFS/mbr_zip_ssn_hic_inv_val.lkp
m_touch -m 664 $PUB_CLINICAL_MFS/mbr_match_icff_mbr_dtl.lkp.gz
m_touch -m 664 $PUB_CLINICAL_MFS/mbr_match_icff_mbr_dtl.idx
m_touch -m 664 $PUB_CLINICAL_MFS/mbr_match_icff_mbr_cagm.lkp.gz
m_touch -m 664 $PUB_CLINICAL_MFS/mbr_match_icff_mbr_cagm_addr.lkp.gz
m_touch -m 664 $PUB_CLINICAL_MFS/mbr_match_icff_mbr_cagm_addr.idx
m_touch -m 664 $PUB_CLINICAL_MFS/mbr_match_icff_mbr_ptnt_id_addr.lkp.gz
m_touch -m 664 $PUB_CLINICAL_MFS/mbr_match_icff_mbr_ptnt_id_addr.idx
m_touch -m 664 $PUB_CLINICAL_MFS_LOOKUP/mbr_med_claim_stats.lkp.gz
m_touch -m 664 $PUB_CLINICAL_MFS_LOOKUP/mbr_med_claim_stats.idx


#/***    rule based lookups creation psets(for icff as well as for alf *************/

echo 'mbr_match_ssn2_icff_lkp.pset' > $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_mbr_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_hic2_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_czip4_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_czip3_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch9p1_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch9_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch8_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch7_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch6_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch5_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch4_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch3_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch2_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch1_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch19_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch17p1_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch17_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch15_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch14_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch13_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch11_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch10_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_ch10p1_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat
echo 'mbr_match_mbr_dtl_icff_lkp.pset' >> $AI_SERIAL_LOOKUP/icff_pset_lst.dat

echo 'mbr_match_ch10_alf_lkp.pset' >$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch10p1_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch11_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch13_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch14_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch15_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch17_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch17p1_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch19_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch1_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch2_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch3_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch4_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch5_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch6_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch7_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch8_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch9_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ch9p1_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_czip3_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_czip4_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_hic2_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_mbr_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat
echo 'mbr_match_ssn2_alf_lkp.pset' >>$AI_SERIAL_LOOKUP/alf_pset_lst.dat

