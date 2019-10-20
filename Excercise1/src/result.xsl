<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <result>
            <xsl:apply-templates select="//groups/group"/>
        </result>
    </xsl:template>

    <xsl:template match="group">
        <group>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:for-each select="team">
                <xsl:variable name="team">
                    <xsl:value-of select="."/>
                </xsl:variable>

                <team>
                    <xsl:attribute name="code">
                        <xsl:value-of select="text()"/>
                    </xsl:attribute>
                    <xsl:attribute name="round">
                        <xsl:value-of select="count(//match[team=$team])+1"/> --wegen gruppenphase +1
                    </xsl:attribute>
                </team>
            </xsl:for-each>

        </group>
    </xsl:template>
</xsl:stylesheet>