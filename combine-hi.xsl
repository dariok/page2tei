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
               <xsl:when test="current-group()[self::tei:hi]">
                  <xsl:variable name="firstHi" select="current-group()[self::tei:hi][1]" />
                  
                  <xsl:sequence select="current-group() intersect $firstHi/preceding-sibling::node()" />
                  <hi>
                     <xsl:sequence select="$firstHi/@style" />
                     <xsl:apply-templates
                        select="$firstHi | current-group()[position() != last()] intersect $firstHi/following-sibling::node()"
                        mode="do-combine-hi" />
                     <xsl:if test="count(current-group()) gt 1 and current-group()[last()] != ' '">
                        <xsl:apply-templates select="current-group()[last()]" mode="do-combine-hi" />
                     </xsl:if>
                  </hi>
                  <xsl:if test="current-group()[last()] = ' '">
                     <xsl:text> </xsl:text>
                  </xsl:if>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates select="current-group()" mode="combine-hi"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each-group>
      </xsl:copy>
   </xsl:template>
   
   <xsl:template match="tei:hi" mode="do-combine-hi">
      <xsl:apply-templates mode="combine-hi"/>
   </xsl:template>
   
   <xsl:template match="@* | node()" mode="combine-hi do-combine-hi">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="#current"/>
      </xsl:copy>
   </xsl:template>
</xsl:stylesheet>