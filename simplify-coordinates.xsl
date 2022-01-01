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
         <xd:p><xd:b>Created on:</xd:b> 2021-11-08</xd:p>
         <xd:p><xd:b>Author:</xd:b> dario.kampkaspar@tu-darmstadt.de</xd:p>
         <xd:p>evaluate coordinates within @points and turn the bounding rectangle of the polygon</xd:p>
      </xd:desc>
   </xd:doc>
   
   <xd:doc>
      <xd:desc>evaluate coordinates and return bounding rectangle</xd:desc>
   </xd:doc>
   <xsl:template match="tei:zone/@points">
      <xsl:variable name="x" as="xs:integer+" >
         <xsl:variable name="pts" as="xs:integer+">
            <xsl:variable name="t" select="local:pointsX(.)"/>
            <xsl:sequence select="$t[1], $t[last()]"/>
         </xsl:variable>
         <xsl:variable name="sorted" as="xs:integer+">
            <xsl:for-each select="$pts">
               <xsl:sort select="xs:integer(current())" />
               <xsl:value-of select="xs:integer(current())"/>
            </xsl:for-each>
         </xsl:variable>
         <xsl:sequence select="$sorted[1], xs:integer($sorted[last()] - $sorted[1]), $sorted[last()]"/>
      </xsl:variable>
      <xsl:variable name="y" as="xs:integer+" >
         <xsl:variable name="pts" as="xs:integer+">
            <xsl:variable name="t" select="local:pointsY(.)"/>
            <xsl:sequence select="$t[1], $t[last()]"/>
         </xsl:variable>
         <xsl:variable name="sorted" as="xs:integer+">
            <xsl:for-each select="$pts">
               <xsl:sort select="xs:integer(current())" />
               <xsl:value-of select="xs:integer(current())"/>
            </xsl:for-each>
         </xsl:variable>
         <xsl:sequence select="$sorted[1], xs:integer($sorted[last()] - $sorted[1]), $sorted[last()]"/>
      </xsl:variable>
      <xsl:attribute name="points">
         <xsl:value-of select="$x[1] || ',' || $y[1]"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="$x[last()] || ',' || $y[1]"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="$x[last()] || ',' || $y[last()]"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="$x[1] || ',' || $y[last()]"/>
      </xsl:attribute>
   </xsl:template>
   
   <xd:doc>
      <xd:desc>for a polygon, return a sequence of X coordinates, ordered ascending from left to right</xd:desc>
      <xd:param name="pts">the value of @points</xd:param>
   </xd:doc>
   <xsl:function name="local:pointsX" as="xs:integer+">
      <xsl:param name="pts" />
      <xsl:choose>
         <xsl:when test="$pts=''">
            <xsl:sequence select="(0, 0)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:for-each select="tokenize($pts, ' ')">
               <xsl:sort select="xs:integer(substring-before(current(), ','))" />
               <xsl:value-of select="xs:integer(substring-before(current(), ','))"/>
            </xsl:for-each>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   
   <xd:doc>
      <xd:desc>for a polygon, return a sequence of Y coordinates, ordered ascending from top to bottom</xd:desc>
      <xd:param name="pts">the value of @points</xd:param>
   </xd:doc>
   <xsl:function name="local:pointsY" as="xs:integer+">
      <xsl:param name="pts" />
      <xsl:choose>
         <xsl:when test="$pts=''">
            <xsl:sequence select="(0, 0)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:variable name="vals" select="tokenize($pts, ' ')"/>
            <xsl:for-each select="$vals">
               <xsl:sort select="xs:integer(substring-after(current(), ','))" />
               <xsl:value-of select="xs:integer(substring-after(current(), ','))"/>
            </xsl:for-each>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   
   <xd:doc>
      <xd:desc>Default</xd:desc>
   </xd:doc>
   <xsl:template match="@* | node()">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" />
      </xsl:copy>
   </xsl:template>
   
</xsl:stylesheet>