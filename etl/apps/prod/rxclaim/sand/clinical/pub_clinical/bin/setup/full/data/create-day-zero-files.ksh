#!/bin/ksh
#
# /Projects/clinical/pub_clinical - $PUB_CLINICAL_BIN/setup/full/data/create-day-zero-files.ksh
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
load_sandbox enrichments

if [[ ! -e $PUB_CLINICAL_DATAHUB_SERIAL_INBOUND/ids ]]; then
	mkdir -m 2775 $PUB_CLINICAL_DATAHUB_SERIAL_INBOUND/ids
fi

if [[ ! -e $PUB_CLINICAL_DATAHUB_MFS_INBOUND/ids ]]; then
	m_mkdir -m 2775 $PUB_CLINICAL_DATAHUB_MFS_INBOUND/ids
fi

m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/cag.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/carrier.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/carrier_acct.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/clt.dat
#m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/contract_pbp.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/drug.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/gpi.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/icd9.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/icd10.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/lexis_nexis_prescriber.dat.gz
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/member_eligibility.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/mbr.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/pharmacy.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/plan.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/product.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/rcgelp.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/rcmsip.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/rcprlp.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/src_env.dat

m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/cpt_code.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/cpt_mod_code.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/snomed_cd.dat
m_touch -m 664 $PUB_CLINICAL_SERIAL_REFDATA/toc.dat
m_touch -m 664 $PUB_CLINICAL_MFS_LOOKUP/contract_pbp.dat.gz
m_touch -m 664 $PUB_CLINICAL_MFS_LOOKUP/mbr_pharma_claim_stats.lkp.gz

m_touch -m 664 $AI_SERIAL_LOOKUP/nas_to_member_dtl_max_id.lkp
m_touch -m 664 $AI_SERIAL/nsa_to_member_list_full.dat

m_touch -m 664 $AI_MFS_LOOKUP/max_med_claim_loaded_ods.dat
m_touch -m 664 $AI_MFS_LOOKUP/pharma_claim_ods_cagm_max_filled_dt.dat


m_touch -m 664 $PUB_CLINICAL_MFS/grp_elig_icff_cag_addr.lkp.gz
m_touch -m 664 $PUB_CLINICAL_MFS/grp_elig_icff_cag_addr.lkp.idx
m_touch -m 664 $PUB_CLINICAL_MFS/grp_elig_icff_ntrl_key_hash_addr_lkp.idx
m_touch -m 664 $PUB_CLINICAL_MFS/grp_elig_icff_ntrl_key_hash_addr_lkp.gz
m_touch -m 664 $PUB_CLINICAL_MFS/grp_elig_icff.lkp.gz
m_touch -m 664 $PUB_CLINICAL_MFS/grp_eligibility.lkp

m_touch -m 664 $PUB_CLINICAL_MFS_LOOKUP/contract_pbp.dat.gz

m_touch -m 664 $PUB_CLINICAL_MFS_REFDATA/lexis_nexis_prescriber.dat.gz

m_touch -m 664 $PUB_CLINICAL_MFS/mbr_elig_icff_cagm_hash_addr.lkp.gz
m_touch -m 664 $PUB_CLINICAL_MFS/mbr_elig_icff_cagm_hash_addr.lkp.idx
m_touch -m 664 $PUB_CLINICAL_MFS/mbr_elig_icff_cagm_hash_seqno_addr_lkp.gz
m_touch -m 664 $PUB_CLINICAL_MFS/mbr_elig_icff_cagm_hash_seqno_addr_lkp.idx
m_touch -m 664 $PUB_CLINICAL_MFS/mbr_elig_icff.lkp.gz




for filename in \
	cag_audit_max_sk.dat                    \
	carrier_audit_max_sk.dat                \
	carrier_acct_audit_max_sk.dat           \
	client_audit_max_sk.dat                 \
	contract_pbp_audit_max_sk.dat           \
	drug_audit_max_sk.dat                   \
	gpi_audit_max_sk.dat                    \
	icd9_audit_max_sk.dat                   \
	icd10_audit_max_sk.dat                  \
	lexis_nexis_prescriber_audit_max_sk.dat \
	member_eligibility_audit_max_sk.dat     \
	mbr_audit_max_sk.dat                    \
	pharmacy_audit_max_sk.dat               \
	plan_audit_max_sk.dat                   \
	product_audit_max_sk.dat                \
	rcmsip_audit_max_sk.dat                 \
	rcprlp_audit_max_sk.dat                 \
        rcgelp_audit_max_sk.dat                 \
	src_env_audit_max_sk.dat                \
	cpt_code_audit_max_sk.dat               \
	cpt_mod_code_audit_max_sk.dat           \
	snomed_cd_audit_max_sk.dat              \
	toc_audit_max_sk.dat
do
	if [[ ! -e $AI_SERIAL_LOOKUP/$filename ]]; then
		echo ',,0,' > $AI_SERIAL_LOOKUP/$filename
		chmod 664 $AI_SERIAL_LOOKUP/$filename
	fi
done

if [[ ! -e $AI_SERIAL_LOOKUP/nas_to_member_list_max_id.lkp ]]; then
	echo '0'    > $AI_SERIAL_LOOKUP/nas_to_member_list_max_id.lkp
	chmod 664 $AI_SERIAL_LOOKUP/nas_to_member_list_max_id.lkp
fi

touch ${AI_SERIAL_LOOKUP}/files_to_delete.dat
chmod 664 ${AI_SERIAL_LOOKUP}/files_to_delete.dat

print
print "Create day zero files complete"
print

