<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:p="http://schema.primaresearch.org/PAGE/gts/pagecontent/2013-07-15"
    xmlns:mets="http://www.loc.gov/METS/"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:local="local"
    xmlns:wdb="https://github.com/dariok/wdbplus"
    exclude-result-prefixes="#all"
    version="3.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Dario Kampkaspar, dario.kampkaspar@oeaw.ac.at</xd:p>
            <xd:p>Austrian Centre for Digital Humanities http://acdh.oeaw.ac.at</xd:p>
            <xd:p></xd:p>
            <xd:p>This stylesheet, when applied to mets.xml of the PAGE output, will create (valid) TEI</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:param name="debug" select="false()" />
    
<!--    <xsl:output indent="true" />-->
    
    <xsl:include href="string-pack.xsl"/>
    
    <xd:doc>
        <xd:desc>Entry point: start at the top of METS.xml</xd:desc>
    </xd:doc>
    <xsl:template match="/mets:mets">
        <TEI>
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <xsl:apply-templates select="mets:amdSec//title" />
                    </titleStmt>
                    <publicationStmt>
                        <publisher>tranScriptorium</publisher>
                    </publicationStmt>
                    <sourceDesc>
                        <bibl><publisher>TRP document creator: <xsl:value-of select="mets:amdSec//uploader"/></publisher></bibl>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <xsl:if test="not($debug)">
                <xsl:apply-templates select="mets:fileSec//mets:fileGrp[@ID='PAGEXML']/mets:file" mode="facsimile" />
            </xsl:if>
            <text>
                <body>
                    <xsl:apply-templates select="mets:fileSec//mets:fileGrp[@ID='PAGEXML']/mets:file" mode="text" />
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <!-- Templates for trpMetaData -->
    <xd:doc>
        <xd:desc>
            <xd:p>The title within the Transkribus meta data</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="title">
        <title>
            <xsl:if test="position() = 1">
                <xsl:attribute name="type">main</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </title>
    </xsl:template>
    
    <!-- Templates for METS -->
    <xd:doc>
        <xd:desc>Create tei:facsimile with @xml:id</xd:desc>
    </xd:doc>
    <xsl:template match="mets:file" mode="facsimile">
        <xsl:variable name="file" select="document(mets:FLocat/@xlink:href, /)"/>
        <xsl:variable name="numCurr" select="position()"/>
        
        <facsimile xml:id="facs_{$numCurr}">
            <xsl:apply-templates select="$file//p:Page" mode="facsimile">
                <xsl:with-param name="imageName" select="substring-after(mets:FLocat/@xlink:href, '/')" />
                <xsl:with-param name="numCurr" select="$numCurr" tunnel="true" />
            </xsl:apply-templates>
        </facsimile>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Apply by-page</xd:desc>
    </xd:doc>
    <xsl:template match="mets:file" mode="text">
        <xsl:variable name="file" select="document(mets:FLocat/@xlink:href, /)"/>
        <xsl:variable name="numCurr" select="position()"/>
        
        <xsl:apply-templates select="$file//p:Page" mode="text">
            <xsl:with-param name="numCurr" select="$numCurr" tunnel="true" />
        </xsl:apply-templates>
    </xsl:template>
    
    <!-- Templates for PAGE, facsimile -->
    <xd:doc>
        <xd:desc>
            <xd:p>Create tei:facsimile/tei:surface</xd:p>
        </xd:desc>
        <xd:param name="imageName">
            <xd:p>the file name of the image</xd:p>
        </xd:param>
        <xd:param name="numCurr">
            <xd:p>Numerus currens of the parent facsimile</xd:p>
        </xd:param>
    </xd:doc>
    <xsl:template match="p:Page" mode="facsimile">
        <xsl:param name="imageName" />
        <xsl:param name="numCurr" tunnel="true" />
        
        <xsl:variable name="coords" select="tokenize(p:PrintSpace/p:Coords/@points, ' ')" />
        <xsl:variable name="type" select="substring-after(@imageFilename, '.')" />
        
        <!-- NOTE: up to now, lry and lry were mixed up. This is fiex here. -->
        <surface ulx="0" uly="0"
            lrx="{@imageWidth}" lry="{@imageHeight}">
            <graphic url="{substring-before($imageName, '.')||'.'||$type}" width="{@imageWidth}px" height="{@imageHeight}px"/>
            <xsl:apply-templates select="p:PrintSpace | p:TextRegion | p:SeparatorRegion | p:GraphicRegion" mode="facsimile"/>
        </surface>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>create the zones within facsimile/surface</xd:desc>
        <xd:param name="numCurr">Numerus currens of the current page</xd:param>
    </xd:doc>
    <xsl:template match="p:PrintSpace | p:TextRegion | p:SeparatorRegion | p:GraphicRegion | p:TextLine" mode="facsimile">
        <xsl:param name="numCurr" tunnel="true" />
        
        <xsl:variable name="renditionValue">
            <xsl:choose>
                <xsl:when test="local-name() = 'TextRegion'">TextRegion</xsl:when>
                <xsl:when test="local-name() = 'SeparatorRegion'">Separator</xsl:when>
                <xsl:when test="local-name() = 'GraphicRegion'">Graphic</xsl:when>
                <xsl:when test="local-name() = 'TextLine'">Line</xsl:when>
                <xsl:otherwise>printspace</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="custom" as="map(xs:string, xs:string)">
            <xsl:map>
                <xsl:for-each-group select="tokenize(@custom||' lfd {'||$numCurr, '} ')" group-by="substring-before(., ' ')">
                    <xsl:map-entry key="substring-before(., ' ')" select="string-join(substring-after(., '{'), '–')" />
                </xsl:for-each-group>
            </xsl:map>
        </xsl:variable>
        
        <xsl:if test="$renditionValue='Line'">
            <xsl:text>
                </xsl:text>
        </xsl:if>
        <zone points="{p:Coords/@points}" rendition="{$renditionValue}">
            <xsl:if test="$renditionValue != 'printspace'">
                <xsl:attribute name="xml:id"><xsl:value-of select="'facs_'||$numCurr||'_'||@id"/></xsl:attribute>
            </xsl:if>
            <xsl:if test="@type">
                <xsl:attribute name="subtype"><xsl:value-of select="@type"/></xsl:attribute>
            </xsl:if>
            <xsl:if test="map:contains($custom, 'structure')">
                <xsl:attribute name="subtype" select="substring-after(substring-before(map:get($custom, 'structure'), ';'), ':')" />
            </xsl:if>
            <xsl:apply-templates select="p:TextLine" mode="facsimile" />
            <xsl:if test="not($renditionValue= ('Line', 'Graphic', 'Separator', 'printspace'))">
                <xsl:text>
            </xsl:text>
            </xsl:if>
            
        </zone>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>create the page content</xd:desc>
        <xd:param name="numCurr">Numerus currens of the current page</xd:param>
    </xd:doc>
    <!-- Templates for PAGE, text -->
    <xsl:template match="p:Page" mode="text">
        <xsl:param name="numCurr" tunnel="true" />
        
        <pb facs="#facs_{$numCurr}" n="{$numCurr}" />
        <xsl:apply-templates select="p:TextRegion | p:SeparatorRegion | p:GraphicRegion" mode="text" />
    </xsl:template>
    
    <xd:doc>
        <xd:desc>create p per TextRegion</xd:desc>
        <xd:param name="numCurr"/>
    </xd:doc>
    <xsl:template match="p:TextRegion" mode="text">
        <xsl:param name="numCurr" tunnel="true" />
        <p facs="#facs_{$numCurr}_{@id}">
            <xsl:apply-templates select="p:TextLine" />
        </p>
    </xsl:template>
    
    <xsl:template match="p:TextLine">
        <xsl:param name="numCurr" tunnel="true" />
        
        <xsl:variable name="text" select="p:TextEquiv/p:Unicode"/>
        <xsl:variable name="custom" as="text()*">
            <xsl:for-each select="tokenize(@custom, '}')">
                <xsl:choose>
                    <xsl:when test="string-length() &lt; 1 or starts-with(., 'readingOrder') or starts-with(normalize-space(), 'structure')" />
                    <xsl:otherwise>
                        <xsl:value-of select="normalize-space()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="starts" as="map(*)">
            <xsl:map>
                <xsl:if test="count($custom) &gt; 0">
                    <xsl:for-each-group select="$custom" group-by="substring-before(substring-after(., 'offset:'), ';')">
                        <xsl:map-entry key="xs:int(current-grouping-key())" select="current-group()" />
                    </xsl:for-each-group>
                </xsl:if>
            </xsl:map>
        </xsl:variable>
        <xsl:variable name="ends" as="map(*)">
            <xsl:map>
                <xsl:if test="count($custom) &gt; 0">
                    <xsl:for-each-group select="$custom" group-by="xs:int(substring-before(substring-after(., 'offset:'), ';'))
                        + xs:int(substring-before(substring-after(., 'length:'), ';'))">
                        <xsl:map-entry key="current-grouping-key()" select="current-group()" />
                    </xsl:for-each-group>
                </xsl:if>
            </xsl:map>
        </xsl:variable>
        <xsl:variable name="prepared">
            <xsl:for-each select="0 to string-length($text)">
                <xsl:if test=". &gt; 0"><xsl:value-of select="substring($text, ., 1)"/></xsl:if>
                <xsl:for-each select="map:get($starts, .)">
                    <!--<xsl:sort select="substring-before(substring-after(.,'offset:'), ';')" order="ascending"/>-->
                    <!-- end of current tag -->
                    <xsl:sort select="xs:int(substring-before(substring-after(., 'offset:'), ';'))
                        + xs:int(substring-before(substring-after(., 'length:'), ';'))" order="descending" />
                    <xsl:sort select="substring(., 1, 3)" order="ascending" />
                    <xsl:element name="local:m">
                        <xsl:attribute name="type" select="normalize-space(substring-before(., ' '))" />
                        <xsl:attribute name="o" select="substring-after(., 'offset:')" />
                        <xsl:attribute name="pos">s</xsl:attribute>
                    </xsl:element>
                </xsl:for-each>
                <xsl:for-each select="map:get($ends, .)">
                    <xsl:sort select="substring-before(substring-after(.,'offset:'), ';')" order="descending"/>
                    <xsl:sort select="substring(., 1, 3)" order="descending"/>
                    <xsl:element name="local:m">
                        <xsl:attribute name="type" select="normalize-space(substring-before(., ' '))" />
                        <xsl:attribute name="o" select="substring-after(., 'offset:')" />
                        <xsl:attribute name="pos">e</xsl:attribute>
                    </xsl:element>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:variable>
        
        <!-- TODO parameter to create <l>...</l> - #1 -->
        <xsl:text>
            </xsl:text>
        <lb facs="#facs_{$numCurr}_{@id}" n="N{format-number(position(), '000')}"/>
        <xsl:apply-templates select="$prepared/text()[not(preceding-sibling::local:m)]" />
        <xsl:apply-templates select="$prepared/local:m[@pos='s']
            [not(preceding-sibling::local:m[1][@pos='s'])]" />
    </xsl:template>
    
    <xsl:template match="local:m[@pos='s']">
        <xsl:variable name="type">
            <xsl:choose>
                <xsl:when test="@type='textStyle'">hi</xsl:when>
                <xsl:otherwise><xsl:value-of select="@type"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="o" select="@o"/>
        
        <xsl:variable name="elem">
            <local:t>
                <xsl:sequence select="following-sibling::node()
                    intersect following-sibling::local:m[@o=$o]/preceding-sibling::node()" />
            </local:t>
        </xsl:variable>
        
        <xsl:element name="{$type}">
            <xsl:if test="$type='supplied'">
                <xsl:attribute name="reason" />
            </xsl:if>
            <xsl:if test="$type='hi'">
                <xsl:attribute name="rend" select="wdb:substring-before-if-ends(substring-after(substring-after(@o, 'length'), ';'), '}')"/>
            </xsl:if>
            
            <xsl:choose>
                <xsl:when test="$elem//local:m">
                    <xsl:apply-templates select="$elem/local:t/text()[not(preceding-sibling::local:m)]" />
                    <xsl:apply-templates select="$elem/local:t/local:m[@pos='s']
                        [not(preceding-sibling::local:m[1][@pos='s'])]" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:sequence select="$elem/local:t/node()" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
        <xsl:apply-templates select="following-sibling::local:m[@pos='e' and @o=$o]/following-sibling::node()[1][self::text()]" />
    </xsl:template>
    
    <xsl:template match="p:Metadata" mode="text" />
    
    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>
</xsl:stylesheet>