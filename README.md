# page2tei

Use the METS File for your transformation:

```
java -jar saxon9he.jar -xsl:page2tei-0.xsl -s:mets.xml PAGEXML=[the value of mets:fileGrp/@ID or @USE] PAGEprogram=[Transkribus or OCR-D> [your tei file].xml
```
Example:

Transkribus mets.xml
* snippet from mets.xml
``<ns3:fileGrp ID="PAGEXML">``
```
java -jar saxon9he.jar -xsl:page2tei-0.xsl -s:mets.xml PAGEXML=PAGEXML PAGEprogram=Transkribus> [your tei file].xml
```
OCR-D mets.xml
* snippet from mets.xml
``<mets:fileGrp USE="OCR-D-OCR-TESSEROCR">``

```
java -jar saxon9he.jar -xsl:page2tei-0.xsl -s:mets.xml PAGEXML=OCR-D-OCR-TESSEROCR PAGEprogram=OCR-D> [your tei file].xml
```

