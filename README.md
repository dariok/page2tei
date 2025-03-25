# page2tei
PAGE2TEI was created and is maintained by Dario Kampkaspar and is licensed under the MIT license.

## How to use
Apply page2tei-0.xsl to the METS File:

```
java -jar saxon9he.jar -xsl:page2tei-0.xsl -s:mets.xml -o:[your tei file].xml
```

Additional stylesheets can be applied to the output created by the basic transformation:
- `combine-continued.xsl` (or set parameter `combine=true()`) — try to combine entities that are split over a line break into one element
- `simplify-coordinates.xsl` (parameter `bounding-rectangles=true()` by default) — convert polygons into bounding rectangles
- `tokenize.xsl` (or set parameter `tokenize=true()`) — perform (very basic!) whitespace tokenization

## Parameters
You can set the following parameters when calling `page2tei-0.xsl` (via command line or via an oXygen scenario; in oXygen, the parameters should be marked as “XPath“):

- rs (default: `true()`): create `rs type="..."` for person/place/org (default) or `persName` etc.
- tokenize (default: `false()`): Whether to run white space tokenization
- combine (default: `false()`): Whether to combine entities over line breaks
- ab (default: `false()`): If false(), region types that correspond to valid TEI elements will be returned as 
         this element; types that do not correspond to a TEI element will be returned as
         tei:ab[@type]. If set to true(), all region types (except for paragraph, heading) will be
         returned as tei:ab.
- word-coordinates (default: `false()`): If true(), export the (estimated) word coordinates to the facsimile section.
- bounding-rectangles (default: `true()`): Whether to create bounding rectangles from polygons (default: true())
- withoutBaseline (default: `false()`): Whether to export lines without baseline or not
- withoutTextline (default: `false()`): Whether to export regions without text lines
- unknownAttributes (default: `true()`): Whether to export custom attributes from tags that we do not know how to convert to valid TEI (true(), default) or whether to discard them (false())


## Contributors
- @tboenig
- @peterstadler
- @tillgrallert

---

Some contributions to this software were created within the scope of a project funded by the German BMBF, project ID 16TOA015A.

