<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
  <xsl:output indent="no" omit-xml-declaration="yes" method="text" encoding="utf-8"/>
    <xsl:template match="/book">
            <xsl:for-each select="section">
                <xsl:variable name="si" select="position()"/>
                <xsl:for-each select="p">{ "index" : { "_id" : "<xsl:value-of select="/book/@religion"/>/<xsl:value-of select="/book/@author"/>/<xsl:value-of select="/book/@title"/>#<xsl:value-of select="position()"/>_<xsl:value-of select="$si"/>" } }
                { "author" : "<xsl:value-of select="/book/@author"/>", "title" : "<xsl:value-of select="/book/@title"/>", "religion" : "<xsl:value-of select="/book/@religion"/>", "section_title" : "<xsl:value-of select="../@title"/>", "index" : <xsl:value-of select="position()"/>, "section_index" : <xsl:value-of select="$si"/>, "text" : "<xsl:value-of select="."/>" }
                </xsl:for-each>
            </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>