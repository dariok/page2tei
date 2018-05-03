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
    xpath-default-namespace=""
    exclude-result-prefixes="xs math xd"
    version="3.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Dario Kampkaspar, dario.kampkaspar@oeaw.ac.at</xd:p>
            <xd:p>Austrian Centre for Digital Humanities http://acdh.oeaw.ac.at</xd:p>
            <xd:p></xd:p>
            <xd:p>This stylesheet, when applied to mets.xml of the PAGE output, will create (valid) TEI</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output indent="true" />
    
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
            <xsl:apply-templates select="mets:fileSec//mets:file" mode="facsimile" />
            <text>
                <body>
<!--                    <xsl:for-each></xsl:for-each>-->
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
        </zone>
    </xsl:template>
    
    <!--<xd:doc>
        <xd:desc>Create tei:zone for print space</xd:desc>
    </xd:doc>
    <xsl:template match="p:PrintSpace" mode="facsimile">
        <zone points="{p:Coords/@points}" rendition="printspace" />
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Create tei:zone for text regions</xd:desc>
    </xd:doc>
    <xsl:template match="p:TextRegion" mode="facsimile">
        <zone points="{p:Coords/@points}" renditio="TextRegion">
            
        </zone>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Create tei:zone for separators</xd:desc>
    </xd:doc>
    <xsl:template match="p:SeparatorRegion" mode="facsimile">
        
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Create tei:zone for text Graphics</xd:desc>
    </xd:doc>
    <xsl:template match="p:GraphicRegion" mode="facsimile">
        
    </xsl:template>-->
    
    <!-- Templates for PAGE, text -->
    
</xsl:stylesheet>