<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>


    <xsl:template match="/">
        <xsl:variable name="position_defense">
            <xsl:value-of select="'defense'"/>
        </xsl:variable>
        <xsl:variable name="position_attack">
            <xsl:value-of select="'defense'"/>
        </xsl:variable>
        <xsl:variable name="position_playground">
            <xsl:value-of select="'defense'"/>
        </xsl:variable>

        <positions>
            <position id="{$position_defense}">
                <xsl:apply-templates select="euro/teams/team">
                    <xsl:with-param name="position">
                        <xsl:value-of select="$position_attack"/>
                    </xsl:with-param>
                </xsl:apply-templates>
            </position>
            <position id="{$position_defense}">
                <xsl:apply-templates select="euro/teams/team">
                    <xsl:with-param name="position">
                        <xsl:value-of select="'attack'"/>
                     </xsl:with-param>
                </xsl:apply-templates>
            </position>
            <position id="{$position_playground}">
                <xsl:apply-templates select="euro/teams/team">
                    <xsl:with-param name="position">
                        <xsl:value-of select="'playground'"/>
                    </xsl:with-param>
                </xsl:apply-templates>
            </position>
        </positions>
    </xsl:template>

    <xsl:template match="team">
        <xsl:param name="position"/>
        <team>
            <xsl:attribute name="code">
                <xsl:value-of select="nation/short-name"/>
            </xsl:attribute>
            <xsl:apply-templates select="position[@type=$position]/player"/>
        </team>
    </xsl:template>

    <xsl:template match="player">
        <player>
            <xsl:value-of select="name/first-name"/>
            <xsl:value-of select="name/last-name"/>
        </player>
    </xsl:template>

</xsl:stylesheet>