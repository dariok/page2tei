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
   <xsl:template match="tei:*[tei:rs[@continued]]">
      <xsl:copy>
         <xsl:apply-templates select="@*" />
         <xsl:for-each-group select="node()" group-starting-with="tei:rs[@continued eq 'true'
            and preceding::text()[1]/normalize-space() != '']">
            <xsl:choose>
               <xsl:when test="current-group()[1][@continued eq 'true']">
                  <xsl:variable name="final"
                     select="(current-group()[1]/following-sibling::tei:rs[@continued][last()], current-group()[1]/following-sibling::tei:rs[1])[1]" />
                  <xsl:variable name="last" select="index-of(current-group(), $final)"/>
                  <rs>
                     <xsl:apply-templates select="@*" />
                     <xsl:apply-templates select="current-group()[position() le $last]" mode="rs"/>
                  </rs>
                  <xsl:apply-templates select="current-group()[position() gt $last]" />
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates select="current-group()" />
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each-group>
      </xsl:copy>
   </xsl:template>
   
   <xd:doc>
      <xd:desc>lb will be returned unaltered</xd:desc>
   </xd:doc>
   <xsl:template match="tei:lb" mode="rs">
      <xsl:sequence select="." />
   </xsl:template>
   
   <xd:doc>
      <xd:desc>For continued rs, only return the content</xd:desc>
   </xd:doc>
   <xsl:template match="tei:rs" mode="rs">
      <xsl:apply-templates select="node()" />
   </xsl:template>
   
   <xd:doc>
      <xd:desc>Remove @continued</xd:desc>
   </xd:doc>
   <xsl:template match="@continued" />
   
   <xd:doc>
      <xd:desc>Default</xd:desc>
   </xd:doc>
   <xsl:template match="@* | node()">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" />
      </xsl:copy>
   </xsl:template>
</xsl:stylesheet>