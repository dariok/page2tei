<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:tei="http://www.tei-c.org/ns/1.0"
   xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
   xmlns="http://www.tei-c.org/ns/1.0"
   exclude-result-prefixes="#all"
   version="3.0">
   <xd:doc scope="stylesheet">
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Jan 11, 2023</xd:p>
         <xd:p><xd:b>Author:</xd:b> Dario Kampkaspar (dario.kampkaspar@tu-darmstadt.de)</xd:p>
         <xd:p></xd:p>
      </xd:desc>
   </xd:doc>
   
   <xsl:template match="tei:div/*[descendant::text()]" mode="tokenize">
      <xsl:copy>
         <xsl:sequence select="@*" />
         
         <xsl:variable name="content">
            <xsl:apply-templates select="node()" mode="tokenize" />
         </xsl:variable>
         
         <xsl:apply-templates select="$content/node()" mode="combine"/>
      </xsl:copy>
   </xsl:template>
   
   <xd:doc>
      <xd:desc>Basic white space tokenisation: it’s a word if it’s not a pc or a num</xd:desc>
   </xd:doc>
   <xsl:template match="text()[normalize-space() != '']" mode="tokenize" priority="2">
      <xsl:analyze-string select="." regex="\s+">
         <xsl:matching-substring>
            <xsl:sequence select="." />
         </xsl:matching-substring>
         <xsl:non-matching-substring>
            <xsl:analyze-string select="." regex="[\.,;:\-–—„“”=\?!\[\]\(\)\*¬/]">
               <xsl:matching-substring>
                  <pc><xsl:sequence select="."></xsl:sequence></pc>
               </xsl:matching-substring>
               <xsl:non-matching-substring>
                  <xsl:analyze-string select="." regex="\d+">
                     <xsl:matching-substring>
                        <num><xsl:sequence select="." /></num>
                     </xsl:matching-substring>
                     <xsl:non-matching-substring>
                        <w><xsl:sequence select="." /></w>
                     </xsl:non-matching-substring>
                  </xsl:analyze-string>
               </xsl:non-matching-substring>
            </xsl:analyze-string>
         </xsl:non-matching-substring>
      </xsl:analyze-string>
   </xsl:template>
   
   <xd:doc>
      <xd:desc/>
   </xd:doc>
   <xsl:template match="tei:w" mode="combine" priority="2">
      <xsl:choose>
         <xsl:when test="following-sibling::*[1][self::tei:pc] = ('=', '-', '¬')
            and following-sibling::*[2][self::tei:lb]
            and following-sibling::*[3][self::tei:w[not(. = 'und')]]
            and matches(following-sibling::*[3], '^[a-zäöüßſ]')">
            <xsl:text>
               </xsl:text>
            <w>
               <xsl:sequence select="text()" />
               <xsl:sequence select="following-sibling::*[1] | following-sibling::*[2]" />
               <xsl:sequence select="following-sibling::*[3]/text()" />
            </w>
         </xsl:when>
         <xsl:when test=". != 'und'
            and matches(., '^[a-zäöüßſ]')
            and preceding-sibling::*[1][self::tei:lb]
            and preceding-sibling::*[2][self::tei:pc[. = ('=', '-', '¬')]]" />
         <xsl:otherwise>
            <xsl:sequence select="." />
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   <xd:doc>
      <xd:desc/>
   </xd:doc>
   <xsl:template match="tei:pc[. = ('=', '-',  '¬')
      and following-sibling::*[1][self::tei:lb]
      and following-sibling::*[2][self::tei:w] != 'und'
      and matches(following-sibling::*[2], '^[a-zäöüßſ]')]" mode="combine" />
   
   <xd:doc>
      <xd:desc/>
   </xd:doc>
   <xsl:template match="tei:lb[preceding-sibling::*[1][self::tei:pc[. = ('=', '-', '¬')]]
      and following-sibling::*[1][self::tei:w[. != 'und' and matches(., '^[a-zäöüßſ]')]]]"
      mode="combine" />
   
   <xd:doc>
      <xd:desc/>
   </xd:doc>
   <xsl:template match="text()[preceding-sibling::*[1][self::tei:pc[. = ('=', '-', '¬')]]
      and following-sibling::*[1][self::tei:lb]
      and following-sibling::*[2][self::tei:w[. != 'und' and matches(., '^[a-zäöüßſ]')]]]"
      mode="combine" />
   
   <xd:doc>
      <xd:desc>Default</xd:desc>
   </xd:doc>
   <xsl:template match="@* | node()" mode="tokenize combine">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="#current" />
      </xsl:copy>
   </xsl:template>
</xsl:stylesheet>