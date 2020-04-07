# page2tei

## Installation

Clone the repository:

```sh
git clone ocrd_fileformat
cd ocrd_fileformat
```

## Using
Use the METS File for your transformation:

```
java -jar saxon9he.jar -xsl:page2tei-0.xsl -s:mets.xml PAGEXML=[the value of mets:fileGrp/@ID or @USE] PAGEprogram=[Transkribus or OCR-D -o:[your tei file].xml
```
## Example:

Transkribus mets.xml
* snippet from mets.xml

```xml
<ns3:fileGrp ID="PAGEXML">
```

```sh
java -jar saxon9he.jar -xsl:page2tei-0.xsl -s:mets.xml PAGEXML=PAGEXML PAGEprogram=Transkribus -o:[your tei file].xml
```

OCR-D mets.xml
* snippet from mets.xml
```xml
<mets:fileGrp USE="OCR-D-OCR-TESSEROCR">
```


```sh
java -jar saxon9he.jar -xsl:page2tei-0.xsl -s:mets.xml PAGEXML=OCR-D-OCR-TESSEROCR PAGEprogram=OCR-D -o:[your tei file].xml
```

