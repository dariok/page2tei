<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
   xmlns:tei="http://www.tei-c.org/ns/1.0"
   xmlns:local="local"
   xmlns="http://www.tei-c.org/ns/1.0"
   exclude-result-prefixes="#all"
   version="3.0">
   <xd:doc scope="stylesheet">
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> 2022-08-03</xd:p>
         <xd:p><xd:b>Author:</xd:b> dario.kampkaspar@tu-darmstadt.de</xd:p>
         <xd:p>combine neighbouring tei:rs[@continued] separated by a tei:lb</xd:p>
      </xd:desc>
   </xd:doc>
   
   <xd:doc>
      <xd:desc>Combine continued rs</xd:desc>
   </xd:doc>
   <xsl:template match="tei:*[tei:*[@continued = 'true']]" mode="continued">
      <xsl:copy>
         <xsl:apply-templates select="@*" mode="continued" />
         <xsl:for-each-group select="node()"
               group-starting-with="tei:*[@continued eq 'true' and normalize-space(preceding::text()[1]) != '']">
            <xsl:choose>
               <xsl:when test="current-group()[1][@continued eq 'true']">
                  <xsl:variable name="final"
                     select="(current-group()[position() gt 1 and @continued = 'true'][last()], current-group()[4])[1]" />
                  <xsl:variable name="last" select="index-of(current-group(), $final)[1]"/>
                  <xsl:element name="{local-name()}">
                     <xsl:apply-templates select="@*" mode="continued" />
                     <xsl:apply-templates select="current-group()[position() le $last]" mode="rs-continued" />
                  </xsl:element>
                  <xsl:apply-templates select="current-group()[position() gt $last]" mode="continued" />
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates select="current-group()" mode="continued" />
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each-group>
      </xsl:copy>
   </xsl:template>
   
   <xd:doc>
      <xd:desc>lb will be returned unaltered</xd:desc>
   </xd:doc>
   <xsl:template match="tei:lb" mode="rs-continued">
      <lb break="no">
         <xsl:sequence select="@*" />
      </lb>
   </xsl:template>
   
   <xd:doc>
      <xd:desc>For continued rs, only return the content</xd:desc>
   </xd:doc>
   <xsl:template match="*" mode="rs-continued">
      <xsl:apply-templates select="node()" mode="continued" />
   </xsl:template>
   
   <xd:doc>
      <xd:desc>Remove @continued</xd:desc>
   </xd:doc>
   <xsl:template match="@continued" mode="continued"/>
   
   <xd:doc>
      <xd:desc>Default</xd:desc>
   </xd:doc>
   <xsl:template match="@* | node()" mode="continued">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="#current" />
      </xsl:copy>
   </xsl:template>
</xsl:stylesheet>