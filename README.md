# test-datasets: `proteomegenerator3`

This branch contains test data to be used for automated testing with the [kentsislab/proteomegenerator3](https://github.com/kentsislab/proteomegenerator3) pipeline. The test dataset is taken from the [bambu](https://www.bioconductor.org/packages/release/bioc/html/bambu.html) package. The full test data here is taken from the `aligned data` section of the test-dataset for [nf-core/nanoseq](https://github.com/nf-core/nanoseq/tree/master).

## Data

These data provide a small test dataset to test single sample and multisample modes. The associated parameters and settings to run the pipeline can be found in [`test_single_sample.config`](https://github.com/shahcompbio/proteomegenerator3/blob/main/conf/test_single_sample.config).

### Files

* `samplesheet_single_sample.csv` - Sample information sheet required for the pipeline
* `bam/` - Bam files obtained from [Pre-basecalled and nondemultiplexed data of the nf-core/nanoseq test dataset](https://github.com/apsteinberg/test-datasets/tree/nanoseq?tab=readme-ov-file#pre-basecalled-and-nondemultiplexed-data) and from the [bambu](https://www.bioconductor.org/packages/release/bioc/html/bambu.html) package (which is originally from the SG-NEx dataset).