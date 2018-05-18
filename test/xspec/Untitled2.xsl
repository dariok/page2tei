<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:test="http://www.jenitennison.com/xslt/unit-test"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                xmlns:__x="http://www.w3.org/1999/XSL/TransformAliasAlias"
                xmlns:pkg="http://expath.org/ns/pkg"
                xmlns:impl="urn:x-xspec:compile:xslt:impl"
                xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:p="http://schema.primaresearch.org/PAGE/gts/pagecontent/2013-07-15"
                xmlns:ns2="http://www.w3.org/1999/xlink"
                xmlns:ns3="http://www.loc.gov/METS/"
                version="3.0"
                exclude-result-prefixes="pkg impl">
   <xsl:import href="file:/home/dario/eclipse-workspace/page2tei/page2tei-0.xsl"/>
   <xsl:import href="file:/home/dario/eclipse/plugins/com.oxygenxml.editor_20.0.0.v2018042410/frameworks/xspec/src/compiler/generate-tests-utils.xsl"/>
   <xsl:import href="file:/home/dario/eclipse/plugins/com.oxygenxml.editor_20.0.0.v2018042410/frameworks/xspec/src/schematron/sch-location-compare.xsl"/>
   <xsl:namespace-alias stylesheet-prefix="__x" result-prefix="xsl"/>
   <xsl:variable name="x:stylesheet-uri"
                 as="xs:string"
                 select="'file:/home/dario/eclipse-workspace/page2tei/page2tei-0.xsl'"/>
   <xsl:output name="x:report" method="xml" indent="yes"/>
   <xsl:template name="x:main">
      <xsl:message>
         <xsl:text>Testing with </xsl:text>
         <xsl:value-of select="system-property('xsl:product-name')"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="system-property('xsl:product-version')"/>
      </xsl:message>
      <xsl:result-document format="x:report">
         <xsl:processing-instruction name="xml-stylesheet">type="text/xsl" href="file:/home/dario/eclipse/plugins/com.oxygenxml.editor_20.0.0.v2018042410/frameworks/xspec/src/compiler/format-xspec-report.xsl"</xsl:processing-instruction>
         <x:report stylesheet="{$x:stylesheet-uri}" date="{current-dateTime()}">
            <xsl:call-template name="x:d5e2"/>
            <xsl:call-template name="x:d5e503"/>
            <xsl:call-template name="x:d5e524"/>
         </x:report>
      </xsl:result-document>
   </xsl:template>
   <xsl:template name="x:d5e2">
      <xsl:message>test 1 (WD)</xsl:message>
      <x:scenario>
         <x:label>test 1 (WD)</x:label>
         <xsl:call-template name="x:d5e3"/>
         <xsl:call-template name="x:d5e181"/>
         <xsl:call-template name="x:d5e398"/>
         <xsl:call-template name="x:d5e436"/>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e3">
      <xsl:message>..17320213 - p.2</xsl:message>
      <x:scenario>
         <x:label>17320213 - p.2</x:label>
         <x:context mode="text">
            <ns3:fileSec>
               <ns3:fileGrp ID="MASTER">
                  <ns3:fileGrp ID="PAGEXML">
                     <ns3:file/>
                     <ns3:file ID="PAGEXML_2"
                               SEQ="2"
                               MIMETYPE="application/xml"
                               CREATED="2018-04-09T14:31:22.000+02:00"
                               CHECKSUM=""
                               CHECKSUMTYPE="MD5">
                        <ns3:FLocat LOCTYPE="OTHER"
                                    OTHERLOCTYPE="FILE"
                                    ns2:type="simple"
                                    ns2:href="page/0002_17320213-001.xml"/>
                     </ns3:file>
                  </ns3:fileGrp>
               </ns3:fileGrp>
            </ns3:fileSec>
            <ns3:structMap ID="TRP_STRUCTMAP" TYPE="MANUSCRIPT">
               <ns3:div ID="TRP_DOC_DIV" ADMID="MD_ORIG">
                  <ns3:div ID="PAGE_2" ORDER="2" TYPE="SINGLE_PAGE">
                     <ns3:fptr>
                        <ns3:area FILEID="PAGEXML_2"/>
                     </ns3:fptr>
                  </ns3:div>
               </ns3:div>
            </ns3:structMap>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <ns3:fileSec>
                     <ns3:fileGrp ID="MASTER">
                        <ns3:fileGrp ID="PAGEXML">
                           <ns3:file/>
                           <ns3:file ID="PAGEXML_2"
                                     SEQ="2"
                                     MIMETYPE="application/xml"
                                     CREATED="2018-04-09T14:31:22.000+02:00"
                                     CHECKSUM=""
                                     CHECKSUMTYPE="MD5">
                              <ns3:FLocat LOCTYPE="OTHER"
                                          OTHERLOCTYPE="FILE"
                                          ns2:type="simple"
                                          ns2:href="page/0002_17320213-001.xml"/>
                           </ns3:file>
                        </ns3:fileGrp>
                     </ns3:fileGrp>
                  </ns3:fileSec>
                  <ns3:structMap ID="TRP_STRUCTMAP" TYPE="MANUSCRIPT">
                     <ns3:div ID="TRP_DOC_DIV" ADMID="MD_ORIG">
                        <ns3:div ID="PAGE_2" ORDER="2" TYPE="SINGLE_PAGE">
                           <ns3:fptr>
                              <ns3:area FILEID="PAGEXML_2"/>
                           </ns3:fptr>
                        </ns3:div>
                     </ns3:div>
                  </ns3:structMap>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context" mode="text"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e16">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e16">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>.</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <pb facs="#facs_2" n="2"/>
            <p facs="#facs_2_r_2_4">
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_2_tl_59" n="N001"/>
               <xsl:text>Gestern langete hier ein </xsl:text>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Express</xsl:text>
               </hi>
               <xsl:text>er von
            </xsl:text>
               <lb facs="#facs_2_tl_60" n="N002"/>
               <xsl:text>de</xsl:text>
               <unclear>
                  <xsl:text>m</xsl:text>
               </unclear>
               <xsl:text> Herrn Keene aus Spanien an /
            </xsl:text>
               <lb facs="#facs_2_tl_61" n="N003"/>
               <xsl:text>m</xsl:text>
               <unclear>
                  <xsl:text>i</xsl:text>
               </unclear>
               <xsl:text>t Zeitung / wie daß er nebst denen
            </xsl:text>
               <lb facs="#facs_2_tl_62" n="N004"/>
               <xsl:text>Herren Stert / und Godert / unseren
            </xsl:text>
               <lb facs="#facs_2_tl_63" n="N005"/>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Commissari</xsl:text>
               </hi>
               <xsl:text>en / mit denen Spanischen
            </xsl:text>
               <lb facs="#facs_2_tl_64" n="N006"/>
               <xsl:text>u</xsl:text>
               <unclear>
                  <xsl:text>n</xsl:text>
               </unclear>
               <xsl:text>terschiedliche </xsl:text>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Conferenzi</xsl:text>
               </hi>
               <xsl:text>en gehalten </xsl:text>
               <supplied reason="">
                  <xsl:text>/</xsl:text>
               </supplied>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_2_tl_65" n="N007"/>
               <xsl:text>u</xsl:text>
               <unclear>
                  <xsl:text>n</xsl:text>
               </unclear>
               <xsl:text>d darinnen grossen Fortgang gema</xsl:text>
               <supplied reason="">
                  <xsl:text>=</xsl:text>
               </supplied>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_2_tl_66" n="N008"/>
               <xsl:text>ch</xsl:text>
               <unclear>
                  <xsl:text>e</xsl:text>
               </unclear>
               <xsl:text>t hätte / um den im letzteren Friedens
            </xsl:text>
               <lb facs="#facs_2_tl_67" n="N009"/>
               <xsl:text>Bruch an beeden Seiten gelittenen Scha</xsl:text>
               <supplied reason="">
                  <xsl:text>=</xsl:text>
               </supplied>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_2_tl_68" n="N010"/>
               <xsl:text>d</xsl:text>
               <unclear>
                  <xsl:text>e</xsl:text>
               </unclear>
               <xsl:text>n zu </xsl:text>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>reguli</xsl:text>
               </hi>
               <xsl:text>ren. Selbigen Tags über</xsl:text>
               <supplied reason="">
                  <xsl:text>=</xsl:text>
               </supplied>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_2_tl_69" n="N011"/>
               <xsl:text>reichete der Herr </xsl:text>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Como</xsl:text>
               </hi>
               <xsl:text>, </xsl:text>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Agent</xsl:text>
               </hi>
               <xsl:text> vo</xsl:text>
               <unclear>
                  <xsl:text>n</xsl:text>
               </unclear>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_2_tl_70" n="N012"/>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>P</xsl:text>
                  <unclear>
                     <xsl:text>ar</xsl:text>
                  </unclear>
                  <xsl:text>ma</xsl:text>
               </hi>
               <xsl:text>, dem Staats=</xsl:text>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Secretario</xsl:text>
               </hi>
               <xsl:text>, Her</xsl:text>
               <supplied reason="">
                  <xsl:text>=</xsl:text>
               </supplied>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_2_tl_71" n="N013"/>
               <xsl:text>tzog von Neucastle / ein Schreiben vo</xsl:text>
               <supplied reason="">
                  <xsl:text>n</xsl:text>
               </supplied>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_2_tl_72" n="N014"/>
               <xsl:text>d</xsl:text>
               <unclear>
                  <xsl:text>e</xsl:text>
               </unclear>
               <xsl:text>r verwittibten Hertzogin Dorothea a</xsl:text>
               <supplied reason="">
                  <xsl:text>n</xsl:text>
               </supplied>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_2_tl_73" n="N015"/>
               <xsl:text>unseren König / worinn selbige Sr. Ma</xsl:text>
               <supplied reason="">
                  <xsl:text>=</xsl:text>
               </supplied>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_2_tl_74" n="N016"/>
               <xsl:text>jestät bekannt gemachet / daß die Staa</xsl:text>
               <supplied reason="">
                  <xsl:text>=</xsl:text>
               </supplied>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_2_tl_75" n="N017"/>
               <xsl:text>ten von </xsl:text>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Parma</xsl:text>
               </hi>
               <xsl:text>, und </xsl:text>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Piacenza</xsl:text>
               </hi>
               <xsl:text> für den
            </xsl:text>
               <lb facs="#facs_2_tl_76" n="N018"/>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Don Carlos</xsl:text>
               </hi>
               <xsl:text> in Besitz genommen wor</xsl:text>
               <supplied reason="">
                  <xsl:text>=</xsl:text>
               </supplied>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_2_tl_77" n="N019"/>
               <xsl:text>den / und zugleich ersuchet / daß Seine
            </xsl:text>
               <lb facs="#facs_2_tl_78" n="N020"/>
               <xsl:text>Majestät eine bey dieser Gelegenheit ge</xsl:text>
               <supplied reason="">
                  <xsl:text>=</xsl:text>
               </supplied>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_2_tl_79" n="N021"/>
               <xsl:text>prägte </xsl:text>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Medaille</xsl:text>
               </hi>
               <xsl:text> anzunehmen geruhen
            </xsl:text>
               <lb facs="#facs_2_tl_80" n="N022"/>
               <unclear>
                  <xsl:text>m</xsl:text>
               </unclear>
               <xsl:text>öchte.</xsl:text>
            </p>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, 3)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>.</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e181">
      <xsl:message>..17320213 - p.3</xsl:message>
      <x:scenario>
         <x:label>17320213 - p.3</x:label>
         <x:context mode="text">
            <ns3:fileSec>
               <ns3:fileGrp ID="MASTER">
                  <ns3:fileGrp ID="PAGEXML">
                     <ns3:file/>
                     <ns3:file/>
                     <ns3:file ID="PAGEXML_3"
                               SEQ="3"
                               MIMETYPE="application/xml"
                               CREATED="2018-04-09T14:31:22.000+02:00"
                               CHECKSUM=""
                               CHECKSUMTYPE="MD5">
                        <ns3:FLocat LOCTYPE="OTHER"
                                    OTHERLOCTYPE="FILE"
                                    ns2:type="simple"
                                    ns2:href="page/0003_17320213-002.xml"/>
                     </ns3:file>
                  </ns3:fileGrp>
               </ns3:fileGrp>
            </ns3:fileSec>
            <ns3:structMap ID="TRP_STRUCTMAP" TYPE="MANUSCRIPT">
               <ns3:div ID="TRP_DOC_DIV" ADMID="MD_ORIG">
                  <ns3:div ID="PAGE_3" ORDER="3" TYPE="SINGLE_PAGE">
                     <ns3:fptr>
                        <ns3:area FILEID="PAGEXML_3"/>
                     </ns3:fptr>
                  </ns3:div>
               </ns3:div>
            </ns3:structMap>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <ns3:fileSec>
                     <ns3:fileGrp ID="MASTER">
                        <ns3:fileGrp ID="PAGEXML">
                           <ns3:file/>
                           <ns3:file/>
                           <ns3:file ID="PAGEXML_3"
                                     SEQ="3"
                                     MIMETYPE="application/xml"
                                     CREATED="2018-04-09T14:31:22.000+02:00"
                                     CHECKSUM=""
                                     CHECKSUMTYPE="MD5">
                              <ns3:FLocat LOCTYPE="OTHER"
                                          OTHERLOCTYPE="FILE"
                                          ns2:type="simple"
                                          ns2:href="page/0003_17320213-002.xml"/>
                           </ns3:file>
                        </ns3:fileGrp>
                     </ns3:fileGrp>
                  </ns3:fileSec>
                  <ns3:structMap ID="TRP_STRUCTMAP" TYPE="MANUSCRIPT">
                     <ns3:div ID="TRP_DOC_DIV" ADMID="MD_ORIG">
                        <ns3:div ID="PAGE_3" ORDER="3" TYPE="SINGLE_PAGE">
                           <ns3:fptr>
                              <ns3:area FILEID="PAGEXML_3"/>
                           </ns3:fptr>
                        </ns3:div>
                     </ns3:div>
                  </ns3:structMap>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context" mode="text"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e195">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e195">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>.</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <pb facs="#facs_3" n="3"/>
            <p facs="#facs_3_TextRegion_1501850337174_559">
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_3_tl_1" n="N001"/>
               <xsl:text>nach=Mittag verfügte sich der der König
            </xsl:text>
               <lb facs="#facs_3_tl_2" n="N002"/>
               <xsl:text>mit gewöhnlichen Ceremonien nachdem
            </xsl:text>
               <lb facs="#facs_3_tl_3" n="N003"/>
               <xsl:text>Ober=Haus des Parlaments / w</xsl:text>
               <unclear>
                  <xsl:text>or</xsl:text>
               </unclear>
               <xsl:text>inn
            </xsl:text>
               <lb facs="#facs_3_tl_4" n="N004"/>
               <xsl:text>auch die Gemeine beruffen worden / die=
            </xsl:text>
               <lb facs="#facs_3_tl_5" n="N005"/>
               <xsl:text>semnach Se. Majestät durch eine l</xsl:text>
               <unclear>
                  <xsl:text>a</xsl:text>
               </unclear>
               <xsl:text>nge
            </xsl:text>
               <lb facs="#facs_3_tl_6" n="N006"/>
               <xsl:text>Ansprach den Sitz von dem Parla</xsl:text>
               <unclear>
                  <xsl:text>m</xsl:text>
               </unclear>
               <xsl:text>ent
            </xsl:text>
               <lb facs="#facs_3_tl_7" n="N007"/>
               <xsl:text>eröfneten. Heute hat das Ober=Haus
            </xsl:text>
               <lb facs="#facs_3_tl_8" n="N008"/>
               <xsl:text>schon durch eine Sr. Majestät übergebe=
            </xsl:text>
               <lb facs="#facs_3_tl_9" n="N009"/>
               <xsl:text>nen Schrift sich wegen der an selbige
            </xsl:text>
               <lb facs="#facs_3_tl_10" n="N010"/>
               <xsl:text>gethaner Ansprach bedanket / wo=
            </xsl:text>
               <lb facs="#facs_3_tl_11" n="N011"/>
               <xsl:text>von dann künftig ein mehreres zu be=
            </xsl:text>
               <lb facs="#facs_3_tl_12" n="N012"/>
               <xsl:text>richten seyn wird. Die Schiffe / der
            </xsl:text>
               <lb facs="#facs_3_tl_13" n="N013"/>
               <xsl:text>Hertzog von Lothringen / Bedford / und
            </xsl:text>
               <lb facs="#facs_3_tl_14" n="N014"/>
               <xsl:text>der Printz von Oranien von der Ost=
            </xsl:text>
               <lb facs="#facs_3_tl_15" n="N015"/>
               <xsl:text>Jndischen Compagnie / seynd die T</xsl:text>
               <unclear>
                  <xsl:text>em</xsl:text>
               </unclear>
               <xsl:text>s
            </xsl:text>
               <lb facs="#facs_3_tl_16" n="N016"/>
               <xsl:text>nach Gravesand hinabgefahren / um bey
            </xsl:text>
               <lb facs="#facs_3_tl_17" n="N017"/>
               <xsl:text>dem ersten günstigen Wind unter S</xsl:text>
               <unclear>
                  <xsl:text>e</xsl:text>
               </unclear>
               <xsl:text>gel
            </xsl:text>
               <lb facs="#facs_3_tl_18" n="N018"/>
               <xsl:text>zu gehen. Am Montag wurde in </xsl:text>
               <unclear>
                  <xsl:text>d</xsl:text>
               </unclear>
               <xsl:text>em
            </xsl:text>
               <lb facs="#facs_3_tl_19" n="N019"/>
               <xsl:text>Pallast von St. James ein grosser Raht
            </xsl:text>
               <lb facs="#facs_3_tl_20" n="N020"/>
               <xsl:text>gehalten.Mit dem Frantzösi</xsl:text>
               <unclear>
                  <xsl:text>sch</xsl:text>
               </unclear>
               <xsl:text>en
            </xsl:text>
               <lb facs="#facs_3_tl_21" n="N021"/>
               <xsl:text>Botschafter Herrn von </xsl:text>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Chavig</xsl:text>
                  <unclear>
                     <xsl:text>ty</xsl:text>
                  </unclear>
               </hi>
               <xsl:text>,
            </xsl:text>
               <lb facs="#facs_3_tl_22" n="N022"/>
               <xsl:text>werden die </xsl:text>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Conferenzi</xsl:text>
               </hi>
               <xsl:text>en eiferigst </xsl:text>
               <unclear>
                  <xsl:text>fo</xsl:text>
               </unclear>
               <xsl:text>rt=
            </xsl:text>
               <lb facs="#facs_3_tl_23" n="N023"/>
               <xsl:text>gesetzet / welchen der Kaiserl. M</xsl:text>
               <unclear>
                  <xsl:text>i</xsl:text>
               </unclear>
               <xsl:text>ni=
            </xsl:text>
               <lb facs="#facs_3_tl_24" n="N024"/>
               <xsl:text>ter Herr Graf von Kinsky öfters </xsl:text>
               <unclear>
                  <xsl:text>b</xsl:text>
               </unclear>
               <xsl:text>ey=
            </xsl:text>
               <lb facs="#facs_3_tl_25" n="N025"/>
               <xsl:text>wohnet. An vorgedachten Montag </xsl:text>
               <unclear>
                  <xsl:text>w</xsl:text>
               </unclear>
               <xsl:text>a=
            </xsl:text>
               <lb facs="#facs_3_tl_26" n="N026"/>
               <xsl:text>ren die Lords=</xsl:text>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Commissari</xsl:text>
               </hi>
               <xsl:text>en von der
            </xsl:text>
               <lb facs="#facs_3_tl_27" n="N027"/>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Admirali</xsl:text>
               </hi>
               <xsl:text>tät versammelt / und verga</xsl:text>
               <unclear>
                  <xsl:text>b</xsl:text>
               </unclear>
               <xsl:text>en
            </xsl:text>
               <lb facs="#facs_3_tl_28" n="N028"/>
               <xsl:text>dem Hauptmann Herrn Vincent </xsl:text>
               <unclear>
                  <xsl:text>d</xsl:text>
               </unclear>
               <xsl:text>as
            </xsl:text>
               <lb facs="#facs_3_tl_29" n="N029"/>
               <xsl:text>Kriegs=Schif der Sheernes / und dem
            </xsl:text>
               <lb facs="#facs_3_tl_30" n="N030"/>
               <xsl:text>Hauptmann Herrn Fytch das vom Dol=
            </xsl:text>
               <lb facs="#facs_3_tl_31" n="N031"/>
               <xsl:text>phin / jedes von 20. Canons / we</xsl:text>
               <unclear>
                  <xsl:text>lc</xsl:text>
               </unclear>
               <xsl:text>he
            </xsl:text>
               <lb facs="#facs_3_tl_32" n="N032"/>
               <xsl:text>auf das schleunigste ausgerüstet wer</xsl:text>
               <unclear>
                  <xsl:text>d</xsl:text>
               </unclear>
               <xsl:text>en
            </xsl:text>
               <lb facs="#facs_3_tl_33" n="N033"/>
               <xsl:text>müssen; der Obriste Cosby ehedessen </xsl:text>
               <unclear>
                  <xsl:text>g</xsl:text>
               </unclear>
               <xsl:text>e=
            </xsl:text>
               <lb facs="#facs_3_tl_34" n="N034"/>
               <xsl:text>wesener </xsl:text>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Gouverneur</xsl:text>
               </hi>
               <xsl:text> deren Leewaer</xsl:text>
               <unclear>
                  <xsl:text>d</xsl:text>
               </unclear>
               <xsl:text>s=
            </xsl:text>
               <lb facs="#facs_3_tl_35" n="N035"/>
               <xsl:text>Jnsulen / hatte am Samstag die E</xsl:text>
               <unclear>
                  <xsl:text>h</xsl:text>
               </unclear>
               <xsl:text>re
            </xsl:text>
               <lb facs="#facs_3_tl_36" n="N036"/>
               <xsl:text>des Königs Hand wegen dessen Ern</xsl:text>
               <unclear>
                  <xsl:text>e</xsl:text>
               </unclear>
               <xsl:text>n=
            </xsl:text>
               <lb facs="#facs_3_tl_37" n="N037"/>
               <xsl:text>nung zum Capitain / General und
            </xsl:text>
               <lb facs="#facs_3_tl_38" n="N038"/>
               <xsl:text>Haupt=</xsl:text>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Commendeur </xsl:text>
               </hi>
               <xsl:text>von Neu=Yor</xsl:text>
               <unclear>
                  <xsl:text>c</xsl:text>
               </unclear>
               <xsl:text>k /
            </xsl:text>
               <lb facs="#facs_3_tl_39" n="N039"/>
               <xsl:text>und Neu=Jersey mit denen zugehörigen
            </xsl:text>
               <lb facs="#facs_3_tl_40" n="N040"/>
               <xsl:text>Jnsulen / zu küssen / und unterthän</xsl:text>
               <unclear>
                  <xsl:text>i</xsl:text>
               </unclear>
               <xsl:text>g=
            </xsl:text>
               <lb facs="#facs_3_tl_41" n="N041"/>
               <unclear>
                  <supplied reason="">
                     <xsl:text>s</xsl:text>
                  </supplied>
                  <xsl:text>t</xsl:text>
               </unclear>
               <xsl:text>en Dank abzustatten: es hat derse</xsl:text>
               <unclear>
                  <xsl:text>l</xsl:text>
               </unclear>
               <xsl:text>be
            </xsl:text>
               <lb facs="#facs_3_tl_42" n="N042"/>
               <gap/>
               <xsl:text>ieserhalben vorhin gehabtes Regime</xsl:text>
               <unclear>
                  <xsl:text>n</xsl:text>
               </unclear>
               <xsl:text>t
            </xsl:text>
               <lb facs="#facs_3_tl_43" n="N043"/>
               <hi rend="fontFamily:Antiqua;">
                  <supplied reason="">
                     <xsl:text>R</xsl:text>
                  </supplied>
                  <xsl:text>esigni</xsl:text>
               </hi>
               <xsl:text>ret / er behaltet aber seinen Ra</xsl:text>
               <unclear>
                  <xsl:text>n</xsl:text>
               </unclear>
               <xsl:text>g</xsl:text>
            </p>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, 3)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>.</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e398">
      <xsl:message>..17320524 - p. 10</xsl:message>
      <x:scenario>
         <x:label>17320524 - p. 10</x:label>
         <x:context mode="text">
            <ns3:fileSec>
               <ns3:fileGrp ID="MASTER">
                  <ns3:fileGrp ID="PAGEXML">
                     <ns3:file/>
                     <ns3:file/>
                     <ns3:file/>
                     <ns3:file/>
                     <ns3:file/>
                     <ns3:file/>
                     <ns3:file/>
                     <ns3:file/>
                     <ns3:file/>
                     <ns3:file ID="PAGEXML_10"
                               SEQ="10"
                               MIMETYPE="application/xml"
                               CREATED="2018-04-11T18:00:20.000+02:00"
                               CHECKSUM=""
                               CHECKSUMTYPE="MD5">
                        <ns3:FLocat LOCTYPE="OTHER"
                                    OTHERLOCTYPE="FILE"
                                    ns2:type="simple"
                                    ns2:href="page/0010_17320524-009.xml"/>
                     </ns3:file>
                  </ns3:fileGrp>
               </ns3:fileGrp>
            </ns3:fileSec>
            <ns3:structMap ID="TRP_STRUCTMAP" TYPE="MANUSCRIPT">
               <ns3:div ID="TRP_DOC_DIV" ADMID="MD_ORIG">
                  <ns3:div ID="PAGE_10" ORDER="10" TYPE="SINGLE_PAGE">
                     <ns3:fptr>
                        <ns3:area FILEID="PAGEXML_10"/>
                     </ns3:fptr>
                  </ns3:div>
               </ns3:div>
            </ns3:structMap>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <ns3:fileSec>
                     <ns3:fileGrp ID="MASTER">
                        <ns3:fileGrp ID="PAGEXML">
                           <ns3:file/>
                           <ns3:file/>
                           <ns3:file/>
                           <ns3:file/>
                           <ns3:file/>
                           <ns3:file/>
                           <ns3:file/>
                           <ns3:file/>
                           <ns3:file/>
                           <ns3:file ID="PAGEXML_10"
                                     SEQ="10"
                                     MIMETYPE="application/xml"
                                     CREATED="2018-04-11T18:00:20.000+02:00"
                                     CHECKSUM=""
                                     CHECKSUMTYPE="MD5">
                              <ns3:FLocat LOCTYPE="OTHER"
                                          OTHERLOCTYPE="FILE"
                                          ns2:type="simple"
                                          ns2:href="page/0010_17320524-009.xml"/>
                           </ns3:file>
                        </ns3:fileGrp>
                     </ns3:fileGrp>
                  </ns3:fileSec>
                  <ns3:structMap ID="TRP_STRUCTMAP" TYPE="MANUSCRIPT">
                     <ns3:div ID="TRP_DOC_DIV" ADMID="MD_ORIG">
                        <ns3:div ID="PAGE_10" ORDER="10" TYPE="SINGLE_PAGE">
                           <ns3:fptr>
                              <ns3:area FILEID="PAGEXML_10"/>
                           </ns3:fptr>
                        </ns3:div>
                     </ns3:div>
                  </ns3:structMap>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context" mode="text"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e419">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e419">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>.</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <pb facs="#facs_10" n="10"/>
            <p facs="#facs_10_r_2_7">
               <xsl:text>
                </xsl:text>
               <lb facs="#facs_10_tl_75" n="N001"/>
               <xsl:text>Johann Frantz Weishaubt / ware nno 1697. </xsl:text>
               <supplied reason="">
                  <hi rend="fontFamily:Antiqua;">
                     <xsl:text>Ex-</xsl:text>
                  </hi>
               </supplied>
               <xsl:text>
                </xsl:text>
               <lb facs="#facs_10_tl_76" n="N002"/>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>peditor</xsl:text>
               </hi>
               <xsl:text> bey der hoch=ansehentl. Geheimen Stelle in Gr</xsl:text>
               <gap/>
            </p>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, 3)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>.</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e436">
      <xsl:message>..17410624 - p. 7</xsl:message>
      <x:scenario>
         <x:label>17410624 - p. 7</x:label>
         <x:context mode="text">
            <ns3:fileSec>
               <ns3:fileGrp ID="MASTER">
                  <ns3:fileGrp ID="PAGEXML">
                     <ns3:file/>
                     <ns3:file/>
                     <ns3:file/>
                     <ns3:file/>
                     <ns3:file/>
                     <ns3:file/>
                     <ns3:file ID="PAGEXML_7"
                               SEQ="7"
                               MIMETYPE="application/xml"
                               CREATED="2018-05-02T14:57:16.000+02:00"
                               CHECKSUM=""
                               CHECKSUMTYPE="MD5">
                        <ns3:FLocat LOCTYPE="OTHER"
                                    OTHERLOCTYPE="FILE"
                                    ns2:type="simple"
                                    ns2:href="page/0007_17410624-006.xml"/>
                     </ns3:file>
                  </ns3:fileGrp>
               </ns3:fileGrp>
            </ns3:fileSec>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <ns3:fileSec>
                     <ns3:fileGrp ID="MASTER">
                        <ns3:fileGrp ID="PAGEXML">
                           <ns3:file/>
                           <ns3:file/>
                           <ns3:file/>
                           <ns3:file/>
                           <ns3:file/>
                           <ns3:file/>
                           <ns3:file ID="PAGEXML_7"
                                     SEQ="7"
                                     MIMETYPE="application/xml"
                                     CREATED="2018-05-02T14:57:16.000+02:00"
                                     CHECKSUM=""
                                     CHECKSUMTYPE="MD5">
                              <ns3:FLocat LOCTYPE="OTHER"
                                          OTHERLOCTYPE="FILE"
                                          ns2:type="simple"
                                          ns2:href="page/0007_17410624-006.xml"/>
                           </ns3:file>
                        </ns3:fileGrp>
                     </ns3:fileGrp>
                  </ns3:fileSec>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context" mode="text"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e449">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e449">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>.</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <pb facs="#facs_7" n="7"/>
            <p facs="#facs_7_TextRegion_1502873594420_703">
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_7_tl_29" n="N001"/>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Information Juridique &amp; conforme aux</xsl:text>
               </hi>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_7_tl_30" n="N002"/>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Actes contre l'Imprimé récemment publié</xsl:text>
               </hi>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_7_tl_31" n="N003"/>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>sous le tître</xsl:text>
               </hi>
               <xsl:text> Rechts=gegündete Eigentum rc.
            </xsl:text>
               <lb facs="#facs_7_tl_32" n="N004"/>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Ou bien droit de Proprieté bien fondé de la</xsl:text>
               </hi>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_7_tl_33" n="N005"/>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Maison Electorale de </xsl:text>
                  <unclear>
                     <xsl:text>B</xsl:text>
                  </unclear>
                  <xsl:text>randebourg sur les Du-</xsl:text>
               </hi>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_7_tl_34" n="N006"/>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>chés &amp; Principautes de la Silesie, Jagerndorf,</xsl:text>
               </hi>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_7_tl_35" n="N007"/>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>Li</xsl:text>
                  <unclear>
                     <xsl:text>g</xsl:text>
                  </unclear>
                  <xsl:text>nitz, Brieg, Wolau, &amp; Seigneur</xsl:text>
                  <unclear>
                     <xsl:text>iesy</xsl:text>
                  </unclear>
                  <xsl:text> / ap-</xsl:text>
               </hi>
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_7_tl_36" n="N008"/>
               <hi rend="fontFamily:Antiqua;">
                  <xsl:text>partenantes. L'An 1741. </xsl:text>
               </hi>
               <xsl:text>Das St. geb. 30. kr.</xsl:text>
            </p>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, 3)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>.</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e503">
      <xsl:message>überlapp</xsl:message>
      <x:scenario>
         <x:label>überlapp</x:label>
         <x:context mode="text">
            <ns3:fileSec>
               <ns3:fileGrp ID="MASTER">
                  <ns3:fileGrp ID="PAGEXML">
                     <ns3:file/>
                     <ns3:file ID="PAGEXML_2"
                               SEQ="2"
                               MIMETYPE="application/xml"
                               CREATED="2018-05-17T15:08:03.000+02:00"
                               CHECKSUM=""
                               CHECKSUMTYPE="MD5">
                        <ns3:FLocat LOCTYPE="OTHER"
                                    OTHERLOCTYPE="FILE"
                                    ns2:type="simple"
                                    ns2:href="page/1518862020bsb10358355-2.xml"/>
                     </ns3:file>
                  </ns3:fileGrp>
               </ns3:fileGrp>
            </ns3:fileSec>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <ns3:fileSec>
                     <ns3:fileGrp ID="MASTER">
                        <ns3:fileGrp ID="PAGEXML">
                           <ns3:file/>
                           <ns3:file ID="PAGEXML_2"
                                     SEQ="2"
                                     MIMETYPE="application/xml"
                                     CREATED="2018-05-17T15:08:03.000+02:00"
                                     CHECKSUM=""
                                     CHECKSUMTYPE="MD5">
                              <ns3:FLocat LOCTYPE="OTHER"
                                          OTHERLOCTYPE="FILE"
                                          ns2:type="simple"
                                          ns2:href="page/1518862020bsb10358355-2.xml"/>
                           </ns3:file>
                        </ns3:fileGrp>
                     </ns3:fileGrp>
                  </ns3:fileSec>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context" mode="text"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e511">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e511">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>.</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <pb facs="#facs_2" n="2"/>
            <p facs="#facs_2_r_1_7">
               <xsl:text>
            </xsl:text>
               <lb facs="#facs_2_r2l10" n="N001"/>
               <sic>
                  <xsl:text>7. Maria </xsl:text>
                  <supplied reason="">
                     <xsl:text>Theresia</xsl:text>
                  </supplied>
               </sic>
               <supplied reason="">
                  <xsl:text>, geb. 4 Stpt.</xsl:text>
               </supplied>
               <xsl:text> 1716.</xsl:text>
            </p>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, 3)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>.</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e524">
      <xsl:message>weitere Elemente</xsl:message>
      <x:scenario>
         <x:label>weitere Elemente</x:label>
         <xsl:call-template name="x:d5e525"/>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e525">
      <xsl:message>..abbrev</xsl:message>
      <x:scenario>
         <x:label>abbrev</x:label>
         <x:context mode="text">
            <ns3:fileSec>
               <ns3:fileGrp ID="MASTER">
                  <ns3:fileGrp ID="PAGEXML">
                     <ns3:file ID="PAGEXML_25"
                               SEQ="25"
                               MIMETYPE="application/xml"
                               CREATED="2018-05-17T14:37:25.000+02:00"
                               CHECKSUM=""
                               CHECKSUMTYPE="MD5">
                        <ns3:FLocat LOCTYPE="OTHER"
                                    OTHERLOCTYPE="FILE"
                                    ns2:type="simple"
                                    ns2:href="page/HS_115_25_object_128293-1.xml"/>
                     </ns3:file>
                  </ns3:fileGrp>
               </ns3:fileGrp>
            </ns3:fileSec>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <ns3:fileSec>
                     <ns3:fileGrp ID="MASTER">
                        <ns3:fileGrp ID="PAGEXML">
                           <ns3:file ID="PAGEXML_25"
                                     SEQ="25"
                                     MIMETYPE="application/xml"
                                     CREATED="2018-05-17T14:37:25.000+02:00"
                                     CHECKSUM=""
                                     CHECKSUMTYPE="MD5">
                              <ns3:FLocat LOCTYPE="OTHER"
                                          OTHERLOCTYPE="FILE"
                                          ns2:type="simple"
                                          ns2:href="page/HS_115_25_object_128293-1.xml"/>
                           </ns3:file>
                        </ns3:fileGrp>
                     </ns3:fileGrp>
                  </ns3:fileSec>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context" mode="text"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e532">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e532">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>choice, expan + abbr</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <pb facs="#facs_25" n="25"/>
            <p facs="#facs_25_r1">
               <xsl:text>
                </xsl:text>
               <lb facs="#facs_25_r1l1" n="N001"/>
               <xsl:text>12.</xsl:text>
            </p>
            <p facs="#facs_25_r2">
               <xsl:text>
                </xsl:text>
               <lb facs="#facs_25_r2l1" n="N001"/>
               <choice>
                  <expan/>
                  <abbr>
                     <xsl:text>H'r</xsl:text>
                  </abbr>
               </choice>
            </p>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, 3)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>choice, expan + abbr</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
</xsl:stylesheet>
