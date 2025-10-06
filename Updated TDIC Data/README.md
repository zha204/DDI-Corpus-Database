# Enhanced Translational Drug-Interaction Corpus (TDIC)

This repository contains an updated and enhanced version of the Translational Drug-Interaction Corpus (TDIC). This dataset has been meticulously curated to provide more granular and accurate annotations for research in biomedical natural language processing (NLP), specifically for drug-drug interaction (DDI) and drug-enzyme interaction (DEI) extraction.

## Overview

The original TDIC is a valuable resource for text mining DDI information. This version expands upon it by providing explicit, pair-level annotations for every sentence, making it more suitable for training and evaluating modern relation extraction models. Our curation process focused on disambiguating entities and interaction pairs to create a high-quality benchmark for the biomedical NLP community.

## Key Features of This Update

This dataset includes several key enhancements over the original corpus:

- **Explicit Entity Curation**: All drug names and enzyme names within each sentence have been manually curated and verified.
- **Pair-Level DDI Annotation**: For every sentence, all drug-drug pairs have been explicitly labeled as positive (interacting) or negative (non-interacting).
- **Pair-Level DEI Annotation**: Similarly, all interacted drug-enzyme pairs have been curated to identify and label interactions.
- **Detailed Mechanism Curation**: For the subset of in vitro pharmacokinetic (PK) studies, the specific mechanism of each DDI and DEI pair has been annotated (e.g., inhibition, induction, substrate).

## Dataset Structure

The data is organized into the following files. 

### `INVITRO_PK_DDI w_Drug Labels_1.xlsx` and 'INVITRO_PK_DDI w_Drug Labels_2.xlsx'
Contains the base sentences, original curations, and 
- 'entity': The name of the drug or enzyme
- 'interaction': Positive or Negative of the interaction (DDI or DEI)
from the IN VITRO PK DDI studies.


### `INVIVO_PK_DDI w_Drug Labels.xlsx` 
Contains the base sentences, original curations, and 
- 'entity': The name of the drug or enzyme
- 'interaction': Positive or Negative of the interaction (DDI or DEI)
from the IN VIVO PK DDI studies.

### `CLINICAL_DDI w_Drug Labels.xlsx` 
Contains the base sentences, original curations, and 
- 'entity': The name of the drug or enzyme
- 'interaction': Positive or Negative of the interaction (DDI or DEI)
from the CLINICAL PD DDI studies.

### `mechanisms_in_vitro.xlsx`
Contains the detailed mechanisms for each DEI pair of the in vitro PK DDI studies only.




