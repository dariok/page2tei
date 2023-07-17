<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:tei="http://www.tei-c.org/ns/1.0"
   xmlns:math="http://www.w3.org/2005/xpath-functions/math"
   xmlns="http://www.tei-c.org/ns/1.0"
   exclude-result-prefixes="#all"
   version="3.0">
   
   <xsl:template match="*[tei:hi]" mode="combine-hi">
      <xsl:copy>
         <xsl:sequence select="@*" />
         <xsl:for-each-group select="node()" group-adjacent="@style or normalize-space() = ''">
            <xsl:choose>
               <xsl:when test="current-group()[1][self::tei:hi]">
                  <hi>
                     <xsl:sequence select="current-group()[1]/@style" />
                     <xsl:apply-templates select="current-group()" mode="do-combine-hi" />
                  </hi>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates select="current-group()" mode="combine-hi"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each-group>
      </xsl:copy>
   </xsl:template>
   
   <xsl:template match="tei:hi" mode="do-combine-hi">
      <xsl:apply-templates />
   </xsl:template>
   <xsl:template match="@* | node()" mode="do-combine-hi">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="#current" />
      </xsl:copy>
   </xsl:template>
   
   <xsl:template match="@* | node()" mode="combine-hi">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="#current"/>
      </xsl:copy>
   </xsl:template>
</xsl:stylesheet>