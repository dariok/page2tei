# page2tei
PAGE2TEI was created and is maintained by Dario Kampkaspar and is licensed under the MIT license.

## How to use
Apply page2tei-0.xsl to the METS File:

```
java -jar saxon9he.jar -xsl:page2tei-0.xsl -s:mets.xml -o:[your tei file].xml
```

Additional stylesheets can be applied to the output created by the basic transformation.


## Contributors
- @tboenig
- @peterstadler
- @tillgrallert
