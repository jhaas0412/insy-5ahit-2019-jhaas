<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <stats>
            <xsl:apply-templates select="//groups/group"/>
        </stats>
    </xsl:template>

    <xsl:template match="group">
        <xsl:variable name="groupid">
            <xsl:value-of select="@id"/>
        </xsl:variable>

        <xsl:for-each select="team">
            <xsl:variable name="team">
                <xsl:value-of select="."/>
            </xsl:variable>
            <team>

                <xsl:attribute name="group">
                    <xsl:value-of select="ancestor::group/@id"/>
                </xsl:attribute>
                <xsl:attribute name="code">
                    <xsl:value-of select="text()"/>
                </xsl:attribute>
                <xsl:element name="name">
                    <xsl:value-of select="//nation[short-name=$team]/name/text()"/>
                </xsl:element>
                <opponents>
                    <xsl:for-each select="//group[@id=$groupid]/team[not($team)]">
                        <team>
                            <xsl:attribute name="code">
                                <xsl:value-of select="."/>
                            </xsl:attribute>
                        </team>
                    </xsl:for-each>
                </opponents>
            </team>
        </xsl:for-each>
    </xsl:template>


</xsl:stylesheet>