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
         <xd:p><xd:b>Created on:</xd:b> 2025-06-04</xd:p>
         <xd:p><xd:b>Author:</xd:b> stephan.kurz@oeaw.ac.at</xd:p>
         <xd:p>resolve @wikiData against lobid and write into standOff</xd:p>
      </xd:desc>
   </xd:doc>
   
   <xsl:mode on-no-match="shallow-copy"/>
   
   <xd:doc>
      <xd:desc>static parameter for base url</xd:desc>
   </xd:doc>
   <xsl:variable name="lobid-baseurl" select="'https://lobid.org/gnd/search?q='"/>
   <xsl:variable name="cdt" select="format-date(current-date(), '[Y]-[M,2]-[D,2]')"/>
   
   <xd:doc>
      <xd:desc>return @ref instead of @wikiData, linking to entity in newly created tei:standOff</xd:desc>
   </xd:doc>
   <xsl:template match="tei:rs[@type=('person', 'place', 'org')][@wikiData]">
      <xsl:copy>
         <xsl:copy-of select="@*[not(name()='wikiData')]"/>
         <xsl:attribute name="ref" select="concat('#', @wikiData)"></xsl:attribute>
         <xsl:apply-templates/>
      </xsl:copy>
   </xsl:template>
   
   <xd:doc>
      <xd:desc>query lobid</xd:desc>
      <xd:param name="id">the wikiData Q id</xd:param>
      <xd:param name="typ">entity type (person|org|place)</xd:param>
   </xd:doc>
   <xsl:template name="lobid_resolver">
      <xsl:param name="id"/>
      <xsl:param name="typ"/>
      <xsl:variable name="resolve_url" select="$lobid-baseurl||$id||'&amp;type='||$typ||'&amp;format=json:gndidentifier,preferredName,id'"/>
      <!--<xsl:if test="doc-available($resolve_url)">-->
      <xsl:variable name="payload" select="json-to-xml(unparsed-text($resolve_url))"/>
      <xsl:variable name="GNDID" select="$payload//*[@key='id']"/>
      <xsl:variable name="GNDprefLabel" select="tokenize($payload//*[@key='label'], ' \| ')[1]"/>
      <xsl:variable name="GeoNamesID" select="tokenize(tokenize($payload//*[@key='label'], ' \| ')[2], '; ')[contains(.,'geonames.org/')]"/>
         <xsl:choose>
            <xsl:when test="$typ='Person'">
               <person>
                  <xsl:attribute name="xml:id" select="$id"/>
                  <xsl:choose>
                     <xsl:when test="$GNDprefLabel"><persName><xsl:value-of select="$GNDprefLabel"/></persName></xsl:when>
                     <xsl:otherwise>
                        <xsl:comment>no match in GND</xsl:comment>
                     </xsl:otherwise>
                  </xsl:choose>
                  <idno type="WikiData"><xsl:value-of  select="'https://www.wikidata.org/wiki/'||$id"/></idno>
                  <xsl:if test="$GNDID"><idno type="GND"><xsl:value-of select="$GNDID"/></idno></xsl:if>
               </person><xsl:text>
</xsl:text>
            </xsl:when>
            <xsl:when test="$typ='PlaceOrGeographicName'">
               <place>
                  <xsl:attribute name="xml:id" select="$id"/>
                  <xsl:choose>
                     <xsl:when test="$GNDprefLabel"><placeName><xsl:value-of select="$GNDprefLabel"/></placeName></xsl:when>
                     <xsl:otherwise>
                        <xsl:comment>no match in GND</xsl:comment>
                     </xsl:otherwise>
                  </xsl:choose>
                  <idno type="WikiData"><xsl:value-of  select="'https://www.wikidata.org/wiki/'||$id"/></idno>
                  <xsl:if test="$GNDID"><idno type="GND"><xsl:value-of select="$GNDID"/></idno></xsl:if>
                  <xsl:if test="$GeoNamesID"><idno type="GeoNames"><xsl:value-of select="$GeoNamesID"/></idno></xsl:if>
               </place><xsl:text>
</xsl:text>
            </xsl:when>
            <xsl:when test="$typ='OrganOfCorporateBody'">
               <org>
                  <xsl:attribute name="xml:id" select="$id"/>
                  <xsl:choose>
                     <xsl:when test="$GNDprefLabel"><orgName><xsl:value-of select="$GNDprefLabel"/></orgName></xsl:when>
                     <xsl:otherwise>
                        <xsl:comment>no match in GND</xsl:comment>
                     </xsl:otherwise>
                  </xsl:choose>
                  <xsl:if test="$GNDID"><idno type="GND"><xsl:value-of select="$GNDID"/></idno></xsl:if>
                  <idno type="WikiData"><xsl:value-of  select="'https://www.wikidata.org/wiki/'||$id"/></idno>
               </org><xsl:text>
</xsl:text>
            </xsl:when>
         </xsl:choose>
      <!--</xsl:if>-->
   </xsl:template>
   
   <xd:doc>
      <xd:desc>Insert a change element into revisionDesc</xd:desc>
   </xd:doc>
   <xsl:template match="tei:teiHeader">
      <xsl:copy>
         <xsl:apply-templates/>
         <revisionDesc>
            <change xml:id="chg{$cdt}" when="{$cdt}">auto-resolved wikiData entities against lobid and generated standOff</change>
         </revisionDesc>
      </xsl:copy>
   </xsl:template>
   
   <xd:doc>
      <xd:desc>Default</xd:desc>
   </xd:doc>
   <xsl:template match="tei:TEI[.//.[@wikiData]]">
      <xsl:variable name="wd_pers" select="distinct-values(.//tei:text//tei:rs[@type='person'][@wikiData]/@wikiData)"/>
      <xsl:variable name="wd_plcs" select="distinct-values(.//tei:text//tei:rs[@type='place'][@wikiData]/@wikiData)"/>
      <xsl:variable name="wd_orgs" select="distinct-values(.//tei:text//tei:rs[@type='org'][@wikiData]/@wikiData)"/>
      <xsl:copy>
         <xsl:apply-templates/>
         <standOff change="{'#chg'||$cdt}">
            <xsl:if test=".//tei:rs[@type='person'][@wikiData]">
               <listPerson>
                  <xsl:for-each select="$wd_pers">
                     <xsl:call-template name="lobid_resolver"><xsl:with-param name="id"><xsl:value-of select="."/></xsl:with-param><xsl:with-param name="typ">Person</xsl:with-param></xsl:call-template>
                  </xsl:for-each>
               </listPerson>
            </xsl:if>
            <xsl:if test=".//tei:rs[@type='place'][@wikiData]">
               <listPlace>
                  <xsl:for-each select="$wd_plcs">
                     <xsl:call-template name="lobid_resolver"><xsl:with-param name="id"><xsl:value-of select="."/></xsl:with-param><xsl:with-param name="typ">PlaceOrGeographicName</xsl:with-param></xsl:call-template>
                  </xsl:for-each>
               </listPlace>
            </xsl:if>
            <xsl:if test=".//tei:rs[@type='org'][@wikiData]">
               <listOrg>
                  <xsl:for-each select="$wd_orgs">
                     <xsl:call-template name="lobid_resolver"><xsl:with-param name="id"><xsl:value-of select="."/></xsl:with-param><xsl:with-param name="typ">OrganOfCorporateBody</xsl:with-param></xsl:call-template>
                  </xsl:for-each>
               </listOrg>
            </xsl:if>
         </standOff>
      </xsl:copy>
   </xsl:template>
   
</xsl:stylesheet>